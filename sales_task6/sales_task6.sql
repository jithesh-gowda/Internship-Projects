SELECT  
    EXTRACT(YEAR FROM STR_TO_DATE(Transaction_Date, '%d-%b-%y')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(Transaction_Date, '%d-%b-%y')) AS month,
    SUM(sales.offline_Spend + sales.online_spend) AS revenue,
    SUM(sales.Quantity) AS Total_orders
FROM sales
GROUP BY year, month
ORDER BY year, month
limit 100;
