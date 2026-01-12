-- Write your PostgreSQL query statement below
SELECT t.product_id, t.year as first_year, t.quantity, t.price
FROM (
SELECT product_id, quantity, price, year, DENSE_RANK() OVER (PARTITION BY product_id ORDER BY year ASC) AS year_rnk
FROM Sales) t
WHERE t.year_rnk = 1
