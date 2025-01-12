SELECT 
    "air_date",
    "votes",
    "rating"
FROM geo_movies
WHERE ("votes", "rating") IN (
    SELECT 
        MIN("votes") AS minimum_votes,
        MAX("rating") AS maximum_rating
    FROM geo_movies
    GROUP BY "air_date"
)
ORDER BY "air_date" ASC;
