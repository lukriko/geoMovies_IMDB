-- •	movie appearances per year

SELECT air_date,count(*) FROM geo_movies
GROUP BY air_date
ORDER BY air_date


-- max appearances for movie

with cte AS 
    (
        SELECT air_date,count(*) AS total_count FROM geo_movies
        GROUP BY air_date
        ORDER BY air_date
    )
    SELECT air_date,total_count
    FROM cte
    WHERE total_count = (SELECT max(total_count) FROM cte)

   
-- min appearances for movie

with cte AS 
    (
        SELECT air_date,count(*) AS total_count FROM geo_movies
        GROUP BY air_date
        ORDER BY air_date
    )
    SELECT air_date,total_count
    FROM cte
    WHERE total_count = (SELECT min(total_count) FROM cte)