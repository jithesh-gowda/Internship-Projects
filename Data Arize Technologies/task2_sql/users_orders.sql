SELECT u.user_id, u.name, COUNT(o.order_id) AS order_count, SUM(o.amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 90 DAY)
GROUP BY u.user_id, u.name
HAVING COUNT(o.order_id) > 3;
