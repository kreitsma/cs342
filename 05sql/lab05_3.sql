--5.3
--a.
SELECT DISTINCT h.lastName || ', ' || h.firstName || ' and ' || w.firstName || ' - ' || Hh.phoneNumber || ' - ' || Hh.street
	FROM Household Hh, Person h, Person w WHERE Hh.ID = h.householdID AND Hh.ID = w.householdID
	AND h.householdRole = 'husband' AND w.householdRole = 'wife' AND h.lastName = w.lastName;
	
--b.
SELECT DISTINCT h.lastName || ', ' || h.firstName || ' and ' || w.firstName || ' - ' || Hh.phoneNumber || ' - ' || Hh.street
	FROM Household Hh, Person h, Person w WHERE Hh.ID = h.householdID AND Hh.ID = w.householdID 
	AND h.householdRole = 'husband' AND w.householdRole = 'wife' AND h.lastName = w.lastName
	UNION
SELECT DISTINCT h.lastName || ', ' || h.firstName || ' and ' || w.firstName || ' ' || w.lastName || ' - ' || Hh.phoneNumber || ' - ' || Hh.street
	FROM Household Hh, Person h, Person w WHERE Hh.ID = h.householdID AND Hh.ID = w.householdID 
	AND h.householdRole = 'husband' AND w.householdRole = 'wife' AND h.lastName <> w.lastName;
	
--c.
SELECT DISTINCT h.lastName || ', ' || h.firstName || ' and ' || w.firstName || ' - ' || Hh.phoneNumber || ' - ' || Hh.street
	FROM Household Hh, Person h, Person w WHERE Hh.ID = h.householdID AND Hh.ID = w.householdID 
	AND h.householdRole = 'husband' AND w.householdRole = 'wife' AND h.lastName = w.lastName
	UNION
SELECT DISTINCT h.lastName || ', ' || h.firstName || ' and ' || w.firstName || ' ' || w.lastName || ' - ' || Hh.phoneNumber || ' - ' || Hh.street
	FROM Household Hh, Person h, Person w WHERE Hh.ID = h.householdID AND Hh.ID = w.householdId 
	AND h.householdRole = 'husband' AND w.householdRole = 'wife' AND h.lastName <> w.lastName
	UNION
SELECT p.lastName || ', ' || p.firstName || ' - ' || Hh.phonenumber || ' - ' || Hh.street 
	FROM Household Hh, Person p WHERE p.householdID = Hh.ID AND p.householdRole = 'single';