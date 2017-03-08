--Guide 6
--1. a.
SELECT title FROM Movie, Casting WHERE Casting.performerId = 1;
--Inner join is default join, so no specifications needed.

--b.
SELECT p.firstName, p.lastName, c.movieId FROM Performer AS p LEFT OUTER JOIN Casting AS c 
	ON p.id = c.performerId;
--Gets the names of every actor and the movie they are in, even if not in a movie.

--c. 
SELECT AVG(score) FROM Movie;

--d.
SELECT AVG(score) FROM Movie GROUP BY year;
--Averages the scores of movies within groups of years