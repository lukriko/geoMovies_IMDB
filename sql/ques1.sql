-- •	What time period does the dataset cover based on the air dates?

    SELECT min("air_date") || ' - ' || max("air_date") 
        as "Time_period"
    FROM geo_movies;

-- •	How has the average movie rating changed over time?

    SELECT "air_date",round(avg("rating")::NUMERIC,2)
    FROM geo_movies
    GROUP BY "air_date"
    ORDER BY "air_date" ASC;

-- avg_percentage_change per year

WITH cte_1 AS (
    SELECT "air_date",round(avg("rating")::NUMERIC,2) AS avg_rat
    FROM geo_movies
    GROUP BY "air_date"
    ORDER BY "air_date" ASC
)
    SELECT c1.air_date as "previous_year" ,
            c2.air_date as "after",
            c1.avg_rat as "prev",
            c2.avg_rat as "after",
            round(((c2.avg_rat - c1.avg_rat)/c1.avg_rat)::NUMERIC,2) || '%'
             AS "avg_percent_change"
            From cte_1 as c1
            JOIN cte_1 c2
                ON c2.air_date = c1.air_date::NUMERIC + 1
                ORDER BY  round(((c2.avg_rat - c1.avg_rat)/c1.avg_rat)::NUMERIC,2) DESC;


