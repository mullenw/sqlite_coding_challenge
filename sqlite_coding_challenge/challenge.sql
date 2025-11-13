--Task ONE
SELECT c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
Join orders o ON o.customr_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
Group BY total_spent DESC
LIMIT 5;

--Task TWO
SELECT p.category, (p.price - oi.unit_price) * oi.quantity AS Revenue
FROM order_items oi
Group By p.category
