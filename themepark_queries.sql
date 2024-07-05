-- SQL script with example queries for the "themepark" database

-- Example basic query
SELECT * FROM themepark;

-- Example join query
SELECT e.emp_num, e.emp_lname, e.emp_fname, t.park_name
FROM employee e
INNER JOIN themepark t ON e.park_code = t.park_code;

-- Example aggregation query
SELECT park_code, SUM(ticket_price) AS total_sales
FROM ticket
GROUP BY park_code;

-- Example complex query
SELECT p.park_code, p.park_name, a.attract_name, a.attract_capacity
FROM themepark p
INNER JOIN attraction a ON p.park_code = a.park_code;

-- Example conditional query
SELECT *
FROM ticket
WHERE ticket_price > 50
ORDER BY ticket_no DESC;


-- Query 1: List all attractions with their associated theme park name
SELECT t.park_name, a.attract_no, a.attract_name, a.attract_capacity
FROM attraction a
JOIN themepark t ON a.park_code = t.park_code;

-- Query 2: Calculate total sales revenue per theme park
SELECT t.park_name, SUM(sl.line_qty * sl.line_price) AS total_revenue
FROM themepark t
JOIN sales s ON t.park_code = s.park_code
JOIN sales_line sl ON s.transaction_no = sl.transaction_no
GROUP BY t.park_name;

-- Query 3: List employees and their associated theme park details
SELECT e.emp_num, e.emp_fname, e.emp_lname, t.park_name, t.park_city, t.park_country
FROM employee e
LEFT JOIN themepark t ON e.park_code = t.park_code;

-- Query 4: Find attractions with their corresponding number of hours worked
SELECT a.attract_name, COUNT(h.emp_num) AS num_employees
FROM attraction a
LEFT JOIN hours h ON a.attract_no = h.attract_no
GROUP BY a.attract_name;

-- Query 5: Identify the top-selling attractions by total sales revenue
SELECT a.attract_name, SUM(sl.line_qty * sl.line_price) AS total_sales_revenue
FROM attraction a
LEFT JOIN sales_line sl ON a.attract_no = sl.ticket_no
GROUP BY a.attract_name
ORDER BY total_sales_revenue DESC;


-- Add emp_num column to sales table
ALTER TABLE sales
ADD COLUMN emp_num INT;

-- Example: Adding different emp_num values to sales table
UPDATE sales
SET emp_num = 101
WHERE transaction_no = 12781;

UPDATE sales
SET emp_num = 102
WHERE transaction_no = 12782;

UPDATE sales
SET emp_num = 103
WHERE transaction_no = 12783;

-- Query 6: List all employees hired after 2000 and their total sales revenue
SELECT e.emp_num, e.emp_fname, e.emp_lname, COALESCE(SUM(sl.line_qty * sl.line_price), 0) AS total_sales_revenue
FROM employee e
LEFT JOIN sales s ON e.emp_num = s.emp_num
LEFT JOIN sales_line sl ON s.transaction_no = sl.transaction_no
WHERE e.emp_hire_date > '2000-01-01'
GROUP BY e.emp_num, e.emp_fname, e.emp_lname;

-- Query 7: Calculate average ticket price per ticket type
SELECT ticket_type, AVG(ticket_price) AS avg_ticket_price
FROM ticket
GROUP BY ticket_type;

-- Query 8: List theme parks with more than 5 attractions
SELECT t.park_name, COUNT(a.attract_no) AS num_attractions
FROM themepark t
LEFT JOIN attraction a ON t.park_code = a.park_code
GROUP BY t.park_name
HAVING num_attractions > 5;

-- Query 9: Identify attractions suitable for seniors or children
SELECT a.attract_name, a.attract_age, a.attract_capacity
FROM attraction a
INNER JOIN ticket t ON a.park_code = t.park_code
WHERE t.ticket_type IN ('senior', 'child');

-- Query 10: Find employees with the highest total hours worked
SELECT e.emp_num, e.emp_fname, e.emp_lname, SUM(h.hours_per_attract) AS total_hours_worked
FROM employee e
LEFT JOIN hours h ON e.emp_num = h.emp_num
GROUP BY e.emp_num
ORDER BY total_hours_worked DESC;



-- Repeat for other transaction numbers and emp_num values as needed









