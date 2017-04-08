--Lab 8.2
CREATE TABLE SequelsTemp (
	id integer,
	name varchar2(100),
	PRIMARY KEY(id)
	);
	
CREATE OR REPLACE PROCEDURE getSequels (movieIdIn IN Movie.id%type) AS
CURSOR sequel IS
	SELECT sequelId FROM Movie WHERE Movie.id = movieIDIn;
	
BEGIN
	FOR i IN sequel LOOP
		INSERT INTO SequelsTemp VALUES (i.id, i.name);
		getSequels(i.id)
	END LOOP;
END;
/

BEGIN  getSequels(238071);  END;
/
SELECT * FROM SequelsTemp;
--4 sequels

BEGIN  getSequels(238075);  END;
/
SELECT * FROM SequelsTemp;
--No sequels