# 🛒 E-Commerce Sales Analysis

![MySQL](https://img.shields.io/badge/MySQL-8.0-orange) ![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow) ![Tableau](https://img.shields.io/badge/Tableau-Dashboard-blue) ![SQL](https://img.shields.io/badge/SQL-Window%20Functions-green)

End-to-end e-commerce sales analysis on a raw orders dataset using **MySQL** for data validation, cleaning, and business analysis — with dashboards built in **Power BI** and **Tableau** for visual reporting across 16 Indian cities and 4 product categories.

---

## 📦 Dataset Overview

| Attribute | Value |
|-----------|-------|
| Total Revenue | ₹436.83M |
| Total Orders | 8,127 |
| Total Customers | 8,124 |
| Total Items Sold | 22,413 |
| Avg Order Value | ₹53,750 |
| Repeat Customers | 3 |
| Cities Covered | 16 |
| Product Categories | 4 |
| Payment Methods | 5 |

---

## 📊 Key Stats

| Metric | Value |
|--------|-------|
| Top Category | Electronics |
| Top City | Delhi |
| Top Product | iPhone 12 |
| Top Customer | Anika (₹13,56,530) |
| Payment — Cash | 23.95% |
| Payment — COD | 22.08% |
| Payment — Net Banking | 18.33% |
| Payment — UPI | 17.7% |
| Payment — Card | 17.5% |

---

## 💡 Key Insights

- **Electronics dominated** category revenue — significantly ahead of Fashion, Food, and Drinks
- **Delhi led** city-wise revenue, followed by Lucknow, Pune, Ahmedabad, and Chennai
- **iPhone 12 and iPhone 13** were top revenue-generating products
- **Cash (23.95%)** was the most used payment method, followed by COD (22.08%)
- **Day-over-day growth** tracked using SQL Window Functions (LAG, OVER)
- **Above-average revenue days** identified using subquery-based HAVING filter
- **Top spender:** Anika from Jaipur at ₹13,56,530 lifetime value
- **Revenue stable** monthly Jan–May, sharp drop in June onwards

---

## 📈 Dashboards

### Power BI — Sales Overview Dashboard
![Power BI Overview](dashboards/powerbi_overview.png.png)

KPI cards: ₹436.83M revenue · 8K customers · 22.41K items · ₹53.78K AOV · 8K orders · 3 repeat customers | Monthly revenue + items trend | City-wise revenue (Delhi leads at ~₹30M) | Top products: iPhone 12, iPhone 13, Headphones | Payment method donut chart | Daily revenue trend line

### Power BI — Category & Customer Dashboard
![Power BI Category](dashboards/powerbi_category.png.png)

Customer-level revenue table (Anika tops at ₹13,56,530) | Category revenue bar — Electronics dominant | Payment method stacked bar across all 4 categories | Interactive filters: category · payment method · city · date hierarchy

### Tableau — ECOM_SALES Dashboard
![Tableau Dashboard](dashboards/tableau_dashboard.png.png)

KPI summary: ₹436.83M revenue · 8,127 orders · 22,413 items · 8,124 customers | City revenue (Ahmedabad, Bangalore, Bhopal shown) | Category revenue chart | Monthly trend line | Daily trend Jan–Oct 2024 | Top customers by revenue | Payment method pie chart

---

## 🗄️ SQL Analysis

### Phase 1 — Validation (validation_and_cleaning.sql)
- NULL and empty string checks across all 10 fields
- REGEXP validation for price, quantity, order_date, payment_method
- Duplicate order_id detection using GROUP BY + HAVING
- Invalid customer names flagged (numeric chars, length < 5)
- Invalid city, product, category, payment method detection

### Phase 2 — Cleaning
- Created `rectified_orders` — DISTINCT deduplification, COALESCE null handling, STR_TO_DATE parsing, CAST for price/quantity
- Created `cleaned_orders` — filtered valid records, IFNULL quantity imputation to 1, computed `revenue = price × quantity`

### Phase 3 — Analysis (analysis.sql)
- Total revenue, product-wise sales volume and revenue
- City-wise revenue across 16 Indian cities
- Monthly revenue trends
- Payment method distribution
- Customer-level: total orders + lifetime spend
- Day-over-day revenue growth using **LAG() Window Function**
- Above-average revenue days via **HAVING + subquery**
- Category-wise revenue and order count
- Average Order Value calculation

---

## 📁 Project Structure

    ecommerce-sales-analysis/
    ├── sql/
    │   ├── raw_orders.sql
    │   ├── validation_and_cleaning.sql
    │   └── analysis.sql
    ├── dashboards/
    │   ├── powerbi_overview.png
    │   ├── powerbi_category.png
    │   ├── tableau_dashboard.png
    │   ├── sql1.pbix
    │   └── Book1.twb
    └── README.md

---

## ▶️ How to Run

1. Clone: `git clone https://github.com/tushar-khabrani/ecommerce-sales-analysis`
2. Import `raw_orders.sql` into MySQL
3. Run `validation_and_cleaning.sql` → creates rectified_orders + cleaned_orders
4. Run `analysis.sql` for business insights
5. Open `sql1.pbix` in Power BI Desktop
6. Open `Book1.twb` in Tableau Desktop

---

## 🤖 AI Integration
AI tools used for SQL data cleaning logic suggestions, validation query structuring, and dashboard layout guidance — all business insights and analytical conclusions independently derived and validated.

---

## 👤 Author
**Tushar Khabrani** — [LinkedIn](https://www.linkedin.com/in/tusharkhabrani104) · [GitHub](https://github.com/tushar-khabrani)
