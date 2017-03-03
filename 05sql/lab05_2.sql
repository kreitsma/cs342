--Lab 05
--a.
SELECT firstName, lastName, birthdate FROM Person WHERE birthdate = (SELECT MAX(birthdate) FROM Person);

SELECT firstName, lastName, birthdate FROM (SELECT * FROM Person WHERE birthdate IS NOT NULL 
	ORDER BY birthdate DESC)
	WHERE ROWNUM = 1;

--b.
SELECT p1.ID, p1.firstName, p1.lastName, p2.ID, p2.firstName, p2.lastName 
	FROM Person p1, Person p2 WHERE p1.firstName = p2.firstName AND p1.ID < p2.ID;  
--This only works for two people; if there are three people with the same name, the one with the highest
--ID will be left out, and the rows of duplicate people will appear twice.

--c.
SELECT p.firstName, p.lastName FROM Person p WHERE 