a.
	INSERT INTO movie VALUES (1,'Inception',2010,9.3);

	INSERT INTO movie VALUES (null,'Inception',2010,9.3);

	INSERT INTO movie VALUES (3,'Inception',1899,9.3);

	INSERT INTO movie VALUES (3,'Inception',2010,'Very good');

	INSERT INTO movie VALUES (3,'Inception',2010,-1);
b.
	INSERT INTO casting VALUES (null, 1, 'star');

	INSERT INTO casting VALUES (7, 1, 'star');

	INSERT INTO movie VALUES (4,'Jurassic Park',1993,10.0);
c.
	DELETE FROM movie WHERE id=1;

	DELETE FROM casting WHERE movieId=2;

	UPDATE Movie SET ID=11 WHERE year=1977;