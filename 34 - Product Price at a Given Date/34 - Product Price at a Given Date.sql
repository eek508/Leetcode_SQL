-- Write your PostgreSQL query statement below
WITH priorDates AS (SELECT product_id, new_price, change_date, 
DENSE_RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) as date_rnk
FROM Products
WHERE change_date <= '2019-08-16')

SELECT product_id, new_price as price
FROM priorDates
WHERE date_rnk = 1
UNION
SELECT product_id, 10 as price
FROM Products
WHERE product_id NOT IN (SELECT product_id
FROM priorDates)
