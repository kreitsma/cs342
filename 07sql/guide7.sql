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