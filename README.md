# 🛒 Zepto Retail SQL Analysis  
### Advanced PostgreSQL Analytics for Revenue & Inventory Optimization

<div align="center">

📊 Transforming Retail SKU Data into Strategic Business Insights  

![SQL](https://img.shields.io/badge/Language-SQL-blue)
![Database](https://img.shields.io/badge/Database-PostgreSQL-336791?logo=postgresql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success)
![Analysis](https://img.shields.io/badge/Focus-EDA%20%26%20Revenue%20Modeling-orange)

</div>

---

## 📌 Executive Summary

This project delivers an end-to-end SQL-based analysis of **Zepto’s retail product catalog (1,700+ SKUs)** using PostgreSQL.

The objective was to identify:

- Revenue concentration patterns  
- Inventory inefficiencies  
- Out-of-stock revenue leakage  
- Logistics optimization opportunities  
- Promotional discount strategies  

Using advanced SQL techniques including **CTEs, Window Functions, and Segmentation Modeling**, raw SKU-level retail data was transformed into actionable business intelligence.

---

## 🛠️ Tech Stack & Core Skills

| Category | Tools & Techniques |
|-----------|-------------------|
| **Database** | PostgreSQL |
| **Querying** | CTEs, Window Functions, Aggregations, Joins |
| **Data Cleaning** | Normalization, Sanitization, Type Casting |
| **Analytics** | Revenue Modeling, KPI Development, Segmentation |
| **Reporting** | Executive Insights & Strategic Recommendations |

---

## 🔍 Business Questions Addressed

- 📈 Which categories drive the highest revenue potential?
- 📉 Where is revenue being lost due to out-of-stock products?
- 📦 How should delivery logistics be structured based on product weight?
- 🎯 Which products drive traffic via aggressive discounting?

---

# 🧠 Technical Implementation

## 1️⃣ Database Architecture & Cleaning

- Designed relational schema with strict primary key constraints  
- Normalized currency units and standardized price fields  
- Removed invalid zero-MRP records to protect revenue modeling integrity  
- Conducted full null-value and integrity audits across 1,700+ SKUs  

---

## 2️⃣ Advanced SQL Analytics

### 🔹 Modular Query Design (CTEs)
Structured complex analytical workflows using Common Table Expressions to improve readability and maintainability.

### 🔹 Revenue Share Modeling
Used:
```sql
SUM() OVER()
```
to calculate category-level revenue contribution percentages.

### 🔹 Product Ranking
Implemented:
```sql
DENSE_RANK() OVER (PARTITION BY category ORDER BY revenue DESC)
```
to identify top-performing SKUs within each segment.

### 🔹 Custom Segmentation
Used `CASE WHEN` logic to classify inventory into:
- Low Weight (<1kg)
- Medium Weight
- Bulk

---

# 📊 Key Insights & Strategic Findings

---

## 💰 Revenue Distribution

### 🏆 Top Revenue Categories
- **Cooking Essentials** → 15.04%
- **Munchies** → 15.04%

These categories dominate revenue potential.

<img width="926" height="963" alt="Revenue Distribution" src="https://github.com/user-attachments/assets/bce134ff-cd1d-4d57-b16e-06773a1d8cad" />

---

### 🚨 Revenue Leakage

High-value items such as:

- **Patanjali Cow's Ghee (MRP 565)**  

were marked out-of-stock, representing immediate lost revenue opportunity.

<img width="975" height="248" alt="Out of Stock Analysis" src="https://github.com/user-attachments/assets/6d14f844-a8f7-4533-90e2-77d8cd1be9d0" />

---

## 📦 Logistics & Inventory Strategy

### 🚲 Weight Segmentation

- Majority of SKUs fall under **Low Weight (<1kg)**  
- Suggests operational efficiency using bike-heavy delivery fleet  
- Cooking Essentials contributes highest physical load  

<img width="975" height="522" alt="Weight Segmentation" src="https://github.com/user-attachments/assets/07b16997-b323-491c-a527-d18db2c2f2d4" />
<img width="709" height="973" alt="Weight Distribution" src="https://github.com/user-attachments/assets/4740bb63-e126-4c10-b532-d3d1e9808c23" />

---

## 🎯 Promotional Strategy Analysis

- **Fruits & Vegetables** → Highest average discount rate (15.46%)  
- Specific traffic-driving products (e.g., *Dukes Waffy*) discounted up to **51%**

<img width="744" height="372" alt="Discount Strategy" src="https://github.com/user-attachments/assets/b9949133-f14b-4320-b3ed-e38864deffe2" />
<img width="975" height="541" alt="Discount Distribution" src="https://github.com/user-attachments/assets/a74c36cf-55f4-4d4e-9f5f-0c844a06c6da" />

---

# 💼 Business Recommendations

- 🔄 Prioritize restocking high-MRP out-of-stock products
- 📊 Focus marketing on high-margin categories
- 🚲 Optimize fleet allocation based on weight segmentation
- 🎯 Use deep-discount SKUs strategically as traffic drivers
- 📈 Monitor revenue share concentration to prevent dependency risk

---

# 🚀 Project Structure

```
Zepto Retail Raw Data
        ↓
Data Cleaning & Validation (PostgreSQL)
        ↓
CTE-Based Revenue Modeling
        ↓
Window Function Analysis
        ↓
Executive Business Insights
```

---

# 📈 Business Impact

This analysis demonstrates:

- Strong SQL architecture and modular design  
- Advanced analytical capability using Window Functions  
- Strategic business thinking beyond basic aggregation  
- Revenue optimization modeling for real-world retail scenarios  

---

<div align="center">

⭐ If you found this project valuable, consider giving it a star!

</div>
