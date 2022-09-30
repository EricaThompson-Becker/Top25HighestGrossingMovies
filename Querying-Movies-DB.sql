/******************************************************************************************
/ Query the Movie Database 
/Contains top 25 highest grossing movies in the world. 
/ Author: Erica Thompson-Becker
/ Date: August 31, 2022
/*****************************************************************************************/

USE Movies;

-- number of movies with the genre 'Action'
SELECT COUNT(movie_id) 
FROM Type
WHERE Genre LIKE '%Action%';

-- number of movies that are rated PG
SELECT COUNT(movie_id) FROM Type
WHERE License = 'PG';

-- Find the movies released by Walt Disney Studio Motion Pictures
SELECT Movie.Title, Movie.Year, Type.Distributor FROM Type
INNER JOIN Movie ON Movie.id = Type.Movie_id
WHERE Distributor LIKE '%Walt Disney%'
ORDER BY Year;

-- Find the movies that the Movies put out by Universal Pictures
SELECT Movie.Title, Type.Distributor FROM Type
INNER JOIN Movie ON Movie.id = Type.Movie_id
WHERE Distributor LIKE '%Universal%';

-- Find the sum of the Sales by distributor and year
SELECT SUM(Sales.WorldSales), SUM(Sales.DomesticSales), SUM(Sales.InternationalSales), Type.Distributor, Movie.Year
FROM Type
INNER JOIN Movie ON Movie.id = Type.Movie_id
INNER JOIN Sales ON Movie.id = Sales.Movie_id
GROUP BY Movie.Year
ORDER BY Movie.Year;

-- Find the Movies with a length of 3hr or more
SELECT Title, Runtime
FROM Movie 
WHERE Runtime LIKE '%3hr%'; 

-- Find the Movies with a length of less than 2hr
SELECT Movie.Title, Movie.Runtime, Type.License
FROM Type 
INNER JOIN Movie ON Movie.id = Type.Movie_id
WHERE Movie.Runtime LIKE '%1hr%'; 

-- Split Genre into multiple columns 
-- Separate the genres into multiple columns 
UPDATE Type SET Genre = REPLACE(Genre, '[', '');
UPDATE Type SET Genre = REPLACE(Genre, ']', '');
UPDATE Type SET Genre = REPLACE(genre, ',','.');

SELECT
  SUBSTRING_INDEX(genre,' .', 1) AS Genre1,
  SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ' ', 2),'.', -1) AS Genre2, 
  SUBSTRING_INDEX(genre,'.', -1) AS Genre3
FROM Type

SELECT
    @genre_nums := 1 + LENGTH(genre) - LENGTH(REPLACE(genre, '.', '')) AS genre_nums,
    SUBSTRING_INDEX(genre, '.', 1) AS Genre1,
    IF(@genre_nums > 1, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 2), '.', -1), '') AS Genre2,
    IF(@genre_nums > 2, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 3), '.', -1), '') AS Genre3,
    IF(@genre_nums > 3, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 4), '.', -1), '') AS Genre4,
    IF(@genre_nums > 4, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 5), '.', -1), '') AS Genre5,
    IF(@genre_nums > 5, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 6), '.', -1), '') AS Genre6
FROM Type;

CREATE TEMPORARY TABLE Genre (
Genre_nums INT,
Genre1 Char(20),
Genre2 CHAR(20),
Genre3 CHAR(20),
Genre4 CHAR(20),
Genre5 CHAR(20),
Genre6 CHAR(20)
);
INSERT INTO Genre
SELECT
    @genre_nums := 1 + LENGTH(genre) - LENGTH(REPLACE(genre, '.', '')) AS genre_nums,
    SUBSTRING_INDEX(genre, '.', 1) AS Genre1,
    IF(@genre_nums > 1, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 2), '.', -1), '') AS Genre2,
    IF(@genre_nums > 2, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 3), '.', -1), '') AS Genre3,
    IF(@genre_nums > 3, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 4), '.', -1), '') AS Genre4,
    IF(@genre_nums > 4, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 5), '.', -1), '') AS Genre5,
    IF(@genre_nums > 5, SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '.', 6), '.', -1), '') AS Genre6
FROM Type;

SELECT * FROM Genre;




