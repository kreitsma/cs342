--HW 08.1
CREATE TABLE RankLog (
	userName varchar(30),
	dateOfChange date,
	movieID integer,
	o_rank number(10,2),
	m_rank number(10,2)
	);

CREATE OR REPLACE TRIGGER rankUpdate BEFORE UPDATE ON Movie FOR EACH ROW
BEGIN
	INSERT INTO RankLog VALUES (USER, SYSDATE, :OLD.id, :OLD.rank, :NEW.rank);
END;
/