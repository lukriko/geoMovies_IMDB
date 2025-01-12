-- A rating greater than the global average plus its standard deviation.
-- Belong to an air_date group with more than 2 movies.

WITH aggregated_data AS (
    SELECT 
        *,
        AVG("rating") OVER (PARTITION BY air_date) AS avg_rating_by_air_date,
        COUNT("title") OVER (PARTITION BY air_date) AS count_by_air_date
    FROM geo_movies
)
SELECT *
FROM aggregated_data
WHERE "rating" > (
    SELECT AVG("rating") + STDDEV("rating")
    FROM geo_movies
)
AND count_by_air_date > 2;
