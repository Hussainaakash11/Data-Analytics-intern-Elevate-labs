
-- Analysis of Monthly Revenue and Order Volume from orders table

SELECT
    -- Extract year and month for grouping
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,

    -- Calculate total revenue per month
    SUM(amount) AS monthly_revenue,

    -- Count number of unique orders per month
    COUNT(DISTINCT order_id) AS monthly_order_volume

FROM
    online_sales.orders

-- Optional: Filter for a specific time period
WHERE
    order_date BETWEEN '2023-01-01' AND '2023-12-31'

-- Group by both year and month to aggregate data correctly
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)

-- Sort results chronologically
ORDER BY
    year,
    month;
