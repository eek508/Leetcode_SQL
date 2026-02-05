-- Write your PostgreSQL query statement below
SELECT t.person_name
FROM (
SELECT person_name, turn, weight, SUM(weight) OVER (ORDER BY turn ASC) as cumulative_sum
FROM Queue) t
WHERE t.cumulative_sum <= 1000
ORDER BY t.cumulative_sum DESC
LIMIT 1;
