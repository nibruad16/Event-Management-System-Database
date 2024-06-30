-- list of all upcomming events

SELECT * from Events where statuss = "Upcoming" 

--  for create an event 

DELIMITER //
CREATE PROCEDURE CreateEvents(

  IN p_event_name VARCHAR(255),
  IN p_descriptions TEXT,
  IN p_activity VARCHAR(255),
  IN p_user_id INT,
  IN p_status VARCHAR(20)
)
BEGIN

  DECLARE current_role VARCHAR(20);
 
 SELECT roles INTO current_role FROM Users WHERE user_id = p_user_id;

  IF current_role = 'Organizer' OR current_role = 'Admin' THEN
  
    INSERT INTO Events (event_name, descriptions, activity, user_id, statuss)
    VALUES (p_event_name, p_descriptions, p_activity, p_user_id, p_status);
  ELSE
  
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are not authorized to execute this procedure.';
  END IF;
END //
DELIMITER ;
CALL CreateEvents('Event Name', 'Event Description', 'Event Activity', 6, 'Event Status');


-- geting an event feedback to a specific event
DELIMITER //

CREATE PROCEDURE GetEventFeedback(
    IN p_event_id INT
)
BEGIN
    SELECT * FROM Event_Feedback WHERE event_id = p_event_id;
END//

CALL GetEventFeedback(28);

DELIMITER ;

-- canceling the event 

DELIMITER //

CREATE PROCEDURE CancelEvent(
    IN p_event_id INT,
    IN p_user_id INT
)
BEGIN
	DECLARE current_role VARCHAR(20);
 
	SELECT roles INTO current_role FROM Users WHERE user_id = p_user_id;

  IF current_role = 'Organizer' OR current_role = 'Admin' THEN 
    UPDATE Events SET statuss = 'Cancelled' WHERE event_id = p_event_id;
	 ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are not authorized to execute this procedure.';
    END IF;
END //

DELIMITER ;
call CancelEvent(33 , 6);
-- Submiting Feedback for an event

DELIMITER //

CREATE PROCEDURE SubmitEventFeedback(
  IN p_event_id INT,
  IN p_user_id INT,
  IN p_feedback TEXT,
  IN p_rating INT
)
BEGIN
  INSERT INTO Event_Feedback (event_id, user_id, feedback, rating)
  VALUES (p_event_id, p_user_id, p_feedback, p_rating);
END //  
DELIMITER ;
CALL SubmitEventFeedback(33 ,6 ,"The Event was Wonderfull" , 4);
-- Making a payment for booked event

DELIMITER //
CREATE PROCEDURE MakePayment(
  IN p_booking_id INT,
  IN p_payment_date DATETIME,
  IN p_amount DECIMAL(10, 2),
  IN p_payment_method VARCHAR(50),
  IN p_transactions VARCHAR(50) 
)
BEGIN
  INSERT INTO Payments (booking_id, payment_date, amount, payment_method , transactions)
  VALUES (p_booking_id, p_payment_date, p_amount, p_payment_method , p_transactions);
END //
DELIMITER ;
CALL MakePayment(7, '2022-01-15 10:30:00', 100.50, 'Banks', 'TXN12345');

-- making a booking for an event

DELIMITER //
CREATE PROCEDURE MakeBooking(
	IN p_event_id INT,
    IN p_user_id INT , 
    IN p_booking_date DATETIME 
)
BEGIN 
	INSERT INTO Bookings(event_id, user_id , booking_date)
    VALUE(p_event_id, p_user_id , p_booking_date);
END //
DELIMITER ;
CALL MakeBooking(30 , 6 ,'2022-02-19 14:30:00');

DELIMITER //
CREATE PROCEDURE EventSchedule (
	IN p_event_id INT,
    IN p_start_time DATETIME,
    IN p_end_time DATETIME,
    IN p_locations VARCHAR(255),
    IN p_user_id INT
)
BEGIN
	DECLARE current_role VARCHAR(20);
 
	SELECT roles INTO current_role FROM Users WHERE user_id = p_user_id;

  IF current_role = 'Organizer' OR current_role = 'Admin' THEN 
  
	INSERT INTO Event_Schedule(event_id , start_time , end_time , location)
    VALUE(p_event_id ,p_start_time ,p_end_time, p_locations );
    
    ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are not authorized to execute this procedure.';
    END IF;
END //
DELIMITER ;

CALL EventSchedule(33, '2024-02-21 09:00:00', '2024-02-21 17:00:00', 'Conference Room A', 6); 