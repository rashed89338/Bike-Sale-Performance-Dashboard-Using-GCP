-- Bike Sales Performance Dashboard Using GCP BigQuery
-- Project: Bike Sales Analysis
-- Dataset: Bike_sales_project
-- Main Table: bike_sales_raw

-- 1. Preview first 10 rows

SELECT
  *
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`
LIMIT 10;


-- 2. Count total rows

SELECT
  COUNT(*) AS total_rows
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`;


-- 3. Main KPI Summary

SELECT
  SUM(revenue) AS total_revenue,
  SUM(profit) AS total_profit,
  SUM(order_quantity) AS total_units_sold,
  ROUND(AVG(rating), 2) AS average_rating,
  ROUND(AVG(quality_score), 2) AS average_quality_score
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`;


-- 4. Sales by Product Category

SELECT
  product_category,
  SUM(revenue) AS total_revenue,
  SUM(profit) AS total_profit,
  SUM(order_quantity) AS total_units_sold
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`
GROUP BY
  product_category
ORDER BY
  total_revenue DESC;


-- 5. Monthly Sales Trend


SELECT
  year,
  month,
  SUM(revenue) AS monthly_revenue,
  SUM(profit) AS monthly_profit,
  SUM(order_quantity) AS monthly_units_sold
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`
GROUP BY
  year, month
ORDER BY
  year, month;

-- 6. Revenue by Country

SELECT
  country,
  SUM(revenue) AS total_revenue,
  SUM(profit) AS total_profit,
  SUM(order_quantity) AS total_units_sold
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`
GROUP BY
  country
ORDER BY
  total_revenue DESC;


-- 7. Create Monthly Sales Trend View

CREATE OR REPLACE VIEW
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.v_monthly_sales_trend` AS
SELECT
  year,
  month,
  DATE(year, month, 1) AS month_date,
  SUM(revenue) AS monthly_revenue,
  SUM(profit) AS monthly_profit,
  SUM(order_quantity) AS monthly_units_sold
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`
GROUP BY
  year, month
ORDER BY
  year, month;


-- 8. Create Product Category Performance View

CREATE OR REPLACE VIEW
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.v_category_performance` AS
SELECT
  product_category,
  SUM(revenue) AS total_revenue,
  SUM(profit) AS total_profit,
  SUM(order_quantity) AS total_units_sold,
  ROUND(AVG(rating), 2) AS average_rating,
  ROUND(AVG(quality_score), 2) AS average_quality_score
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`
GROUP BY
  product_category
ORDER BY
  total_revenue DESC;

-- 9. Create Country Performance View


CREATE OR REPLACE VIEW
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.v_country_performance` AS
SELECT
  country,
  SUM(revenue) AS total_revenue,
  SUM(profit) AS total_profit,
  SUM(order_quantity) AS total_units_sold,
  ROUND(AVG(rating), 2) AS average_rating
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`
GROUP BY
  country
ORDER BY
  total_revenue DESC;



-- 10. Create Product Quality vs Sales View
CREATE OR REPLACE VIEW
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.v_quality_vs_sales` AS
SELECT
  product_name,
  product_category,
  brand,
  SUM(revenue) AS total_revenue,
  SUM(profit) AS total_profit,
  SUM(order_quantity) AS total_units_sold,
  ROUND(AVG(rating), 2) AS average_rating,
  ROUND(AVG(quality_score), 2) AS average_quality_score
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.bike_sales_raw`
GROUP BY
  product_name, product_category, brand
ORDER BY
  total_revenue DESC;

-- 11. Test Monthly Sales Trend View
SELECT
  *
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.v_monthly_sales_trend`;

-- 12. Test Product Category Performance View
SELECT
  *
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.v_category_performance`;

-- 13. Test Country Performance View
SELECT
  *
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.v_country_performance`;

-- 14. Test Product Quality vs Sales View
SELECT
  *
FROM
  `project-ef2a3aed-6b63-4885-9aa.Bike_sales_project.v_quality_vs_sales`;

