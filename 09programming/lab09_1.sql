--a.
--Test Count(*)
DECLARE
dummy INTEGER;
BEGIN
	FOR i in 1..1000 LOOP
		SELECT COUNT(*) INTO dummy FROM Movie;
	END LOOP;
END;
/
--Time: 00:05.46

--Count(1)
DECLARE
dummy INTEGER;
BEGIN
	FOR i in 1..1000 LOOP
		SELECT COUNT(1) INTO dummy FROM Movie;
	END LOOP;
END;
/
--Time: 00:05.46

--Sum(1)
DECLARE
dummy INTEGER;
BEGIN
	FOR i in 1..1000 LOOP
		SELECT SUM(1) INTO dummy FROM Movie;
	END LOOP;
END;
/
--Time: 00:11.77

--COUNT(1) and COUNT(*) take about the same time, but SUM(1) takes much longer.

--b.
EXPLAIN PLAN FOR SELECT * FROM Movie, Actor;
EXPLAIN PLAN FOR SELECT * FROM Actor, Movie;

--After running these multiple times each, they both only ever took 0 seconds or 0.01 seconds, meaning they
--perform the same.

--c.
EXPLAIN PLAN FOR SELECT * FROM Actor JOIN Role ON Actor.id = Role.actorId;

EXPLAIN PLAN FOR SELECT * FROM Actor JOIN Role ON Actor.id + 1 = Role.actorId + 1;

--Both queries behave about the same. They have similar elapsed times (.03 seconds) and their execution
--plans are the same.

--d. 
EXPLAIN PLAN FOR SELECT COUNT(*) FROM Actor JOIN Role ON Actor.id = Role.actorId JOIN Movie ON Role.movieId = Movie.id;
--There doesn't seem to be any difference in execution time the more times I run it.

--e.
SELECT COUNT(*) FROM Actor JOIN Role ON Actor.id = Role.actorId;
--0.07 seconds on average

CREATE INDEX idx ON Actor(lastName);

SELECT COUNT(*) FROM Actor JOIN Role ON Actor.id = Role.actorId;
--0.09 seconds on average






