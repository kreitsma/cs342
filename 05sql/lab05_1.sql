--Lab 5

--a.
SELECT HouseHold.*, Person.* FROM HouseHold, Person;
--I get 128 rows. This is because there are 8 records in HouseHold and 16 in Person, and 8 * 16 = 128.

--b.
SELECT firstName, lastName, birthdate FROM Person WHERE birthdate IS NOT NULL ORDER BY TO_CHAR(birthdate, 'DDD');