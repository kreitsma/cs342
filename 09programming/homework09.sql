--Homework 09
--1.
SELECT * FROM Movie
	JOIN MovieDirector ON Movie.id = movieId
	JOIN Director ON directorId = Director.id
		WHERE Director.id = 22104;
	
--Average time: .02 seconds

--In this case, adding an index would not only be pointless but it would also generate
--an error, as Oracle already indexes the primary keys of tables. I could have also implemented 
--it this way:
SELECT * FROM Movie, MovieDirector, Director
	WHERE Movie.id = MovieDirector.movieId
	AND MovieDirector.directorId = Director.Id
	AND Director.id = 22104;
--However, the execution plans for both were exactly the same, so I just chose the first
--one because it was more readable to me.
--If I really wanted to use an index, instead of saying 'Director.id = 22104' in the WHERE
--clause, I could instead say Director.firstName = 'Clint' AND Director.lastName = 'Eastwood'.
--Then I could create an index on the first and last names in the director table. However, that
--approach is much more tedious than simply filtering by the already-indexed id.


--2.
SELECT COUNT(*), directorId FROM MovieDirector 
	GROUP BY MovieDirector.directorId
	HAVING COUNT(*) > 200;
	
--Average time: .12 seconds

--Try adding an index on MovieDirector(directorId)
CREATE INDEX DirectorIndex ON MovieDirector(directorId);	

--After rerunning the query:
--The average time remained similar.
--I suppose I could have also implemented this query using a subselect instead of a HAVING clause.
--Something like this:
SELECT * FROM  
	(SELECT COUNT(*), directorId AS MovieCount FROM MovieDirector 
	GROUP BY MovieDirector.directorId) c
	WHERE c.MovieCount > 1;
--Not only does it take longer, it is much harder to read, which is why I chose the HAVING clause instead.
--I also noticed that adding the index does not seem to improve execution time at all. I thought that maybe adding
--an index to the directorId would help the GROUP BY clause run faster, but maybe Oracle's optimizer
--bypasses it in lieu of a better method that Oracle has.


--3.	
SELECT a.id, AVG(m.rank) FROM Actor a
	JOIN Role r ON a.id = r.actorId
	JOIN Movie m ON r.movieId = m.id
	GROUP BY a.id
	HAVING AVG(m.rank) > 5.0 AND COUNT(*) > 2
	ORDER BY AVG(m.rank) DESC;
		
--Try creating an index on actorId and movieId:
CREATE INDEX mIndex ON Role(actorId, movieId);		

--Again, the index does not seem to have an effect on the execution time. It was kind of a long shot
--to think that indexing the the actorId and movieId would speed up the join times, and it indeed did
--not improve it.
--I couldn't think of any alternate queries that could potentially be faster. I tried using an alias for the 
--AVG(m.rank) so that it wouldn't have to calculate it all three times I use it, but I got an error when I did.
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		