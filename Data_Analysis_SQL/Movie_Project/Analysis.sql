--- [movies] Write a query to display the title, rating, country, release_year, and director, for all movies directed by Michael Bay. ---
--- Sort the output by release_year (ascending)---

SELECT title, 
rating, 
country, 
release_year,
director
FROM MOVIES
WHERE DIRECTOR = 'Michael Bay'
ORDER BY release_year;

-- [movies] Write a query to display the title, country, duration_in_minutes, and date_added, for all movies that were added before March 2011. Sort the output by duration_in_minutes (ascending)
--
SELECT title, country, 
duration_in_minutes, 
date_added
FROM MOVIES
WHERE date_added < '01-03-2011'
ORDER BY duration_in_minutes;

-- [movies] Write a query to display the title, country, duration_in_minutes, and release_year, for all movies that were released between 2014 and 2016.
Sort the output by duration_in_minutes (descending) --

SELECT title, country,
duration_in_minutes, 
release_year
FROM MOVIES
WHERE release_year BETWEEN 2014 AND 2016
ORDER BY duration_in_minutes DESC;
[movies] Write a query to display the title, director, country, and duration_in_minutes,

-- for all movies with duration between 3-4 hours. Sort the output by duration_in_minutes (descending)-- 

SELECT title, 
director, 
country, 
duration_in_minutes
FROM MOVIES 
WHERE duration_in_minutes BETWEEN 180 AND 240
ORDER BY duration_in_minutes DESC ;

-- [series] Write a query to display the title, director, rating, num_of_seasons for all series with 10 to 14 seasons.
Sort the output by num_of_seasons (descending) --

SELECT title, director, rating, num_of_seasons
FROM SERIES
WHERE num_of_seasons BETWEEN 10 AND 14
ORDER BY num_of_seasons DESC;


-- [series] Write a query to display the title, director, rating, num_of_seasons
for all series- -

-- a. containing value in the director column (diretor not equals null)--

-- b. and having num_of_seasons > 7 --

SELECT title, director, rating, num_of_seasons
FROM SERIES
WHERE DIRECTOR IS NOT NULL AND NUM_OF_SEASONS > 7;

--[movies] Write a query to display the title, director, cast, country and rating, for all movies having Ryan Reynolds in their cast
--
SELECT title, director, cast, country, rating
FROM MOVIES
WHERE CAST = 'Ryan Reynolds' ;

--[movies] Write a query to display the title, director, cast, country and rating, for all movies having Ryan Reynolds and Nicolas Cage in their cast
--

SELECT title, 
director, 
cast, 
country, 
rating
FROM MOVIES
WHERE CAST = 'Ryan Reynolds' 
AND CAST = 'Nicolas Cage';
[movies] Write a query to display the title, director, cast, country, duration_in_minutes, and rating

a. for all movies having PG (Parental Guidance) in their rating

b. and movie duration is greater than 3 hours

SELECT title, 
director, 
cast, 
country, 
duration_in_minutes,
rating
FROM MOVIES
WHERE RATING LIKE '%PG%' AND DURATION_IN_MINUTES > 180;
[series] Write a query to display title, director, cast, country, and release_year for all series released in 2014, 2016, or 2018. Sort the output by title (ascending)

SELECT title, director, cast, country, release_year
FROM SERIES
WHERE release_year IN (2014,2016,2018)
