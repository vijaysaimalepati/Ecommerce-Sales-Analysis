# E-Commerce Sales & Profitability Analysis

An end-to-end data analytics portfolio project exploring e-commerce
sales, profit, customer behaviour, product performance, and payment
trends using **Excel, MySQL, and Power BI**.

## Project Overview

This project analyses an e-commerce dataset containing 500 orders and
1,500 order-detail records. The goal is to turn raw sales data into
useful business insights through data preparation, SQL analysis, KPI
calculation, and an interactive Power BI dashboard.

## Business Objectives

-   Measure overall sales, profit, quantity, and order performance.
-   Compare sales and profitability across product categories and
    sub-categories.
-   Understand monthly sales trends and state-wise performance.
-   Identify top customers and high-value orders.
-   Examine customer payment-mode preferences.
-   Highlight loss-making sub-categories and orders that may need
    attention.

## Tools & Technologies

  -----------------------------------------------------------------------
  Tool                                Purpose
  ----------------------------------- -----------------------------------
  Microsoft Excel                     Data inspection, preparation, and
                                      analysis

  MySQL                               Data storage, SQL queries,
                                      aggregations, and ranking analysis

  Power BI                            Data modelling, KPI measures,
                                      interactive visuals, and
                                      dashboarding
  -----------------------------------------------------------------------

## Dataset

The project uses two CSV files:

### `Orders.csv`

Contains order-level information:

-   `order_id`
-   `order_date`
-   `customer_name`
-   `state`
-   `city`

### `Details.csv`

Contains order-item and transaction information:

-   `order_id`
-   `amount`
-   `profit`
-   `quantity`
-   `category`
-   `sub_category`
-   `payment_mode`

The two tables are connected using `order_id`. The model contains a
one-to-many relationship from `Orders` to `Details`.

## Key Performance Indicators

  KPI                 Result
  ---------------- ---------
  Total Sales        437,771
  Total Profit        36,963
  Total Quantity       5,615
  Total Orders           500
  Profit Margin        8.44%

**Profit Margin** is calculated as:

`(Total Profit / Total Sales) × 100`

## Analysis Performed

### SQL Analysis

SQL was used to answer business questions, including:

-   Overall sales, profit, quantity, order count, and profit margin.
-   Sales and profit by category and sub-category.
-   Monthly sales trends.
-   State-wise sales performance.
-   Top customers and customer rankings.
-   Payment-mode distribution.
-   Top orders and loss-making sub-categories or orders.
-   Ranking customers using a common table expression (CTE) and
    `RANK()`.

### Power BI Dashboard

The interactive dashboard includes:

-   KPI cards for Total Sales, Total Profit, Total Quantity, Total
    Orders, and Profit Margin.
-   Monthly Sales Trend.
-   Category-wise Sales.
-   Category-wise Profit.
-   State-wise Sales.
-   Payment Mode distribution.
-   Slicers for Date, State, and Category.

## Key Findings

-   The dataset records **437,771** in total sales and **36,963** in
    total profit.
-   The overall profit margin is approximately **8.44%**.
-   The analysis provides views of performance by time, geography,
    category, customer, and payment mode.
-   Sub-category and order-level analysis helps identify areas with
    negative profit that may require further investigation.

> The findings above are based on the calculated project KPIs and
> analyses. Specific category, state, customer, and payment-mode winners
> should be stated only after checking the corresponding query or
> dashboard results.

## Project Structure

``` text
Ecommerce_Sales_Analytics/
│
├── Dataset/
│   ├── Orders.csv
│   └── Details.csv
│
├── Documentation/
│   ├── Ecommerce_Sales_Project_Documentation.pdf
│   └── Ecommerce_Sales_Project_Documentation.docx
│
├── Ecommerce_Sales.xlsx
├── Ecommerce_Sales_Analysis.sql
└── Ecommerce_Sales_Analytics.pbix
```

## How to Explore This Project

1.  Download or clone this repository.
2.  Review the CSV files in the `Dataset` folder.
3.  Open `Ecommerce_Sales.xlsx` to explore the spreadsheet analysis.
4.  Import the CSV data into MySQL and review
    `Ecommerce_Sales_Analysis.sql`.
5.  Open `Ecommerce_Sales_Analytics.pbix` in Power BI Desktop to explore
    the dashboard.
6.  Refer to the `Documentation` folder for the project report.

## Skills Demonstrated

-   Data cleaning and preparation
-   Relational data modelling
-   SQL querying, joins, aggregations, CTEs, and window functions
-   KPI calculation and profitability analysis
-   Power BI dashboard development and data visualisation
-   Translating business questions into data analysis

## Conclusion

This project demonstrates an end-to-end approach to analysing e-commerce
sales data, from preparing datasets and querying them with SQL to
presenting business metrics in an interactive Power BI dashboard. It
showcases practical skills relevant to entry-level Data Analyst roles.

------------------------------------------------------------------------

**Project:** E-Commerce Sales & Profitability Analysis\
**Tools:** Excel \| MySQL \| Power BI\
**Type:** Data Analytics Portfolio Project
