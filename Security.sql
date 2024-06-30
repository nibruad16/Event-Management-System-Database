CREATE ROLE Admin;
GRANT All	PRIVILEGES on E_Managements to Admin;

CREATE ROLE Organizer;
GRANT EXECUTE ON PROCEDURE CreateEvents TO Organizer;
GRANT EXECUTE ON PROCEDURE EventSchedule TO Organizer;
GRANT EXECUTE ON PROCEDURE CancelEvent TO Organizer;

