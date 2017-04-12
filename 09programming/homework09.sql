--Homework 09
SELECT * FROM Movie
	JOIN MovieDirector ON Movie.id = movieId
	JOIN Director ON directorId = Director.id
		WHERE Director.id = 22104;

SELECT COUNT(*) FROM Movie WHERE 2 < 
	(SELECT COUNT(*) FROM Movie
		JOIN MovieDirector ON Movie.id = movieId
		JOIN Director ON directorId = Director.id
		GROUP BY Director.id);
		

		
		
		SELECT * FROM Actor
	JOIN Role ON Actor.id = Role.actorId
	JOIN Movie ON Role.movieId = Movie.id
		WHERE 20 < (SELECT COUNT(*) FROM Role);