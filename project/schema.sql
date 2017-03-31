--Entity tables

create table Artist (
	ID integer PRIMARY KEY,
	name varchar(100)
	);
	
create table Label (
	ID integer PRIMARY KEY,
	name varchar(80)
	);
	
create table Publisher (
	ID integer PRIMARY KEY,
	name varchar(50),
	adminBy varchar(80)
	);
	
create table Person (
	ID integer PRIMARY KEY,
	fName varchar(30),
	lName varchar(50),
	nickName varchar(50)
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
	AlbumID integer,
	title varchar(50),
	yearNominated integer,
	FOREIGN KEY (AlbumID) REFERENCES Album(ID) ON DELETE CASCADE,
	CHECK (yearNominated > 1900 AND yearNominated < 2018)
	);
	
	
create table Award ( --Get rid of ID and make year and category a super primary key?
	ID integer PRIMARY KEY,
	category varchar(50),
	yearReceived year,
	winner varchar(7) --'winner' or 'nominee'
	AlbumID integer,
	SongID integer,
	ArtistID integer,
	FOREIGN KEY (AlbumID) REFERENCES Album(ID) ON DELETE CASCADE,
	FOREIGN KEY (SongID) REFERENCES Song(ID) ON DELETE CASCADE,
	FOREIGN KEY (ArtistID) REFERENCES Artist(ID) ON DELETE CASCADE
	);
	
create table AwardCategories (
	name varchar(50)
	);
	
--Intermediary tables
	
create table AlbumLabel (
	AlbumID integer,
	LabelID integer NOT NULL,
	FOREIGN KEY (AlbumID) REFERENCES Album(ID) ON DELETE CASCADE,
	FOREIGN KEY (LabelID) REFERENCES Label(ID) ON DELETE CASCADE
	);
	
create table SongLabel (
	SongID integer,
	LabelID integer NOT NULL,
	FOREIGN KEY (SongID) REFERENCES Song(ID) ON DELETE CASCADE,
	FOREIGN KEY (LabelID) REFERENCES Label(ID) ON DELETE CASCADE
	);
	
create table PublisherSong (
	SongID integer,
	PublisherID integer,
	FOREIGN KEY (SongID) REFERENCES Song(ID) ON DELETE CASCADE,
	FOREIGN KEY (PublisherID) REFERENCES Publisher(ID) ON DELETE CASCADE
	); 

create table AlbumPerson (
	AlbumID integer,
	PersonID integer,
	role varchar(10), --Mixer, Engineer, Producer, Performer, etc.
	FOREIGN KEY (AlbumID) REFERENCES Album(ID) ON DELETE CASCADE,
	FOREIGN KEY (PersonID) REFERENCES Person(ID) ON DELETE CASCADE
	);
	
create table SongPerson (
	SongID integer,
	PersonID integer,
	role varchar(10),
	FOREIGN KEY (SongID) REFERENCES Song(ID) ON DELETE CASCADE,
	FOREIGN KEY (PersonID) REFERENCES Person(ID) ON DELETE CASCADE
	);
	
create table ArtistSong (
	ArtistID integer,
	SongID integer,
	role varchar(20),
	FOREIGN KEY (ArtistID) REFERENCES Artist(ID) ON DELETE CASCADE,
	FOREIGN KEY (SongID) REFERENCES Song(ID) ON DELETE CASCADE
	);
	
--Student table
create table Student (
	ID integer PRIMARY KEY,
	fName varchar(50),
	lName varchar(50),
	CHECK (ID < 9999999)
	);
	
	
	
	
	
	