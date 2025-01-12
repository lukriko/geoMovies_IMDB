SELECT * FROM geo_movies
LIMIT 5;

-- identify the movies or shows with the highest number of votes.
SELECT "rating","votes","title" FROM geo_movies
ORDER BY "votes" DESC
LIMIT 10;