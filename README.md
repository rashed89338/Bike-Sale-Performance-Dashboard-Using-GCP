# Bike Sales Performance Dashboard using GCP BigQuery and Looker Studio

## Project Overview
This project analyzes bicycle sales performance using Google BigQuery and Looker Studio. The goal is to understand revenue, profit, units sold, product category performance, country-level sales, and the relationship between product quality and revenue.

## Tools Used
- Google Cloud Platform
- BigQuery
- SQL
- Looker Studio
- Data Visualization

## Dataset
The dataset contains 1,500 bike sales records with fields such as order date, country, product category, product name, revenue, profit, units sold, rating, quality score, and stock status.

## Business Questions
1. What are the total revenue, profit, and units sold?
2. Which countries generate the most revenue?
3. Which product categories perform best?
4. How does product quality relate to revenue?
5. What insights can support business decision-making?

## Cloud Workflow

The project was built using the following GCP workflow:

1. Uploaded the bike sales CSV dataset into Google BigQuery.
2. Created a BigQuery dataset named `Bike_sales_project`.
3. Loaded the raw table as `bike_sales_raw`.
4. Used SQL queries to create analytical views:
   - `v_monthly_sales_trend`
   - `v_category_performance`
   - `v_country_performance`
   - `v_quality_vs_sales`
5. Connected the BigQuery views to Looker Studio.
6. Built an interactive dashboard for sales, profit, product category, country, and product quality analysis.

## Dashboard Features
- KPI cards for total revenue, profit, and units sold
- Monthly revenue and profit trend
- Revenue by country
- Revenue by product category
- Revenue share by product category
- Product quality vs revenue scatter plot

## Dashboard link
[View the Looker Studio Dashboard](https://datastudio.google.com/reporting/7a8efd23-b0ba-4141-8180-ea11a23a90b7)

## Key Insights
- Total revenue was approximately $2.55M.
- Total profit was approximately $876K.
- Total units sold were 6,249.
- Electric Bikes generated the largest revenue share.
- France and the United States were among the strongest markets.
- Product quality showed a positive relationship with revenue.

