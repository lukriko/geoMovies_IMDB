SELECT * FROM geo_movies;

-- calculate average rating per year per movie

SELECT "title","air_date", AVG("rating")
    OVER(PARTITION BY "air_date") as "average_rating"
    FROM geo_movies
    ORDER BY Air_date ASC;

-- calculate average rating per year

SELECT "air_date",avg(rating) FROM geo_movies
GROUP BY air_date
ORDER BY air_date ASC;


