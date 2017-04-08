--HW 08.2
CREATE TABLE BaconTable (
	actorID integer PRIMARY KEY,
	baconNumber integer
	);
	
CREATE OR REPLACE PROCEDURE findBaconNumber AS (ActorIDIn IN Actor.id%TYPE, depthLvl IN integer) IS
actorPresent integer;
currentLvl integer;
BEGIN
	IF depthLvl = 1 THEN
		INSERT INTO BaconTable VALUES(ActorIDIn, 0);
	END IF;
	
	IF depthLvl > 5 THEN
		RETURN;		
	END IF;
	
	FOR Actor IN (SELECT actorId FROM Role WHERE movieId IN (SELECT movieId FROM Role WHERE actorId = ActorIDIn)) LOOP
		SELECT COUNT(*) INTO actorPresent FROM BaconTable WHERE BaconTable.actorId = Actor.actorId;
		
		IF actorPresent = 0 THEN
			INSERT INTO BaconTable VALUES (Actor.actorId, depthLvl);
			findBaconNumber(Actor.actorId, depthLvl + 1);
		ELSE
			SELECT baconNumber INTO currentLvl FROM BaconTable WHERE actorId = Actor.actorId;
			
			IF currentLvl > depthLvl THEN
				UPDATE BaconTable SET baconNumber = depthLvl WHERE actorId = Actor.actorId;
				findBaconNumber(Actor.actorId, depthLvl + 1);
			END IF;
		END IF;
	END LOOP;
END;
/

BEGIN baconNumber(22591, 1); END;
/