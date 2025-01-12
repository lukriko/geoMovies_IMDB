SELECT * FROM geo_movies;


-- calculate sum votes per year per movie

SELECT "title","votes","air_date",
    COUNT('title') OVER(PARTITION BY "air_date") as "total_movie_count",
    SUM("votes") OVER(PARTITION BY "air_date") as "total_sum"
    FROM geo_movies
    ORDER BY Air_date ASC;

    -- calculate sum votes per year
SELECT air_date,sum("votes"),count("title") FROM geo_movies
GROUP BY air_date
ORDER BY air_date ASC;



-- max sum votes per year (popularity by votes)

WITH cte AS 
(
    SELECT air_date, SUM("votes") AS total_votes, COUNT("title") AS movie_count
    FROM geo_movies
    GROUP BY air_date
    ORDER BY air_date ASC
)
SELECT air_date, total_votes
FROM cte
WHERE total_votes = (SELECT MAX(total_votes) FROM cte);


-- min sum votes per year (minimum popularity)

WITH cte AS 
(
    SELECT air_date, SUM("votes") AS total_votes, COUNT("title") AS movie_count
    FROM geo_movies
    GROUP BY air_date
    ORDER BY air_date ASC
)
SELECT air_date, total_votes
FROM cte
WHERE total_votes = (SELECT MIN(total_votes) FROM cte);