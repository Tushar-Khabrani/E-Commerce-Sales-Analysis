# 🛒 E-Commerce Sales Analysis

![MySQL](https://img.shields.io/badge/MySQL-8.0-orange) ![PowerBI](https://img.shields.io/badge/Power%20BI-F2C811?logo=powerbi&logoColor=black) ![Tableau](https://img.shields.io/badge/Tableau-E97627?logo=tableau&logoColor=white)

End-to-end e-commerce sales analytics on ~10,000 raw orders across
**16 Indian cities** and **4 product categories** — from raw data
validation and cleaning in MySQL to interactive dashboards in
Power BI and Tableau.

---

## 📦 Dataset Overview

| Attribute | Value |
|---|---|
| Total Records | ~10,000 orders |
| Total Columns | 10 |
| Cities | 16 (Delhi, Mumbai, Bangalore, Chennai, Hyderabad, Pune, Jaipur, Lucknow, Ahmedabad, Surat, Nagpur, Indore, Bhopal, Kolkata, Patna, Kutch) |
| Categories | Electronics · Fashion · Food · Drinks |
| Payment Methods | UPI · COD · Cash · Card · Net Banking |
| Date Range | 2024 |

---

## 📊 Key KPIs

| Metric | Value |
|---|---|
| Total Revenue | ₹436.83M |
| Total Orders | 8,127 |
| Total Customers | 8,124 |
| Total Items Sold | 22,413 |
| Avg Order Value | ₹53,750 |
| Repeat Customers | 3 |
| Top City | Delhi (₹30M+) |
| Top Products | iPhone 12 · iPhone 13 · Headphones |
| Top Category | Electronics |
| Top Spender | Anika — Jaipur (₹13,56,530) |

---

## 💡 Key Insights

- **Electronics dominated** — highest revenue category vs Fashion, Food, Drinks
- **Delhi led** city-wise revenue at ₹30M+, followed by Lucknow and Pune
- **iPhone 12 & iPhone 13** were top 2 revenue-generating products
- **Cash (23.95%) and COD (22.08%)** combined = nearly half of all transactions
- **Revenue peaked mid-year** (~May) before declining toward November
- **Only 3 repeat customers** out of 8,124 — low retention signals opportunity for loyalty programs
- **Above-average revenue days** identified via subquery HAVING filter
- **Day-over-day growth** tracked using LAG() window function — visible spike in Q3/Q4

---

## 🔍 SQL Analysis

**Phase 1 — Data Validation & Cleaning**
- NULL and empty string checks across all 10 columns
- REGEXP-based format validation for price, quantity, and dates
- Duplicate order_id detection via GROUP BY + HAVING
- Name, city, product, category, payment method validation
- Created `rectified_orders` — deduplication, COALESCE nulls, STR_TO_DATE casting
- Created `cleaned_orders` — filtered valid records, imputed missing quantity to 1, computed revenue = price × quantity

**Phase 2 — Business Analysis**
- Total revenue from valid orders
- Product-wise sales volume and revenue ranking
- City-wise revenue across 16 cities
- Monthly revenue trends
- Payment method distribution
- Top customers by city — lifetime spend ranking
- Repeat customer identification
- Day-over-day revenue growth using `LAG()` window function
- Above-average revenue day detection via subquery `HAVING` filter
- Category-wise revenue breakdown
- Average Order Value calculation

---

## 📈 Dashboards

### Power BI — Sales Overview Dashboard

![Power BI Overview](dashboards/screenshots/powerbi_overview.png)

KPI cards: ₹436.83M revenue · 8K customers · 22.41K items · ₹53.78K AOV · 3 repeat customers | Monthly revenue + items trend | City-wise revenue — Delhi leads ₹30M+ | Top products: iPhone 12 · iPhone 13 · Headphones | Payment method donut: Cash 23.95% · COD 22.08% · Net Banking 18.33% · UPI 17.7% | Daily revenue trend line

---

### Power BI — Category & Customer Revenue Dashboard

![Power BI Category](dashboards/screenshots/powerbi_category.png)

Electronics dominated total revenue | Stacked bar — payment method split across 4 categories | Customer table: top spender Anika ₹13,56,530 (Jaipur) | Interactive filters: category · payment method · city · date hierarchy (Year → Quarter → Month → Day)

---

### Tableau — ECOM_SALES Dashboard

![Tableau Dashboard](dashboards/screenshots/tableau_dashboard.png)

KPI summary: ₹436.83M · 8,127 orders · 22,413 items · 8,124 customers | City revenue bar chart | Category revenue | Monthly trends | Payment method split | Top customers by revenue | Filter toggle: Card · Cash · COD · Net Banking · UPI

---

## 📁 Project Structure

    ecommerce-sales-analysis/
    ├── sql/
    │   ├── raw_orders.sql
    │   ├── validation_and_cleaning.sql
    │   └── analysis.sql
    ├── dashboards/
    │   ├── screenshots/
    │   │   ├── powerbi_overview.png
    │   │   ├── powerbi_category.png
    │   │   └── tableau_dashboard.png
    │   ├── sql1.pbix
    │   └── Book1.twb
    └── README.md

---

## ▶️ How to Run

1. Clone: `git clone https://github.com/Tushar-Khabrani/E-Commerce-Sales-Analysis`
2. Import `sql/raw_orders.sql` into MySQL Workbench
3. Run `sql/validation_and_cleaning.sql` → creates rectified_orders + cleaned_orders
4. Run `sql/analysis.sql` → all business analysis queries
5. Open `dashboards/sql1.pbix` in Power BI Desktop
6. Open `dashboards/Book1.twb` in Tableau Desktop

---

## 🤖 AI Integration
Used **Claude (Anthropic)** for SQL cleaning logic suggestions, validation query structuring, and dashboard layout guidance. All business insights, KPI selection, and analytical conclusions independently derived and validated.

---

## 🛠️ Tech Stack

`MySQL` · `Power BI` · `Tableau` · `DAX` · `SQL Window Functions`
`Data Cleaning` · `Data Validation` · `EDA` · `Business Intelligence`

**Domain:** E-Commerce Analytics · Retail · Business Intelligence

---

## 👤 Author
**Tushar Khabrani** — [LinkedIn](https://www.linkedin.com/in/tusharkhabrani104) · [GitHub](https://github.com/Tushar-Khabrani)
