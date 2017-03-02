-- This command file loads an experimental person relation.
-- The data conforms to the following assumptions:
--     * Person IDs and team names are unique for people and teams respectively.
--     * People can have at most one mentor.
--     * People can be on many teams, but only have one role per team.
--     * Teams meet at only one time.
--
-- CS 342
-- Spring, 2017
-- kvlinden

drop table AltPerson;

CREATE TABLE AltPerson (
	personId integer,
	name varchar(10),
	status char(1),
	mentorId integer,
	mentorName varchar(10),
	mentorStatus char(1),
    teamName varchar(10),
    teamRole varchar(10),
    teamTime varchar(10)
	);

INSERT INTO AltPerson VALUES (0, 'Ramez', 'v', 1, 'Shamkant', 'm', 'elders', 'trainee', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'elders', 'chair', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'executive', 'protem', 'Wednesday');
INSERT INTO AltPerson VALUES (2, 'Jennifer', 'v', 3, 'Jeff', 'm', 'deacons', 'treasurer', 'Tuesday');
INSERT INTO AltPerson VALUES (3, 'Jeff', 'm', NULL, NULL, NULL, 'deacons', 'chair', 'Tuesday');

--a. The relation is not well-designed because if an AltPerson belongs to more than one team (e.g. Shamkant), they have to have multiple
--rows in the table, essentially creating two separate people.
--This table is not in BCNF. The dependencies are:
--PersonID -> name, status, mentorID, mentorName, mentorStatus
--teamName -> teamTime
--PersonID, teamName -> teamRole
--
--There are no primary keys in this relation. Therefore, all of the functional dependencies must have a nontrivial superkey on the LHS
--that is made up of one or more attributes. Since neither teamName nor PersonID are candidate keys by themselves, this table is not in BCNF.



--b. properly normalized

drop table NewAltPerson; 

CREATE TABLE NewAltPerson (
	PersonID integer PRIMARY KEY,
	name varchar(10),
	status varchar (1),
	mentorId integer,
	mentorName varchar(10),
	mentorStatus char(1),
	);
	
CREATE TABLE AltPersonTeam (
	PersonID integer,
	TeamID integer,
	teamRole varchar(10),
	FOREIGN KEY PersonID REFERENCES AltPerson(PersonID) ON DELETE CASCADE,
	FOREIGN KEY TeamID REFERENCES Team(TeamID) ON DELETE CASCADE
	);
	
CREATE TABLE Team (
	teamID integer PRIMARY KEY,
	teamName varchar(10),
	teamTime varchar(10)
	);

INSERT INTO NewAltPerson SELECT DISTINCT PersonID, name, status, mentorName, mentorStatus FROM AltPerson;
INSERT INTO AltPersonTeam SELECT DISTINCT PersonID, teamRole FROM AltPerson; --We'd have to make TeamID's ourselves
INSERT INTO Team SELECT DISTINCT teamName, teamTime FROM AltPerson;

SELECT * FROM NewAltPerson;
SELECT * FROM AltPersonTeam;
SELECT * FROM Team;

--Display old table:
SELECT p.PersonID, p.name, p.status, p.mentorId, p.mentorName, p.mentorStatus, pt.teamRole, t.teamName, t.teamTime
	FROM NewAltPerson p, AltPersonTeam, Team
	WHERE p.PersonID = pt.PersonID AND pt.TeamID = t.teamID;


	