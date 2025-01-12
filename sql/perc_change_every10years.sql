-- •	Calculate the percentage change in
--  the total number of movies released last 10 years.

SELECT * FROM geo_movies;

-- identify date range
SELECT MAX(air_date),MAX(air_date) - 10 FROM geo_movies;


-- select sum of total count of movie per year
SELECT air_date,count(*) AS total_movie_count
    FROM geo_movies
    WHERE air_date < (SELECT MAX(air_date)
                        FROM geo_movies) AND
    air_date > (SELECT MAX(air_date) - 10
                        FROM geo_movies)
    GROUP BY air_date;


-- calculate percentage change
WITH cte AS
    (
        SELECT air_date,count(*) AS total_movie_count
        FROM geo_movies
        WHERE air_date < (SELECT MAX(air_date)
                            FROM geo_movies) AND
        air_date > (SELECT MAX(air_date) - 10
                            FROM geo_movies)
        GROUP BY air_date
    )
        SELECT 
            c1.air_date AS "previous year",
            c2.air_date AS "followng year",
            c1.total_movie_count AS "previous year movie count",
            c2.total_movie_count AS "following year movie count",
            ROUND(((c2.total_movie_count - c1.total_movie_count)::NUMERIC/
            c1.total_movie_count)*100,1) || '%' AS percentage_change
            FROM cte c1
                JOIN cte c2
                    ON c2.air_date = c1.air_date::NUMERIC + 1
            ORDER BY 
                (c2.total_movie_count - c1.total_movie_count)::NUMERIC/
                c1.total_movie_count DESC;
                    


