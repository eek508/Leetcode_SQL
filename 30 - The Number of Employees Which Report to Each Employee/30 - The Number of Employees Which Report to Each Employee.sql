-- Write your PostgreSQL query statement below
WITH setup AS (SELECT e1.employee_id, e1.name as employee_name, e1.age as employee_age, e1.reports_to as manager_id,
e2.employee_id as manager_id1, e2.name as manager_name, e2.age as manager_age 
FROM Employees e1
JOIN Employees e2 ON e1.reports_to = e2.employee_id)

SELECT manager_id as employee_id, manager_name as name, COUNT(employee_id) as reports_count, ROUND(AVG(employee_age),0) as average_age
FROM setup
GROUP BY manager_id,manager_name
ORDER BY employee_id
