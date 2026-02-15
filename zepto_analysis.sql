DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(150),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);


-- data exploration

-- count of rows
SELECT COUNT(*) FROM zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;

-- null values
SELECT * FROM zepto 
WHERE name IS NULL 
OR
category IS NULL 
OR
mrp IS NULL 
OR
discountpercent IS NULL 
OR
availablequantity IS NULL 
OR
weightingms IS NULL 
OR
outofstock IS NULL 
OR
quantity IS NULL 
OR
discountedsellingprice IS NULL;

-- different product catefories
SELECT DISTINCT category FROM zepto
ORDER BY category;

-- product in stock vs outofstock
SELECT outofstock, COUNT(sku_id) FROM zepto
GROUP BY outofstock;

-- product names present multiple times
SELECT name, COUNT(sku_id) AS number_of_skus FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY count(sku_id) DESC;

-- data cleaning
-- products with ptice = 0
SELECT * FROM zepto
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE FROM zepto 
WHERE mrp = 0;

-- convert price to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

SELECT mrp, discountedsellingprice FROM zepto;

--Q1, Find the top 10 best-value product based on the discount percentage, in other words, which products have the highest discount percentages?
-- THis helps the businesses to know ehich products are being heabily promoted
SELECT DISTINCT name, mrp, discountpercent FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

--Q2. What are the Products with high MRP but out of stock
-- it can be a missed revenue opprtunity
SELECT DISTINCT name, mrp, outofstock FROM zepto
WHERE outofstock = 'true' AND mrp > 300
ORDER BY mrp DESC;

--Q3. Calculate Estimated Revenue for each category
SELECT category, SUM(discountedsellingprice * availablequantity) AS revenue FROM zepto
GROUP BY category 
ORDER BY revenue;

--Q4. Find all products where MRP is greater than 500 and discount is less than 10%
SELECT DISTINCT name, mrp, discountpercent FROM zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC, discountpercent DESC;

--Q5. Identify the top 5 categories offering the highest average discount percentage
-- useful for marketing teams to understand where the price cut are happening the most and how they can optimize them accordingly
SELECT category, ROUND(AVG(discountpercent),2) AS average_discount FROM zepto
GROUP BY category
ORDER BY average_discount DESC
LIMIT 5;

--Q6. find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, discountedsellingprice, weightingms, ROUND((discountedsellingprice/weightingms),2) AS price_per_gram FROM zepto
WHERE weightingms >= 100
ORDER BY price_per_gram;

--Q7. Group the products into categories like low, medium, bulk based on their weight in grams
-- This kind of segmentation is helpful for package, delivery, and planing and even bulk order strategies
SELECT DISTINCT name, weightingms,
CASE WHEN weightingms < 1000 THEN 'Low'
	WHEN weightingms < 5000 THEN 'Medium'
	ELSE 'Bulk'
END AS weight_category
FROM zepto;

--Q8. What is the total inventory weight per category 
SELECT category, SUM(weightingms*availablequantity) AS total_weight FROM zepto
GROUP BY category
ORDER BY total_weight;


--Q9. Which categories contribute the highest share of total revenue potential
SELECT category,
       SUM(discountedsellingprice * availablequantity) AS revenue,
       ROUND(
           100.0 * SUM(discountedsellingprice * availablequantity)
           / SUM(SUM(discountedsellingprice * availablequantity)) OVER (),
       2) AS revenue_share_pct
FROM zepto
GROUP BY category
ORDER BY revenue_share_pct DESC;


--Q10. For each category, what are the top 3 products ranked by revenue potential?
WITH product_rev AS (
  SELECT
    category,
    name,
    SUM(discountedsellingprice * availablequantity) AS revenue
  FROM zepto
  GROUP BY category, name
),
ranked AS(
	SELECT 
	category, name, revenue,
	DENSE_RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS rnk
FROM product_rev
)
SELECT category, name, revenue, rnk
FROM ranked
WHERE rnk <= 3
ORDER BY category, rnk, revenue DESC;






















