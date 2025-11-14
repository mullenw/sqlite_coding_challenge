--Task ONE
SELECT c.first_name || ' ' || c.last_name AS customer_name, SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
Join orders o ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id = o.id
Group BY c.id
ORDER BY total_spend DESC
LIMIT 5;


--Task TWO
SELECT p.category, SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.id
JOIN orders o ON o.id = oi.order_id
GROUP BY p.category
ORDER BY revenue DESC;


--Task THREE
SELECT e.first_name || ' ' || e.last_name AS employee_name, d.name AS department_name, e.salary, dept.avg_salary AS department_avg_salary
FROM employees e
JOIN departments d ON d.id = e.department_id
JOIN ( SELECT department_id, AVG(salary) AS avg_salary
       FROM employees
       GROUP BY department_id 
) dept
        ON dept.department_id = e.department_id
        WHERE e.salary > dept.avg_salary
        ORDER BY d.name, e.salary DESC;
        

--Task FOUR
SELECT city, COUNT(*) AS gold_customer_count
FROM customers
WHERE loyalty_level = 'Gold'
GROUP BY city
ORDER BY gold_customer_count DESC, city ASC;