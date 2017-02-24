-- This command file loads an experimental person database.
-- The data conforms to the following assumptions:
--     * People can have 0 or many team assignments.
--     * People can have 0 or many visit dates.
--     * Teams and visits don't affect one another.
--
-- CS 342, Spring, 2017
-- kvlinden

DROP TABLE PersonTeam;
DROP TABLE PersonVisit;

CREATE TABLE PersonTeam (
	personName varchar(10),
    teamName varchar(10)
	);

CREATE TABLE PersonVisit (
	personName varchar(10),
    personVisit date
	);

-- Load records for two team memberships and two visits for Shamkant.
INSERT INTO PersonTeam VALUES ('Shamkant', 'elders');
INSERT INTO PersonTeam VALUES ('Shamkant', 'executive');
INSERT INTO PersonVisit VALUES ('Shamkant', '22-FEB-2015');
INSERT INTO PersonVisit VALUES ('Shamkant', '1-MAR-2015');

-- Query a combined "view" of the data of the form View(name, team, visit).
SELECT pt.personName, pt.teamName, pv.personVisit
FROM PersonTeam pt, PersonVisit pv
WHERE pt.personName = pv.personName;

--a. Functional Dependencies:
--There are no functional dependencies. Therefore, the relations are in BCNF.
--Multivalued Dependencies:
--personName ->-> teamName | personVisit
--personName ->-> personVisit | teamName
--Since personName is not a candidate key, this relation is not in 4NF.
--
--b. Functional Dependencies:
--There are no functional dependencies. Therefore, the relations are in BCNF.
--Multivalued Dependencies:
--personName ->-> teamName, personVisit
--This relation is in both BCNF and 4NF as the LHS of all Multivalued Dependencies are candidate keys.
--
--c. They are not equally aprropriate. The two tabled version is better, despite not being in 4NF, as it allows a person to be on 
--multiple teams without creating redundant rows. I guess the joined tables would be slightly faster is you would have direct access to
--the attributes, but it is still not good design.
--
--



