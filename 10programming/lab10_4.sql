--Lab 10.4
CREATE OR REPLACE PROCEDURE incrementRank
	(movieIdIn IN Movie.id%type, 
	 deltaIn IN integer
    ) AS
	x Movie.rank%type;
BEGIN
	FOR i IN 1..50000 LOOP
		LOCK TABLE Movie IN EXCLUSIVE MODE;
		SELECT rank INTO x FROM Movie WHERE id=movieIdIn;
		UPDATE Movie SET rank=x+deltaIn WHERE id=movieIdIn;
		COMMIT;
	END LOOP;
END;
/

--It didn't run correctly because the table wasn't being locked, and therefore we were getting lost updates and dirty reads.
--By locking the table, we ensure that the entire transaction takes place before the next step in the loop occurs.