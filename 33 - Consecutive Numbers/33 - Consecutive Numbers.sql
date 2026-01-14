-- Write your PostgreSQL query statement below
SELECT DISTINCT t1.ConsecutiveNums
FROM (
SELECT 
CASE 
WHEN t.num = t.num1 AND t.num1 = t.num2 THEN num
ELSE NULL
END AS ConsecutiveNums
FROM(
SELECT id, num, 
LEAD(num,1) OVER (ORDER BY id) AS num1, 
LEAD(num,2) OVER (ORDER BY id) AS num2
FROM Logs) t) t1
WHERE t1.ConsecutiveNums IS NOT NULL
