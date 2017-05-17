--Queries

CREATE MATERIALIZED VIEW StudentVoting AS
	SELECT category, yearReceived, winner, votes FROM Award JOIN Album ON Award.AlbumID = Album.ID
	UNION
	SELECT category, yearReceived, winner, votes FROM Award JOIN Song ON Award.SongID = Song.ID
	UNION
	SELECT category, yearReceived, winner, votes FROM Award JOIN Artist ON Award.ArtistID = Artist.ID;
--This view is for the Students who would use the voting application. They would only need to see the award 
--category, the year, whether it was a winner or nominee, and how many votes it currently has from other 
--Students. I chose a materialized view because when a vote is submitted in this view, it needs to be reflected in the
--original Award table as well, which would not happen in a non-materialized view.

--Get a list of Songs, the name of its Album, the name of its Artist, and its mastering engineer, if a song has all these things
SELECT Song.title, Album.name, Artist.name, Person.fName, Person.lName, Person.nickName FROM Song
	JOIN Album ON Song.AlbumID = Album.ID
	JOIN ArtistSong ON Song.ID = ArtistSong.SongID
	JOIN Artist ON Artist.ID = ArtistSong.ArtistID
	JOIN SongPerson ON Song.ID = SongPerson.SongID
	JOIN Person ON Person.ID = SongPerson.PersonID
		WHERE ArtistSong.role = 'artist' AND SongPerson.role = 'mastering engineer';	
--This query would be used by the main application. When showing nominees in a list, this query could be used
--to let the user see a full list of nominated songs, along with who wrote them, what album they're from, and their
--mastering engineers.

--Get a full list of songs and their album (and artist), even if they do not belong to an album
SELECT Song.title, Album.name, Artist.name FROM Album
	INNER JOIN Artist ON Album.ArtistID = Artist.ID
	LEFT OUTER JOIN Song ON Song.AlbumID = Album.ID;
--This could be used to measure statistics such as what percent of nominees are singles vs. tracks from albums.

--Gets all of the people who are known only by their nickname
SELECT Person.nickName FROM Person 
	WHERE Person.fName IS NULL 
	AND Person.lName IS NULL 
	AND Person.nickName IS NOT NULL;
--I'm not sure this is useful for the user or stakeholder in any way, but I couldn't think of how to properly compare NULL
--values in another query.

--Selects the category (in this case, Album of the Year) and names of albums that are currently winning in votes for each year.
SELECT Award.category, Album.name FROM Award
	JOIN Album ON Award.AlbumID = Album.ID
	WHERE (SELECT MAX(votes)
				 FROM Award
				 WHERE Award.category = 'Album of the Year'
				 GROUP BY Award.yearReceived)
	AND Award.category = 'Album of the Year';
--This query would be used when determining the winner of the voting for each category and year--it would be modified slightly
--for the other categories, but has the same principle.

--Shows all pairs of albums by a single artist that have been nominated, if the artist has had more than one album nominated.
SELECT Artist.name, a.name, b.name FROM Album a, Album b, Artist
	WHERE a.ArtistID = Artist.ID
	AND a.ArtistID = b.ArtistID
	AND a.ID < b.ID;
--Again, I'm not entirely sure about the utility of this query. It could be useful for getting a list of artists with more than
--one album nominated, but I couldn't think of a better query to demonstrate a self-join.
	
	
	
	
	
	