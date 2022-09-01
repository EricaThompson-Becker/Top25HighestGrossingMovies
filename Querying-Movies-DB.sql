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


