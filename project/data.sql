--Data

INSERT INTO Album VALUES (1, 1, '25', 2016);
INSERT INTO Album VALUES (2, 2, 'Blackstar', 2016);
INSERT INTO Album VALUES (3, 3, 'Death of a Bachelor', 2016);
INSERT INTO Album VALUES (4, 4, 'Blurryface', 2016);
INSERT INTO Album VALUES (5, null, 'Star Wars: The Force Awakens', 2016);
INSERT INTO Album VALUES (6, 6, 'Dangerous Woman', 2016);
INSERT INTO Album VALUES (7, 7, 'Lemonade', 2016);
INSERT INTO Album VALUES (8, 8, 'Lukas Graham', 2016);
INSERT INTO Album VALUES (9, 11, 'Blurryface', 2016);

INSERT INTO Label VALUES (1, 'Columbia Records');
INSERT INTO Label VALUES (2, 'ISO');
INSERT INTO Label VALUES (3, 'DCD2');
INSERT INTO Label VALUES (4, 'Fueled By Ramen');
INSERT INTO Label VALUES (5, 'XL Recordings');
INSERT INTO Label VALUES (6, 'Walt Disney Records');
INSERT INTO Label VALUES (7, 'Republic Records');
INSERT INTO Label VALUES (8, 'Parkwood Entertainment');
INSERT INTO Label VALUES (9, 'Warner Bro. Records');
INSERT INTO Label VALUES (10, 'Westbury Road Entertainment');


INSERT INTO Song VALUES (1, 1, 'Hello', 2016);
INSERT INTO Song VALUES (2, 2, 'Blackstar', 2016);
INSERT INTO Song VALUES (3, 4, 'Stressed Out', 2016);
INSERT INTO Song VALUES (4, 6, 'Dangerous Woman', 2016);
INSERT INTO Song VALUES (5, 7, 'Formation', 2016);
INSERT INTO Song VALUES (6, 8, '7 Years', 2016);
INSERT INTO Song VALUES (7, null, 'Work', 2016);
INSERT INTO Song VALUES (8, 9, 'Stressed Out', 2016);

INSERT INTO Artist VALUES (1, 'Adele');
INSERT INTO Artist VALUES (2, 'David Bowie');
INSERT INTO Artist VALUES (3, 'Panic! At The Disco');
INSERT INTO Artist VALUES (4, 'Twenty One Pilots');
INSERT INTO Artist VALUES (5, 'Chance The Rapper');
INSERT INTO Artist VALUES (6, 'Ariana Grande');
INSERT INTO Artist VALUES (7, 'Beyonce');
INSERT INTO Artist VALUES (8, 'Lukas Graham');
INSERT INTO Artist VALUES (9, 'Rihanna');
INSERT INTO Artist VALUES (10, 'Drake');
INSERT INTO Artist VALUES (11, 'Twenty One Pilots');

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
INSERT INTO Person VALUES (23, null, null, 'Future Animals');
INSERT INTO Person VALUES (24, null, null, 'Pilo');
INSERT INTO Person VALUES (25, 'Delbert', 'Bowers', null);
INSERT INTO Person VALUES (26, 'Sebastian', 'Fogh', null);
INSERT INTO Person VALUES (27, 'Stefan', 'Forrest', null);
INSERT INTO Person VALUES (28, 'David', 'LaBrel', null);
INSERT INTO Person VALUES (29, 'Tom', 'Coyne', null);
INSERT INTO Person VALUES (30, null, null, 'Boi-1da');
INSERT INTO Person VALUES (31, 'Noel', 'Campbell', 'Gadget');
INSERT INTO Person VALUES (32, 'Kuk', 'Harrell', null);
INSERT INTO Person VALUES (33, 'Manny', 'Marroquin', null);
INSERT INTO Person VALUES (34, 'Noah', 'Shebib', '40');
INSERT INTO Person VALUES (35, 'Marcos', 'Tovar', null);
INSERT INTO Person VALUES (36, 'Chris', 'Gehringer', null);

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
INSERT INTO AlbumLabel VALUES (8, 9);

INSERT INTO SongLabel VALUES (7, 10);

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
INSERT INTO SongPerson VALUES (6, 23, 'producer');
INSERT INTO SongPerson VALUES (6, 24, 'producer');
INSERT INTO SongPerson VALUES (6, 25, 'mixer/engineer');
INSERT INTO SongPerson VALUES (6, 26, 'mixer/engineer');
INSERT INTO SongPerson VALUES (6, 27, 'mixer/engineer');
INSERT INTO SongPerson VALUES (6, 28, 'mixer/engineer');
INSERT INTO SongPerson VALUES (6, 29, 'mastering engineer');
INSERT INTO SongPerson VALUES (7, 30, 'producer');
INSERT INTO SongPerson VALUES (7, 31, 'mixer/engineer');
INSERT INTO SongPerson VALUES (7, 32, 'mixer/engineer');
INSERT INTO SongPerson VALUES (7, 33, 'mixer/engineer');
INSERT INTO SongPerson VALUES (7, 34, 'mixer/engineer');
INSERT INTO SongPerson VALUES (7, 35, 'mixer/engineer');
INSERT INTO SongPerson VALUES (7, 36, 'mastering engineer');

INSERT INTO ArtistSong VALUES (1, 1, 'artist');
INSERT INTO ArtistSong VALUES (2, 2, 'artist');
INSERT INTO ArtistSong VALUES (4, 3, 'artist');
INSERT INTO ArtistSong VALUES (6, 4, 'artist');
INSERT INTO ArtistSong VALUES (7, 5, 'artist');
INSERT INTO ArtistSong VALUES (8, 6, 'artist');
INSERT INTO ArtistSong VALUES (9, 7, 'artist');
INSERT INTO ArtistSong VALUES (10, 7, 'featured artist');






