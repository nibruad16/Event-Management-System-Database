create database E_Managements;
use E_Managements;

-- Create the Events table

CREATE TABLE Events (
event_id INT AUTO_INCREMENT PRIMARY KEY,
event_name VARCHAR(255) NOT NULL,
descriptions TEXT,
activity VARCHAR(255),
user_id INT NOT NULL,
statuss VARCHAR(20) NOT NULL

);
ALTER TABLE Events ADD CONSTRAINT adding_foreign FOREIGN KEY(user_id) REFERENCES Users(user_id); 

-- Create the Users table

CREATE TABLE Users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50) NOT NULL,
password VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
full_name VARCHAR(255) NOT NULL,
roles VARCHAR(20) NOT NULL
);

-- Create the Attendees table

CREATE TABLE Attendees (
attendee_id INT AUTO_INCREMENT PRIMARY KEY,
event_id INT NOT NULL,
user_id INT NOT NULL

);
ALTER TABLE Attendees ADD CONSTRAINT adding_foreignA FOREIGN KEY(event_id) REFERENCES Events(event_id);
ALTER TABLE Attendees ADD CONSTRAINT adding_foreignA1 FOREIGN KEY(user_id) REFERENCES Users(user_id);

-- Create the Event_Schedule table

CREATE TABLE Event_Schedule (
schedule_id INT AUTO_INCREMENT PRIMARY KEY,
event_id INT NOT NULL,
start_time DATETIME NOT NULL,
end_time DATETIME NOT NULL,
location VARCHAR(255)

);
ALTER TABLE Event_Schedule ADD CONSTRAINT adding_foreignA2 FOREIGN KEY (event_id) REFERENCES Events(event_id);

-- Create the Bookings table

CREATE TABLE Bookings (
booking_id INT AUTO_INCREMENT PRIMARY KEY,
event_id INT NOT NULL,
user_id INT NOT NULL,
booking_date DATETIME NOT NULL
);
ALTER TABLE Bookings ADD CONSTRAINT adding_foreignB FOREIGN KEY (event_id) REFERENCES Events(event_id);
ALTER TABLE Bookings ADD CONSTRAINT adding_foreignB1 FOREIGN KEY (user_id) REFERENCES Users(user_id);

-- Create the Payments table

CREATE TABLE Payments (
payment_id INT AUTO_INCREMENT PRIMARY KEY,
booking_id INT NOT NULL,
payment_date DATETIME NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
payment_method VARCHAR(50) NOT NULL,
transactions VARCHAR(255) 
);
ALTER TABLE Payments ADD CONSTRAINT adding_foreignP FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id);

-- Create the Event_Feedback table

CREATE TABLE Event_Feedback (
feedback_id INT AUTO_INCREMENT PRIMARY KEY,
event_id INT NOT NULL,
user_id INT NOT NULL,
feedback TEXT,
rating INT NOT NULL
);
ALTER TABLE Event_Feedback ADD CONSTRAINT adding_foreignEF2 FOREIGN KEY (event_id) REFERENCES Events(event_id);
ALTER TABLE Event_Feedback ADD CONSTRAINT adding_foreignEF1 FOREIGN KEY (user_id) REFERENCES Users(user_id);
