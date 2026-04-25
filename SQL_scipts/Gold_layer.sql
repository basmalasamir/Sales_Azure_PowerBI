create schema gold
--vw_kpis: Total sales, total orders, total items sold
CREATE VIEW gold.vw_kpis AS
SELECT 
    SUM(total_amount) AS total_sales,
    COUNT(DISTINCT id) AS total_orders,
    SUM(quantity) AS total_items_sold
FROM silver.sales;

--vw_revenue_by_year: Sales trend by year
CREATE VIEW gold.vw_revenue_by_year AS
SELECT 
    [year],
    SUM(total_amount) AS yearly_revenue,
    COUNT(DISTINCT id) AS total_orders
FROM silver.sales
GROUP BY [year];

--vw_monthly_revenue: Sales trend by month
CREATE VIEW gold.vw_monthly_revenue AS
SELECT
    [year],
    [month],
    SUM(total_amount) AS monthly_revenue,
    COUNT(DISTINCT id) AS total_orders
FROM silver.sales
GROUP BY [year], [month];

--vw_payment_distribution: Sales by payment type (cash/card/contactless)
CREATE VIEW gold.vw_payment_distribution AS
SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(total_amount) AS total_revenue,
    SUM(quantity) AS total_items
FROM silver.sales
GROUP BY payment_method;

--vw_top_customers: Top 10 best customers
CREATE VIEW gold.vw_top_customers AS
SELECT TOP 10
    customer_id,
    SUM(total_amount) AS total_spent,
    COUNT(DISTINCT id) AS number_of_orders
FROM silver.sales
GROUP BY customer_id
ORDER BY total_spent DESC;

--vw_store_performance: Best selling stores
CREATE VIEW gold.vw_store_performance AS
SELECT 
    store,
    COUNT(DISTINCT id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    SUM(quantity) AS total_items_sold,
FROM silver.sales
GROUP BY store;
