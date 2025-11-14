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
Join order_items oi ON oi.product_id = p.id
Join orders o ON o.id = oi.order_id
Group BY p.category
Order BY revenue DESC;


--Task THREE
Select e.first_name || ' ' || e.last_name AS employee_name, d.name AS department_name, e.salary, dept.avg_salary AS department_avg_salary
From employees e
Join departments d ON d.id = e.department_id
Join ( SELECT department_id, AVG(salary) AS avg_salary
       FROM employees
       GROUP BY department_id 
) dept
        ON dept.department_id = e.department_id
        Where e.salary > dept.avg_salary
        Order BY d.name, e.salary DESC;