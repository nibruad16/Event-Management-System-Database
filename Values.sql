
--  sample data for the Events table
INSERT INTO Events (event_name, descriptions, activity, user_id, statuss)
VALUES
    ('Music Concert', 'An evening of live music performances', 'Music', 6, 'Active'),
    ('Art Exhibition', 'Showcasing contemporary art pieces', 'Art', 7, 'Active'),
    ('Workshop: Cooking Basics', 'Learn essential cooking techniques', 'Cooking', 8, 'Active'),
    ('Fitness Bootcamp', 'Intensive workout sessions for all fitness levels', 'Fitness', 9, 'Active'),
    ('Tech Conference', 'Discover the latest trends in technology', 'Technology', 10, 'Active');

-- sample data for the Users table
INSERT INTO Users (username, password, email, full_name, roles)
VALUES
    ('john_doe', 'password123', 'john.doe@example.com', 'John Doe', 'organizer'),
    ('jane_smith', 'password456', 'jane.smith@example.com', 'Jane Smith', 'user'),
    ('admin', 'admin123', 'admin@example.com', 'Admin User', 'admin'),
    ('mary_jones', 'password789', 'mary.jones@example.com', 'Mary Jones', 'user'),
    ('sam_wilson', 'passwordabc', 'sam.wilson@example.com', 'Sam Wilson', 'user');
    
--  sample data for the Attendees table
INSERT INTO Attendees (event_id, user_id)
VALUES
    (26, 6),
    (27, 7),
    (28, 8),
    (29, 9),
    (30, 10);
    
-- sample data for the Event_Schedule table
INSERT INTO Event_Schedule (event_id, start_time, end_time, location)
VALUES
    (26, '2024-02-20 18:00:00', '2024-02-20 22:00:00', 'Concert Hall'),
    (27, '2024-02-21 10:00:00', '2024-02-21 18:00:00', 'Art Gallery'),
    (28, '2024-02-22 15:00:00', '2024-02-22 17:00:00', 'Kitchen Studio'),
    (29, '2024-02-23 09:00:00', '2024-02-23 12:00:00', 'Fitness Center'),
    (30, '2024-02-24 08:00:00', '2024-02-24 17:00:00', 'Conference Center');
    
-- sample data for the Bookings table
INSERT INTO Bookings (event_id, user_id, booking_date)
VALUES
    (26, 6, '2024-02-19 10:00:00'),
    (27, 7, '2024-02-19 11:30:00'),
    (28, 8, '2024-02-19 15:45:00'),
    (29, 9, '2024-02-19 09:00:00'),
    (30, 10, '2024-02-19 16:30:00');
    
-- sample data for the Payments table
INSERT INTO Payments (booking_id, payment_date, amount, payment_method, transactions)
VALUES
    (6, '2024-02-19 10:30:00', 50.00, 'Credit Card', 'Transaction ID: ABC123'),
    (7, '2024-02-19 12:00:00', 25.00, 'PayPal', 'Transaction ID: XYZ789'),
    (8, '2024-02-19 16:00:00', 15.00, 'Credit Card', 'Transaction ID: DEF456'),
    (9, '2024-02-19 09:30:00', 40.00, 'PayPal', 'Transaction ID: GHI789'),
    (10, '2024-02-19 17:00:00', 30.00, 'Credit Card', 'Transaction ID: JKL012');
    
-- Generate sample data for the Event_Feedback table
INSERT INTO Event_Feedback (event_id, user_id, feedback, rating)
VALUES
    (26, 6, 'Great concert!', 4),
    (27, 7, 'Amazing art exhibition!', 5),
    (28, 8, 'Learned a lot in the cooking workshop.', 4),
    (29, 9, 'Intense and effective bootcamp!', 4),
    (30, 10, 'Informative tech conference!', 3);