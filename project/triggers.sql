--Triggers
--One winner - ensures that each category in each year cannot have more than one 'winner'
CREATE OR REPLACE TRIGGER oneWinner BEFORE INSERT ON Award FOR EACH ROW
DECLARE
	winner INTEGER;
	alreadyWinner EXCEPTION;
BEGIN
	SELECT COUNT(*) INTO winner FROM Award WHERE category = :new.category AND yearReceived = :new.yearReceived;
	
	IF winner = 1 THEN
		RAISE alreadyWinner;
	END IF;
	
EXCEPTION
	WHEN alreadyWinner THEN
		RAISE_APPLICATION_ERROR(-20000, 'There is already a winner for this category in this year');
END;
/