-- Write your PostgreSQL query statement below
WITH setup1 AS (SELECT *,
CASE
WHEN income < 20000 THEN 'Low Salary'
WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
ELSE 'High Salary'
END AS category
FROM Accounts), setup2 AS (
SELECT 'Low Salary' AS categories
UNION
SELECT 'Average Salary' AS categories
UNION
SELECT 'High Salary' AS categories
)

SELECT b.categories as category, COUNT(a.account_id) AS accounts_count
FROM setup1 a
RIGHT JOIN setup2 b ON a.category = b.categories
GROUP BY b.categories
