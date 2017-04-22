--Procedures
CREATE OR REPLACE PROCEDURE voting (studentIdIn IN integer, awardIdIn IN integer) AS 
	alreadyVoted EXCEPTION;
	invalidId EXCEPTION;
	awardFound INTEGER;
	studentFound INTEGER;
	voted INTEGER;
BEGIN
	
	SELECT COUNT(*) INTO studentFound FROM Student WHERE id = studentIdIn;
	SELECT COUNT(*) INTO awardFound FROM Award WHERE id = awardIdIn;

	IF studentFound != 1 OR awardFound != 1 THEN
		RAISE invalidId;
	END IF;
	
	SELECT COUNT(*) INTO voted FROM Vote WHERE StudentID = studentIdIn AND AwardID = awardIdIn;
	
	IF voted =1 THEN
		RAISE alreadyVoted;
	END IF;
	
	INSERT INTO Vote VALUES(awardIdIn, studentIdIn);
	UPDATE Award SET votes = votes + 1 WHERE id = awardIdIn;
	
EXCEPTION
	WHEN alreadyVoted THEN
		RAISE_APPLICATION_ERROR(-20000, 'Student has already voted for this category in this year');
	WHEN invalidId THEN
		RAISE_APPLICATION_ERROR(-20001, 'One of the IDs was invalid');
END;
/