--Task ONE
SELECT c.first_name || ' ' || c.last_name AS customer_name, SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
Join orders o ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id = o.id
Group BY c.id
ORDER BY total_spend DESC
LIMIT 5;


--Task TWO
SELECT p.category, (p.price - oi.unit_price) AS Revenue
FROM order_items oi
Group By p.category
