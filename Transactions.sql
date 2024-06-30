-- Transaction: Create Event and Schedule

START TRANSACTION;

INSERT INTO Events (event_name, descriptions, activity, user_id, statuss)
VALUES ('Event Name', 'Event Description', 'Event Activity', 6, 'Event Status');

SET @event_id = LAST_INSERT_ID();

INSERT INTO Event_Schedule (event_id, start_time, end_time, location)
VALUES (@event_id, '2024-02-21 09:00:00', '2024-02-21 17:00:00', 'Conference Room A');

COMMIT;

-- Transaction: Book Event and Make Payment

START TRANSACTION;

INSERT INTO Bookings (event_id, user_id, booking_date)
VALUES (30, 6, '2022-02-19 14:30:00');

SET @booking_id = LAST_INSERT_ID();

INSERT INTO Payments (booking_id, payment_date, amount, payment_method, transactions)
VALUES (@booking_id, '2022-01-15 10:30:00', 100.50, 'Banks', 'TXN12345');

COMMIT;