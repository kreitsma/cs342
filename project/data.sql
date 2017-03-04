--Data

INSERT INTO Album VALUES (1, 1, 'w', null, null, '25', 2016);
INSERT INTO Album VALUES (2, 2, null, null, null, 'Blackstar', 2016);
INSERT INTO Album VALUES (3, 3, null, 'n', null, 'Death of a Bachelor', 2016);
INSERT INTO Album VALUES (4, 4, null, null, null, 'Blurryface', 2016);
INSERT INTO Album VALUES (5, null, null, null, 'w', 'Star Wars: The Force Awakens', 2016);
INSERT INTO Album VALUES (6, 6, null, null, null, 'Dangerous Woman', 2016);
INSERT INTO Album VALUES (7, 7, 'n', null, null, 'Lemonade', 2016);

INSERT INTO Label VALUES (1, 'Columbia Records');
INSERT INTO Label VALUES (2, 'ISO');
INSERT INTO Label VALUES (3, 'DCD2');
INSERT INTO Label VALUES (4, 'Fueled By Ramen');
INSERT INTO Label VALUES (5, 'XL Recordings');
INSERT INTO Label VALUES (6, 'Walt Disney Records');
INSERT INTO Label VALUES (7, 'Republic Records');
INSERT INTO Label VALUES (8, 'Parkwood Entertainment');


INSERT INTO Song VALUES (1, 1, 'w', 'w', 'w', null, 'Hello', 2016);
INSERT INTO Song VALUES (2, 2, null, null, null, 'w', 'Blackstar', 2016);
INSERT INTO Song VALUES (3, 4, 'n', null, null, null, 'Stressed Out', 2016);
INSERT INTO Song VALUES (4, 6, null, null, 'n', null, 'Dangerous Woman', 2016);
INSERT INTO Song VALUES (5, 7, 'n', 'n', null, null, 'Formation', 2016);

INSERT INTO Artist VALUES (1, null, 'Adele');
INSERT INTO Artist VALUES (2, null, 'David Bowie');
INSERT INTO Artist VALUES (3, null, 'Panic! At The Disco');
INSERT INTO Artist VALUES (4, null, 'Twenty One Pilots');
INSERT INTO Artist VALUES (5, 'w', 'Chance The Rapper');
INSERT INTO Artist VALUES (6, null, 'Ariana Grande');
INSERT INTO Artist VALUES (7, null, 'Beyonce')

INSERT INTO Person VALUES (1, 'Greg', 'Kurstin', null);
INSERT INTO Person VALUES (2, 'Julian', 'Burg', null);
INSERT INTO Person VALUES (3, 'Tom', 'Elmhirst', null);
INSERT INTO Person VALUES (4, 'Emile', 'Haynie', null);
INSERT INTO Person VALUES (5, 'Liam', 'Nolan', null);
INSERT INTO Person VALUES (6, 'Alex', 'Pasco', null);
INSERT INTO Person VALUES (7, 'Joe', 'Visciano', null);
INSERT INTO Person VALUES (8, 'Tom', 'Coyne', null);
INSERT INTO Person VALUES (9, 'Randy', 'Merrill', null);
INSERT INTO Person VALUES (10, 'David', 'Bowie', null);
INSERT INTO Person VALUES (11, 'Mike', 'Elizondo', null);
INSERT INTO Person VALUES (12, 'Tyler', 'Joseph', null);
INSERT INTO Person VALUES (13, 'Neal', 'Avron', null);
INSERT INTO Person VALUES (14, 'Adam', 'Hawkins', null);
INSERT INTO Person VALUES (15, 'Chris', 'Gehringer', null);
INSERT INTO Person VALUES (16, 'John', 'Williams', null);
INSERT INTO Person VALUES (17, 'Beyonce', 'Knowles', null);
INSERT INTO Person VALUES (18, 'Michael', 'Williams II', 'Mike Will Made-It');
INSERT INTO Person VALUES (19, null, null, 'Pluss');
INSERT INTO Person VALUES (20, 'Jaycen', 'Joshua', null);
INSERT INTO Person VALUES (21, 'Stuart', 'White', null);
INSERT INTO Person VALUES (22, 'Dave', 'Kutch', null);

INSERT INTO Publisher VALUES (1, 'Nipple Music', 'RZO Music, Inc');

INSERT INTO AlbumLabel VALUES (1, 1);
INSERT INTO AlbumLabel VALUES (1, 5);
INSERT INTO AlbumLabel VALUES (2, 1);
INSERT INTO AlbumLabel VALUES (2, 2);
INSERT INTO AlbumLabel VALUES (3, 3);
INSERT INTO AlbumLabel VALUES (3, 4);
INSERT INTO AlbumLabel VALUES (4, 4);
INSERT INTO AlbumLabel VALUES (5, 6);
INSERT INTO AlbumLabel VALUES (6, 7);
INSERT INTO AlbumLabel VALUES (7, 1);
INSERT INTO AlbumLabel VALUES (7, 8);

INSERT INTO PublisherSong VALUES (1, 2);

INSERT INTO AlbumPerson VALUES (1, 1, 'producer');
INSERT INTO AlbumPerson VALUES (1, 2, 'engineer/mixer');
INSERT INTO AlbumPerson VALUES (1, 3, 'engineer/mixer');
INSERT INTO AlbumPerson VALUES (1, 4, 'engineer/mixer');
INSERT INTO AlbumPerson VALUES (1, 5, 'engineer/mixer');
INSERT INTO AlbumPerson VALUES (1, 6, 'engineer/mixer');
INSERT INTO AlbumPerson VALUES (1, 7, 'engineer/mixer');
INSERT INTO AlbumPerson VALUES (1, 8, 'engineer/mixer');
INSERT INTO AlbumPerson VALUES (1, 9, 'engineer/mixer');
INSERT INTO AlbumPerson VALUES (5, 16, 'composer');


INSERT INTO SongPerson VALUES (2, 10, 'songwriter');
INSERT INTO SongPerson VALUES (3, 11, 'producer');
INSERT INTO SongPerson VALUES (3, 12, 'producer');
INSERT INTO SongPerson VALUES (3, 13, 'mixer/engineer');
INSERT INTO SongPerson VALUES (3, 14, 'mixer/engineer');
INSERT INTO SongPerson VALUES (3, 15, 'mastering engineer');
INSERT INTO SongPerson VALUES (5, 17, 'producer');
INSERT INTO SongPerson VALUES (5, 18, 'producer');
INSERT INTO SongPerson VALUES (5, 19, 'producer');
INSERT INTO SongPerson VALUES (5, 20, 'mixer/engineer');
INSERT INTO SongPerson VALUES (5, 21, 'mixer/engineer');
INSERT INTO SongPerson VALUES (5, 22, 'mastering engineer');

INSERT INTO ArtistSong VALUES (1, 1);
INSERT INTO ArtistSong VALUES (2, 2);
INSERT INTO ArtistSong VALUES (4, 3);
INSERT INTO ArtistSong VALUES (6, 4);
INSERT INTO ArtistSong VALUES (7, 5);
























--Tables of nominees

create table RecordofYear
	AS (SELECT * FROM Song WHERE RecordofYear IS NOT NULL);
	ALTER TABLE RecordofYear ADD votes integer;
	
create table AlbumofYear
	AS (SELECT * FROM Album WHERE AlbumofYear IS NOT NULL);
	ALTER TABLE AlbumofYear ADD votes integer;
	
create table SongofYear
	AS (SELECT * FROM Song WHERE SongofYear IS NOT NULL);
	ALTER TABLE SongofYear ADD votes integer;

create table BestNewArtist
	AS (SELECT * FROM Artist WHERE BestNewArtist IS NOT NULL);
	ALTER TABLE BestNewArtist ADD votes integer;

create table BestPopSoloPerformance
	AS (SELECT * FROM Song WHERE BestPopSoloPerformance IS NOT NULL);
	ALTER TABLE BestPopSoloPerformance ADD votes integer;	
	
create table BestRockSong
	AS (SELECT * FROM Song WHERE BestRockSong IS NOT NULL);
	ALTER TABLE BestRockSong ADD votes integer;
	
create table BestRockAlbum
	AS (SELECT * FROM Album WHERE BestRockAlbum IS NOT NULL);
	ALTER TABLE BestRockAlbum ADD votes integer;
	
create table BestScore
	AS (SELECT * FROM Album WHERE BestScore IS NOT NULL);
	ALTER TABLE BestScore ADD votes integer;