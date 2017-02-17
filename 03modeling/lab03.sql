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

alter table Person add constraint house_role --If a person has a role they must be in a household
CHECK ((role IS NULL) OR (houseHoldID IS NOT NULL)); 
	
create table Mentorship (
	mentorID integer PRIMARY KEY,
	menteeID integer, 
	FOREIGN KEY mentorID REFERENCES Person(ID) ON DELETE CASCADE,
	FOREIGN KEY menteeID REFERENCES Person(ID) ON DELETE CASCADE
	);
	
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


INSERT INTO Household VALUES (0,'2347 Oxford Dr. SE','Grand Rapids','MI','49506','616-243-5680');

INSERT INTO Person VALUES (0,0,0,'mr.','Keith','VanderLinden','m','husband');
INSERT INTO Person VALUES (1,0,0,'ms.','Brenda','VanderLinden','m','wife');

INSERT INTO HomeGroup VALUES (0, 'VanderLinden Homegroup');

INSERT INTO Team VALUES (0, 'Deacons', 'Financial officers of the church');

INSERT INTO PersonTeam (0, 0, 'Supreme Overlord');