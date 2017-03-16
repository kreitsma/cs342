--Lab 7.1
CREATE VIEW Czar AS
	SELECT firstName, lastName, TRUNC(MONTHS_BETWEEN(SYSDATE, birthdate)/12) AS age, birthdate
	FROM Person;
	
--a.
SELECT firstName, lastName, birthdate FROM Czar WHERE birthdate >= TO_DATE('1961/01/01', 'YYYY-MM-DD') AND
	birthdate <= TO_DATE('1975/12/12', 'YYYY-MM-DD');
	
--b.
UPDATE Person SET birthdate = '05-MAY-1965' WHERE ID = 4;

--Yes, the results show the updated person with the birthdate. That is because the view is non-materialized; every time
--the view is queried, it creates it from scratch, thus getting the updated value from the Person table.

--c. 
INSERT INTO Czar VALUES ('Kyle', 'Reitsma', 20, TO_DATE('1996/04/17', 'YYYY-MM-DD'));

--This yields an error: ORA-01733: virtual column not allowed here. Since this is a non-materialized view, the user is 
--not allowed to insert values into it. If it were materialized, where the view is actually stored as a new table,
--the insert would work. 

--d.
DROP VIEW Czar;

--This doesn't appear to impact the base tables in any way.