--Exercise 2.4

CREATE TABLE Movie (
	id integer,
	title varchar(70) NOT NULL, 
	year decimal(4), 
	score float,
	votes integer,
	PRIMARY KEY (id),
	CHECK (year > 1900)
	);

CREATE SEQUENCE movieid_sequence;

CREATE OR REPLACE TRIGGER movie_on_insert
  BEFORE INSERT ON Movie
  FOR EACH ROW
BEGIN
  SELECT movieid_sequence.NEXTVAL
  INTO :new.id
  FROM dual;
END;

--a. Yes, you would, because the sequence for movies is tied specifically to the movies table. You could
--just copy the sequence and replace the 'movie' values with 'performer' ones, though (e.g. performerid_sequence,
--performer_on_insert, etc.).

--b. Yes; while when the database is constructed, the movie id's are inserted incrementally, once the database
--is active and queryable, there is nothing stopping the user from inserting new movies that have random id's
--that do not adhere to the incremental system. This could cause confusion and disorganization in the database.

