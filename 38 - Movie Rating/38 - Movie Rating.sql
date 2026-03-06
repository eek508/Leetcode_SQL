-- Write your PostgreSQL query statement below
WITH setup1 AS (SELECT t.name
FROM
(SELECT c.user_id, c.name, COUNT(a.movie_id) AS review_ct,
DENSE_RANK() OVER (ORDER BY COUNT(a.movie_id) DESC, c.name ASC) as user_rnk
FROM Movies a 
JOIN MovieRating b ON a.movie_id = b.movie_id
LEFT JOIN Users c ON b.user_id = c.user_id
GROUP BY c.user_id, c.name) t
WHERE t.user_rnk = 1
), setup2 AS (SELECT t.title 
FROM(SELECT a.title, AVG(b.rating),
DENSE_RANK() OVER(ORDER BY AVG(b.rating) DESC, a.title ASC) as rating_rnk
FROM Movies a 
JOIN MovieRating b ON a.movie_id = b.movie_id
LEFT JOIN Users c ON b.user_id = c.user_id
WHERE EXTRACT(MONTH FROM b.created_at) = 2 AND EXTRACT(YEAR FROM b.created_at) = 2020
GROUP BY a.title) t
WHERE t.rating_rnk = 1)

SELECT name as results from setup1 
UNION ALL
SELECT * from setup2 
