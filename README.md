# zepto-retail-sql-analysis
End-to-end SQL analysis of Zepto retail data using PostgreSQL. Features advanced data cleaning, inventory segmentation, and revenue share modeling using CTEs and Window Functions.

![SQL](https://img.shields.io/badge/Language-SQL-blue)
![Database](https://img.shields.io/badge/Database-PostgreSQL-336791?logo=postgresql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success)
![Analysis](https://img.shields.io/badge/Analysis-EDA%20%26%20Insights-orange)

---

## 🛠️ Tech Stack & Skills
| Category | Tools & Technologies |
| :--- | :--- |
| **Database** | ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=flat&logo=postgresql&logoColor=white) |
| **Data Querying** | `CTEs`, `Window Functions`, `Aggregate Functions`, `Joins` |
| **Data Cleaning** | `Data Normalization`, `Sanitization`, `Type Casting` |
| **Reporting** | `Executive Summaries`, `KPI Development`, `Revenue Modeling` |

---

### 📌 Project Overview
This project performs a comprehensive analysis of Zepto's product catalog (1,700+ SKUs) to identify revenue growth opportunities and optimize inventory management. Using PostgreSQL, I transformed raw retail data into actionable business insights, focusing on pricing strategies, stock availability, and logistical segmentation.

The goal was to answer critical business questions:

Which categories drive the most revenue?

Where is revenue being lost due to out-of-stock items?

How should logistics be planned based on product weight distribution?

### 🛠️ Technical Skills Demonstrated
1. SQL & Database Analytics (PostgreSQL)
Database Architecture: Designed a relational schema with optimized data types and primary key constraints to maintain strict data integrity.

Advanced Cleaning & Normalization: Performed data sanitization by normalizing currency units and removing invalid zero-MRP records to ensure high-fidelity revenue projections.

Complex Business Logic: Implemented custom segmentation using CASE WHEN logic to classify inventory into weight categories (Low, Medium, Bulk).

Analytical Window Functions: Leveraged DENSE_RANK() OVER(PARTITION BY) and SUM() OVER() to rank top-performing SKUs and calculate category-wise revenue share.

Modular Code Design: Structured analytical workflows using Common Table Expressions (CTEs) to ensure query readability and maintainability.

2. Data Validation & Exploratory Analysis (EDA)
Integrity Auditing: Conducted comprehensive null-value checks and data quality audits across 1,700+ rows to ensure analytical reliability.

Strategic KPI Analysis: Calculated revenue concentration metrics and unit-level value (e.g., Price-per-Gram) to identify high-impact products.

### 🚀 Key Insights & Results
💰 Revenue Distribution
Top Contributors: Cooking Essentials and Munchies lead the platform, each contributing 15.04% of the total revenue potential.
<img width="926" height="963" alt="image" src="https://github.com/user-attachments/assets/bce134ff-cd1d-4d57-b16e-06773a1d8cad" />

Missed Opportunities: Identified high-value items like "Patanjali Cow's Ghee" (MRP 565) currently marked as out-of-stock, representing immediate revenue leakage.
<img width="975" height="248" alt="image" src="https://github.com/user-attachments/assets/6d14f844-a8f7-4533-90e2-77d8cd1be9d0" />

📦 Logistics & Inventory
Weight Segmentation: The majority of inventory falls under the "Low" weight category (<1kg), suggesting a bike-heavy delivery fleet is efficient. However, Cooking Essentials accounts for the highest physical weight load on the system.
<img width="975" height="522" alt="image" src="https://github.com/user-attachments/assets/07b16997-b323-491c-a527-d18db2c2f2d4" />
<img width="709" height="973" alt="image" src="https://github.com/user-attachments/assets/4740bb63-e126-4c10-b532-d3d1e9808c23" />

Promotional Strategy: Fruits & Vegetables maintain the highest average discount rate at 15.46%, while specific "hook" products like Dukes Waffy are discounted up to 51% to drive traffic.
<img width="744" height="372" alt="image" src="https://github.com/user-attachments/assets/b9949133-f14b-4320-b3ed-e38864deffe2" />
<img width="975" height="541" alt="image" src="https://github.com/user-attachments/assets/a74c36cf-55f4-4d4e-9f5f-0c844a06c6da" />

