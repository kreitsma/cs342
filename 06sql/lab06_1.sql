--Lab 6.1
--a.
SELECT Team.name, Team.mandate, PersonTeam.personID FROM Team LEFT OUTER JOIN
	PersonTeam ON Team.name = PersonTeam.teamName AND PersonTeam.role = 'chair';