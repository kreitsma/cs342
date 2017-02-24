-- Starter code for lab 3.
--
-- CS 342, Spring, 2017
-- kvlinden

drop table Person;
drop table HouseHold;
drop table Mentorship;
drop table Team;
drop table PersonTeam;
drop table HomeGroup;

create table HouseHold(
	ID integer PRIMARY KEY,	
	street varchar(30),
	city varchar(30),
	state varchar(2),
	zipcode char(5),
	phoneNumber char(12)
	);

create table Person (
	ID integer PRIMARY KEY,
	houseHoldID integer,
	homeGroupID integer,
	title varchar(4),
	firstName varchar(15),
	lastName varchar(15),
	membershipStatus char(1) CHECK (membershipStatus IN ('m', 'a', 'c')),
	role varchar(15),
	FOREIGN KEY houseHoldID REFERENCES HouseHold(ID) ON DELETE SET NULL,
	FOREIGN KEY homeGroupID REFERENCES HomeGroup(ID) ON DELETE SET NULL
	);
	
create table Mentorship (
 	mentorID integer,
 	menteeID integer PRIMARY KEY,
 	FOREIGN KEY mentorID REFERENCES Person(ID) ON DELETE CASCADE,
 	FOREIGN KEY menteeID REFERENCES Person(ID) ON DELETE CASCADE
 	);

alter table Person add constraint house_role --If a person has a role they must be in a household
CHECK ((role IS NULL) OR (houseHoldID IS NOT NULL)); 
	
create table Team (
	ID integer PRIMARY KEY,
	name varchar(20),
	mandate varchar(100),
	); 
	
create table PersonTeam (
	personID integer,
	teamID integer,
	role varchar(30),
	FOREIGN KEY personID REFERENCES Person(ID) ON DELETE CASCADE,
	FOREIGN KEY teamID REFERENCES Team(ID) ON DELETE CASCADE
	);

create table HomeGroup (
	ID integer PRIMARY KEY,
	name varchar(50)
	);
	
create table Request (
	rDate date,
	PersonID integer,
	HouseholdID integer,
	text varchar(200),
	rAccess varchar(1),
	response varchar(200),
	FOREIGN KEY PersonID REFERENCES Person(ID) ON DELETE NO ACTION --The person shouldn't have an effect on the existence of a request.
	FOREIGN KEY HouseholdID REFERENCES Household(ID) ON DELETE CASCADE,
	CONSTRAINT RequestID PRIMARY KEY (rDate, HouseholdID)
	);


INSERT INTO Household VALUES (0,'2347 Oxford Dr. SE','Grand Rapids','MI','49506','616-243-5680');
INSERT INTO Household VALUES (1, '1291 Parnell Ave. SE','Ada','MI','49301','616-897-4927');

INSERT INTO Person VALUES (0,0,0,'mr.','Keith','VanderLinden','m','husband');
INSERT INTO Person VALUES (1,0,0,'ms.','Brenda','VanderLinden','m','wife');
INSERT INTO Person Values (2,1,0,'mr.','Kyle','Reitsma','m','student');

INSERT INTO HomeGroup VALUES (0, 'VanderLinden Homegroup');

INSERT INTO Team VALUES (0, 'Deacons', 'Financial officers of the church');
INSERT INTO Team VALUES (1, 'Praise Team', 'Worship band for services');

INSERT INTO PersonTeam VALUES (0, 0, 'Member');
INSERT INTO PersonTeam VALUES (2, 1, 'Guitar/Vocals');

INSERT INTO Mentorship VALUES (0,2);

INSERT INTO Request VALUES ('19-February-2017', 0, 1, 'I pray that this database works', 'A', null)