-- •	Are older movies rated higher than newer ones, or vice versa?


-- comparing avg rating of 20th century and 21st century

WITH cte_1 AS (
    SELECT AVG("rating") AS "avg_20th" 
    FROM geo_movies
    WHERE air_date <= 2000
),
cte_2 AS (
    SELECT AVG("rating") AS "avg_21st" 
    FROM geo_movies
    WHERE air_date > 2000
)
SELECT round(c1."avg_20th"::NUMERIC,2) AS "avg_20th" ,
       round(c2."avg_21st"::NUMERIC,2) AS "avg_21st" 
FROM cte_1 AS c1
JOIN cte_2 AS c2
ON 1=1;

--  "avg_20th"   "avg_21st"
--    "7.47"       "7.01"

-- as it occurs older is better!