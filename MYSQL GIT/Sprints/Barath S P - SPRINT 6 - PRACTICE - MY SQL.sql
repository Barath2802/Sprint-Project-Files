use hr;
-- Task 1:-
DESCRIBE regions;
DESCRIBE countries;
DESCRIBE locations;
DESCRIBE departments;
DESCRIBE jobs;
DESCRIBE employees;
DESCRIBE job_history;

-- Task 2:-
-- Find the total number of countries in each region.
SELECT r.region_name, COUNT(c.country_id) AS total_countries
FROM regions r
JOIN countries c ON r.region_id = c.region_id
GROUP BY r.region_name;
-- b: Find the top 10 largest cities by population.
SELECT c.city_name, c.population
FROM cities c
ORDER BY c.population DESC
LIMIT 10;

-- C.Find the average salary of employees in each department.
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- D. Find the total sales for each country in the last quarter.
SELECT c.country_name, SUM(s.total_price) AS total_sales
FROM sales s
JOIN locations l ON s.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE s.order_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY c.country_name;

-- E.Find the top 10 most popular products, based on the number of orders.
SELECT p.product_name, COUNT(s.order_id) AS total_orders
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id
ORDER BY total_orders DESC
LIMIT 10;

-- f.Find the customers who have placed the most orders in the last year.
SELECT c.customer_id, COUNT(s.order_id) AS total_orders
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
WHERE s.order_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY c.customer_id
ORDER BY total_orders DESC
LIMIT 10;

--  g: Find the employees who have generated the most sales in the last quarter.

SELECT e.employee_id, SUM(s.total_price) AS total_sales
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN sales s ON l.location_id = s.location_id
WHERE s.order_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY e.employee_id
ORDER BY total_sales DESC
LIMIT 10;

-- Task 3:
-- Business Query 1: Find the average salary increase for employees who have been promoted within the last 5 years.
SELECT AVG(e2.salary - e1.salary) AS average_salary_increase
FROM job_history jh
JOIN employees e1 ON jh.employee_id = e1.employee_id AND jh.start_date = e1.hire_date
JOIN employees e2 ON jh.employee_id = e2.employee_id AND jh.end_date = e2.hire_date
WHERE jh.end_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);
--  Identify the departments with the highest employee turnover rate in the last year.
SELECT d.department_name, COUNT(jh.employee_id) / COUNT(DISTINCT e.employee_id) AS turnover_rate
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN job_history jh ON e.employee_id = jh.employee_id
WHERE jh.end_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY d.department_name
ORDER BY turnover_rate DESC;
--  Determine the average tenure of employees in each job role.
SELECT j.job_title, AVG(DATEDIFF(CURDATE(), e.hire_date)) AS average_tenure
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
GROUP BY j.job_title;

-- TASK 4:-
-- Business Query 1: Find the average salary increase for employees who have been promoted within the last 5 years.
SELECT AVG(e2.salary - e1.salary) AS average_salary_increase
FROM job_history jh
JOIN employees e1 ON jh.employee_id = e1.employee_id AND jh.start_date = e1.hire_date
JOIN employees e2 ON jh.employee_id = e2.employee_id AND jh.end_date = e2.hire_date
WHERE jh.end_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- Business Query 2: Identify the departments with the highest employee turnover rate in the last year.
SELECT d.department_name, COUNT(jh.employee_id) / COUNT(DISTINCT e.employee_id) AS turnover_rate
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN job_history jh ON e.employee_id = jh.employee_id
WHERE jh.end_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY d.department_name
ORDER BY turnover_rate DESC;
-- Business Query 3: Determine the average tenure of employees in each job role.
SELECT j.job_title, AVG(DATEDIFF(CURDATE(), e.hire_date)) AS average_tenure
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
GROUP BY j.job_title;