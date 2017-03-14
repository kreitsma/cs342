--Guide 7

--a.
CREATE VIEW MoviesThisYear AS
	SELECT id, title, year, score, votes
	FROM Movie
	WHERE year = '2017'
WITH CHECK OPTION CONSTRAINT MoviesThisYearCnst;

--b.
--i. A base table is a table where each tuple is physically stored in the database.
--ii. This is a view containing multiple joined tables.
--iii. Join views that can be updated as the data in the corresponding tables are updated.
--iv. A key preserved table means that for all of the views the table is involved in, the table key participates in the views
--    as a key.
--v. Query modification is modifying or transforming the view query into a query on the underlying base tables.
--    View materialization is physically creating a temporary or permanent view table when the first view is queried 
--    and keeping that table on the assumption that other queries on the view will follow.

--a.
bladerunner <- SELECT_title='Blade Runner'(Movie)
moviecast <- (bladerunner JOIN_id=movieId Casting)
performers <- (moviecast JOIN_id=performerId Performer)
RESULT <- PROJECT_title, firstName, lastName, status(Performer)
RENAME_RESULT(BladeRunner)

--b.
{p.firstName, p.lastName | Performer(p) AND (Ec)(Casting(c) AND c.performerId = p.id AND status='star')}
--E is supposed to be backwards E - gets all performers who have been stars

--c.
--An existential quantifier means the same thing as 'there exists/there is at least one'. So a formula F is true
--if there exists a tuple that proves it true.

--A universal quantifier means 'for all'. So a formula F is true if with tuple t, every tuple assigned to free occurences
--of t in F is true, otherwise it is false.

--safe expressions are guaranteed to yield a finite number of tuples.