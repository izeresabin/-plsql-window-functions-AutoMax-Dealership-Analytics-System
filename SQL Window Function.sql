
--WINDOWS FUNCTIONS
--1.RANKING FUNCTIONS
-- Rank customers by total sales amount (highest first)
SELECT 
    c.customer_id,
    c.name,
    SUM(s.sale_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(s.sale_amount) DESC) AS rank_by_spending
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.name;



--2.AGGREGATE FUNCTIONS
-- Running sales totals per month
SELECT 
    TO_CHAR(sale_date, 'YYYY-MM') AS month,
    SUM(sale_amount) AS monthly_sales,
    SUM(SUM(sale_amount)) OVER (ORDER BY TO_CHAR(sale_date, 'YYYY-MM')) AS running_total
FROM sales
GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY month;

--3.NAVIGATION FUNCTION
-- Compare monthly sales with previous month
SELECT 
    month,
    monthly_sales,
    LAG(monthly_sales) OVER (ORDER BY month) AS prev_month_sales,
    (monthly_sales - LAG(monthly_sales) OVER (ORDER BY month)) 
        / LAG(monthly_sales) OVER (ORDER BY month) * 100 AS growth_percent
FROM (
    SELECT 
        TO_CHAR(sale_date, 'YYYY-MM') AS month,
        SUM(sale_amount) AS monthly_sales
    FROM sales
    GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
);

--4. DISTRIBUTION FUNCTION
-- Divide customers into quartiles based on total spending
SELECT 
    c.customer_id,
    c.name,
    SUM(s.sale_amount) AS total_spent,
    NTILE(4) OVER (ORDER BY SUM(s.sale_amount) DESC) AS spending_quartile
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;






