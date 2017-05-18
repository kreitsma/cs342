--Entity tables
--Legal value table for awards
create table AwardTypes (
	name varchar(20) PRIMARY KEY
	);

create table Artist (
	ID integer PRIMARY KEY,
	name varchar(100)
	);
	
create table Label (
	ID integer PRIMARY KEY,
	name varchar(80)
	);
	
	
create table Person (
	ID integer PRIMARY KEY,
	fName varchar(30) NULL,
	lName varchar(50) NULL,
	nickName varchar(50) NULL,
	CONSTRAINT infoPresent CHECK (NOT (fName IS NULL AND lName IS NULL AND nickName IS NULL))
	);
	
create table Album (
	ID integer PRIMARY KEY,
	ArtistID integer,
	name varchar(100),
	yearNominated integer,
	FOREIGN KEY (ArtistID) REFERENCES Artist(ID) ON DELETE CASCADE,
	CHECK (yearNominated > 1900 AND yearNominated < 2018)
	);
	
create table Song (
	ID integer PRIMARY KEY,
	AlbumID integer NULL,
	title varchar(50),
	yearNominated integer,
	FOREIGN KEY (AlbumID) REFERENCES Album(ID) ON DELETE CASCADE,
	CHECK (yearNominated > 1900 AND yearNominated < 2018)
	);
	
	
create table Award (
	ID integer PRIMARY KEY,
	category varchar(50),
	yearReceived integer,
	status varchar(7),
	votes integer,
	AlbumID integer,
	SongID integer,
	ArtistID integer,
	FOREIGN KEY (category) REFERENCES AwardTypes(name) ON DELETE SET NULL,
	FOREIGN KEY (AlbumID) REFERENCES Album(ID) ON DELETE CASCADE,
	FOREIGN KEY (SongID) REFERENCES Song(ID) ON DELETE CASCADE,
	FOREIGN KEY (ArtistID) REFERENCES Artist(ID) ON DELETE CASCADE,
	CHECK (yearReceived > 1900 AND yearReceived < 2018),
	CONSTRAINT st CHECK (status IN ('winner', 'nominee'))
	);
	
--Intermediary tables
	
create table AlbumLabel (
	AlbumID integer,
	LabelID integer NOT NULL,
	FOREIGN KEY (AlbumID) REFERENCES Album(ID) ON DELETE CASCADE,
	FOREIGN KEY (LabelID) REFERENCES Label(ID) ON DELETE CASCADE,
	PRIMARY KEY (AlbumID, LabelID)
	);
	
create table SongLabel (
	SongID integer,
	LabelID integer NOT NULL,
	FOREIGN KEY (SongID) REFERENCES Song(ID) ON DELETE CASCADE,
	FOREIGN KEY (LabelID) REFERENCES Label(ID) ON DELETE CASCADE,
	PRIMARY KEY (SongID, LabelID)
	);

create table AlbumPerson (
	AlbumID integer,
	PersonID integer,
	role varchar(20), --Mixer, Engineer, Producer, Performer, etc.
	FOREIGN KEY (AlbumID) REFERENCES Album(ID) ON DELETE CASCADE,
	FOREIGN KEY (PersonID) REFERENCES Person(ID) ON DELETE CASCADE,
	PRIMARY KEY (AlbumID, PersonID, role)
	);
	
create table SongPerson (
	SongID integer,
	PersonID integer,
	role varchar(20),
	FOREIGN KEY (SongID) REFERENCES Song(ID) ON DELETE CASCADE,
	FOREIGN KEY (PersonID) REFERENCES Person(ID) ON DELETE CASCADE,
	PRIMARY KEY (SongID, PersonID, role)
	);
	
create table ArtistSong (
	ArtistID integer,
	SongID integer,
	role varchar(20),
	FOREIGN KEY (ArtistID) REFERENCES Artist(ID) ON DELETE CASCADE,
	FOREIGN KEY (SongID) REFERENCES Song(ID) ON DELETE CASCADE,
	PRIMARY KEY (ArtistID, SongID)
	);
	
--Student table
create table Student (
	ID integer PRIMARY KEY,
	fName varchar(50),
	lName varchar(50),
	CONSTRAINT validID CHECK (ID < 9999999)
	);
	--This is mostly theoretical--I didn't add data to these tables for privacy reasons.
	
create table Vote (
	AwardID integer,
	StudentID integer,
	FOREIGN KEY (AwardID) REFERENCES Award(ID) ON DELETE CASCADE,
	FOREIGN KEY (StudentID) REFERENCES Student(ID) ON DELETE CASCADE,
	PRIMARY KEY (AwardID, StudentID)
	);	

	
	
	
	
	
	