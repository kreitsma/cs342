--Lab 8
CREATE OR REPLACE TRIGGER castAttempt BEFORE INSERT ON Role FOR each row
DECLARE
	counter INTEGER;
	actorAlreadyCast EXCEPTION;
	castFull EXCEPTION;
BEGIN
	--Check if actor is already cast
	SELECT COUNT(*) INTO counter FROM Role
		WHERE actorID = :new.actorID
		AND movieID = :new.movieID;
		
	IF counter > 0 THEN
		RAISE actorAlreadyCast;
	END IF;

	--reset counter
	counter := 0;
	
	--Check if there are less than 230 castings
	SELECT COUNT(*) INTO counter FROM Role
		WHERE movieID = :new.movieID;
		
	IF counter >= 230 THEN
		RAISE castFull;
	END IF;
		
EXCEPTION
	WHEN actorAlreadyCast THEN
		RAISE_APPLICATION_ERROR(-20001, 'Actor is already cast:' ||:new.actorID);
	WHEN castFull THEN
		RAISE_APPLICATION_ERROR(-20001, 'Cast of this movie is full:' ||:new.movieID);
END;
/

CREATE OR REPLACE PROCEDURE castActor (ActorIDIn IN Actor.id%TYPE, MovieIDIn IN Movie.id%TYPE, RoleIn IN Role.role%TYPE) IS
BEGIN
	--Update Role table
	INSERT INTO Role
	VALUES (ActorIDIn, MovieIDIn, RoleIn); 
END;
/

--Call procedure
BEGIN castActor (89558, 238072, 'Danny Ocean'); END;
/

BEGIN castActor (89558, 238073, 'Danny Ocean'); END;
/

BEGIN castActor (89558, 167324, 'Danny Ocean'); END;
/



