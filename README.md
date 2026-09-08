# E-Commerce Data Analytics Pipeline & Executive Dashboard

## Project Overview
This project presents an end-to-end data engine that cleans messy e-commerce transactional logs, loads them into an optimized MySQL database for multi-level SQL analysis, and visualizes core KPIs using Power BI[cite: 1, 2, 3].

## Architecture & Tech Stack
* **Data Processing & Cleaning:** Python (Pandas, NumPy)[cite: 1]
* **Database Management & Querying:** MySQL / SQLAlchemy[cite: 1, 2]
* **Visualization & Reporting:** Power BI Desktop[cite: 3]

## Data Pipeline Pipeline Execution
1. **Data Ingestion & Hygiene (`Python`):**
   * Loaded 524 raw transactional records[cite: 1].
   * Deduplicated records and trimmed white spaces[cite: 1].
   * Imputed missing numerical fields (Unit Price, Quantity) using median values[cite: 1].
   * Validated email patterns and calculated engineered features (`Net_Sales`, `Delivery_Days`, `Delivery_Performance`)[cite: 1].
   * Exported 444 clean rows into MySQL[cite: 1].

2. **Exploratory SQL Queries (`MySQL`):**
   * Designed 50 structured SQL queries across Beginner, Intermediate, Advanced, and Window Function levels[cite: 2].
   * Evaluated MoM growth, product rank by revenue, customer contribution percentages, and churn metrics[cite: 2].

3. **Executive Dashboard Build (`Power BI`):**
   * Built interactive visual breakdowns for Monthly Revenue Trends, Revenue by Category/State, Order Status ratios, and Payment Mode splits[cite: 3].

## Repository Folder Structure
├── data/
│   ├── Ecommerce_Unclean_Project.csv
│   └── Clean_Data_Ecommerce.csv
├── notebooks/
│   └── Ecommerce_Project_Cleaning_Work.ipynb
├── sql/
│   └── ECOMMERCE_SQL_DATA_ANALYSIS.sql
├── dashboard/
│   └── E-COMMERCE_SALES_DASHBOARD.pdf
└── README.md
