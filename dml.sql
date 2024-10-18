-- How many cities appeared more than twice in your results table?
SELECT city, count(*)
FROM results
GROUP BY city
HAVING count(*) > 2
ORDER BY count(*) DESC;

-- Get distinct created_at values from the results table
SELECT DISTINCT created_at
FROM results;
