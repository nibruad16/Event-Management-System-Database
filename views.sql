
-- View to Get Event Attendees:

CREATE VIEW EventAttendees AS
SELECT  e.event_name, u.username
FROM Attendees a
JOIN Events e ON a.event_id = e.event_id
JOIN Users u ON a.user_id = u.user_id
WHERE u.roles = 'user';

select * from EventAttendees;

-- View to Get Payment Details of the users:

CREATE VIEW PaymentDetails AS
SELECT b.booking_id, e.event_name, u.username, p.payment_date, p.amount, p.payment_method, p.transactions
FROM Payments p
JOIN Bookings b ON p.booking_id = b.booking_id
JOIN Events e ON b.event_id = e.event_id
JOIN Users u ON b.user_id = u.user_id
Where u.roles = 'user';

select * from PaymentDetails;

-- View to Get Upcoming Events:

CREATE VIEW UpcomingEvents AS
SELECT  e.event_name, e.descriptions, e.activity , s.start_time , s.end_time , s.location
FROM Events e
JOIN Users u ON e.user_id = u.user_id
JOIN Event_Schedule s ON e.event_id = s.event_id
WHERE e.statuss = 'Upcoming';

select * from UpcomingEvents;