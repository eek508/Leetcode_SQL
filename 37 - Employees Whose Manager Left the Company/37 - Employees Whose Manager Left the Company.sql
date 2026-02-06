-- Write your PostgreSQL query statement below
SELECT t.employee_id
FROM (
SELECT e1.employee_id, e1.name as emp_name, e1.manager_id, e1.salary as emp_salary,
e2.employee_id as manager_id2, e2.name as manager_name
FROM Employees e1
LEFT JOIN Employees e2 ON e1.manager_id = e2.employee_id) t
WHERE t.emp_salary < 30000 AND t.manager_id IS NOT NULL AND t.manager_id2 IS NULL
ORDER BY t.employee_id
