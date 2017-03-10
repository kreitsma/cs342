--6.2
--a.
SELECT AVG(TRUNC((MONTHS_BETWEEN(SYSDATE, birthdate)) / 12)) FROM Person;

--It's not necessarily grouping because it is grabbing all the values from Person, but technically there
--is a hidden clause at the end saying 'GROUP BY Person.ID'. Since ID is a primary key, it is grouping
--the entire table together.

--b.
SELECT HouseHold.ID, COUNT(Person.*) FROM HouseHold, Person WHERE HouseHold.city = "Grand Rapids"
	AND COUNT