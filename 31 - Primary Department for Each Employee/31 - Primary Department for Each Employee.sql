-- Write your PostgreSQL query statement below
SELECT t.employee_id, t.department_id
FROM (
SELECT employee_id, department_id, DENSE_RANK() OVER (PARTITION BY employee_id ORDER BY primary_flag DESC) as dept_rnk
FROM Employee) t
WHERE dept_rnk = 1
