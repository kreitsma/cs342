--Procedures
CREATE OR REPLACE PROCEDURE voting (studentIdIn IN integer, awardIdIn IN integer) AS 
	--Exceptions
	alreadyVoted EXCEPTION;
	invalidId EXCEPTION;
	--Variables
	awardFound INTEGER;
	studentFound INTEGER;
	voted INTEGER;
BEGIN
--Lock tables
	LOCK TABLE Vote IN EXCLUSIVE MODE;
	LOCK TABLE Award IN EXCLUSIVE MODE;
	
	--See if these ID's are valid (there is exactly one entry for each)
	SELECT COUNT(*) INTO studentFound FROM Student WHERE id = studentIdIn;
	SELECT COUNT(*) INTO awardFound FROM Award WHERE id = awardIdIn;

	IF studentFound != 1 OR awardFound != 1 THEN
		RAISE invalidId;
	END IF;
	
	--See if Student has already voted
	SELECT COUNT(*) INTO voted FROM Vote WHERE StudentID = studentIdIn AND AwardID = awardIdIn;
	
	IF voted =1 THEN
		RAISE alreadyVoted;
	END IF;
	
	--Record the vote in the Vote table, and increment the number of votes in the Award table
	INSERT INTO Vote VALUES(awardIdIn, studentIdIn);
	UPDATE Award SET votes = votes + 1 WHERE id = awardIdIn;
	
	COMMIT;
	
EXCEPTION
	--Exceptions; rollback when raised
	WHEN alreadyVoted THEN
		RAISE_APPLICATION_ERROR(-20000, 'Student has already voted for this category in this year');
		ROLLBACK;
	WHEN invalidId THEN
		RAISE_APPLICATION_ERROR(-20001, 'One of the IDs was invalid');
		ROLLBACK;
END;
/