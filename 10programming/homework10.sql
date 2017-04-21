CREATE OR REPLACE PROCEDURE transferRank ( sourceId IN integer, destId IN integer, rankAmt IN integer ) AS
	rankTooLow EXCEPTION;
	invalidId EXCEPTION;
	validMovies INTEGER;
	sourceRank FLOAT;
	destRank FLOAT;
BEGIN
	LOCK TABLE Movie IN EXCLUSIVE MODE;
	
	SELECT COUNT(*) INTO validMovies FROM Movie WHERE id = sourceId OR id = destId;
	
	IF validMovies != 2 THEN
		RAISE invalidId;
	END IF;
	
	SELECT rank INTO sourceRank FROM Movie WHERE id = sourceId;
	SELECT rank INTO destRank FROM Movie WHERE id = destId;
	
	IF (sourceRank - rankAmt < 0) THEN
		RAISE rankTooLow;
	END IF;
	
	UPDATE Movie SET rank = sourceRank + rankAmt WHERE id = destId;
	UPDATE Movie SET rank = destRank - rankAmt WHERE id = sourceId;
	
	COMMIT;
	
EXCEPTION
	WHEN rankTooLow THEN
		RAISE_APPLICATION_ERROR(-20001, 'Rank cannot go below 0'); 
		ROLLBACK;
	WHEN invalidId THEN
		RAISE_APPLICATION_ERROR(-20002, 'Invalid movie ID'); 
		ROLLBACK;
END;
/

--Test using given example
BEGIN
	FOR i IN 1..10000 LOOP
		transferRank(176712, 176711, 0.1);
		COMMIT;
		transferRank(176711, 176712, 0.1);
		COMMIT;
	END LOOP;
END;
/