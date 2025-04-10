select * from dataset;
SELECT * FROM dataset LIMIT 10;
-- SELECT, WHERE, ORDER BY, GROUP BY
SELECT * FROM dataset
WHERE event_type = 'purchase';
SELECT product_id, COUNT(*) AS views
FROM dataset
WHERE event_type = 'view'
GROUP BY product_id
ORDER BY views DESC
LIMIT 5;

-- Products with Above-Average Views (from dataset)
SELECT product_id, COUNT(*) AS views
FROM dataset
WHERE event_type = 'view'
GROUP BY product_id
ORDER BY views DESC
LIMIT 5;
SELECT product_id, COUNT(*) AS views
FROM dataset
WHERE event_type = 'view'
GROUP BY product_id
HAVING views > (
    SELECT AVG(view_count)
    FROM (
        SELECT COUNT(*) AS view_count
        FROM dataset
        WHERE event_type = 'view'
        GROUP BY product_id
    )
);
-- Total revenue
SELECT SUM(price) AS total_revenue
FROM dataset
WHERE event_type = 'purchase';

-- Average price per brand
SELECT brand, AVG(price) AS avg_price
FROM dataset
GROUP BY brand
ORDER BY avg_price DESC;
-- Creating Views for Analysis

CREATE VIEW daily_sales_summary AS
SELECT DATE(event_time) AS date,
       COUNT(*) AS total_orders,
       SUM(price) AS total_revenue
FROM dataset
WHERE event_type = 'purchase'
GROUP BY DATE(event_time);

SELECT * FROM daily_sales_summary ORDER BY date;
