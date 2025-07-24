-- ==================================
-- Airline Reservation System Project
-- SQL Code with Documentation
-- ==================================

-- 1. Create Database
CREATE DATABASE Airline_Reservation_System;
USE Airline_Reservation_System;


-- 1. Create Table Passengers
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR (20),
    Email VARCHAR (20),
    MobileNo CHAR (15),
    Gender VARCHAR (15),
    PassportNumber VARCHAR (15)
);
-- Insert Data table-1 (Passengers)
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('Ramesh Gupta', 'ramesh@gmail.com', '9891565695', 'Male', 'P1234567');
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('Sneha Sharma', 'sneha@gmail.com', '7861565695', 'Female', 'P2345678');
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('David Johnson', 'david@gmail.com', '8891565695', 'Male', 'P3456789');
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('Aarti Verma', 'arti@gmail.com', '9891565768', 'Female', NULL);
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('Vikram Singh', 'vikram@gmail.com', '9991565695', NULL, 'P5678901');
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('Nina Patel', 'Nina@gmail.com', NULL, 'Male', 'P1234587');
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('John Doe', NULL, '9891777695', 'Male', 'P7890123');
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('Meera Kapoor', 'meera@gmail.com', '7651565695', 'Female', 'P8901234');
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('Anil mehta', 'anil@gmail.com', '7691565695', 'Male', 'P9012345');
INSERT INTO Passengers (Name, Email, MobileNo, Gender, PassportNumber) VALUES ('Pooja Saini', 'pooja@gmail.com', NULL, 'Female', 'P1234567');

-- ALTER TABLE Passengers AUTO_INCREMENT = 1;

SELECT * FROM Passengers;


-- 2. Create Table Flights
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    Airline VARCHAR (20),
    FlightNumber VARCHAR (20),
    Source VARCHAR (50),
    Destination VARCHAR (20),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    TotalSeats INT
);

-- Insert Data Table-2 (Flights) Write a column list or pass null for auto_increment columns,
-- So that's why I have given it null value.

INSERT INTO Flights Values (NULL, 'Air India', 'AI101', 'Delhi', 'Mumbai', '2025-07-10 10:00', '2025-07-10 12:00', 150);
INSERT INTO Flights Values (NULL, 'IndiGo', '6E202', 'Mumbai', 'Banglore', '2025-07-11 15:00', '2025-07-11 17:00', 180);
INSERT INTO Flights Values (NULL, 'SpiceJet', 'SG303', 'Delhi', 'Hyderabad', '2025-07-12 08:00', '2025-07-12 10:30', 200);
INSERT INTO Flights Values (NULL, 'Vistara', 'UK404', 'Chennai', 'Delhi', '2025-07-13 06:00', '2025-07-13 09:00', 170);
INSERT INTO Flights Values (NULL, 'GoAir', 'G805', 'Hyderabad', 'Mumbai', '2025-07-14 09:00', '2025-07-14 11:00', 160);
INSERT INTO Flights Values (NULL, 'AirAsia', 'I566', 'Bangalore', 'Delhi', '2025-07-15 12:00', '2025-07-15 14:30', NULL);
INSERT INTO Flights Values (NULL, 'Alliance Air', 'AA606', 'Kalcutta', 'Lucknow', '2025-07-16 02:00', '2025-07-16 04:30', 190);
INSERT INTO Flights Values (NULL, 'Air India Express', 'AE707', 'Goa', 'Dehradoon', '2025-07-17 14:00', '2025-07-17 16:30', 120);
INSERT INTO Flights Values (NULL, 'Qatar Airways', 'QA201', 'Jammu', 'Dharamshala', '2025-07-10 16:00', '2025-07-10 18:00', NULL);
INSERT INTO Flights Values (NULL, 'Akasa Air', 'AI901', 'Delhi', 'Mumbai', '2025-07-10 10:00', '2025-07-10 12:00', 150);

SELECT * FROM Flights;


-- 3. Create Table Bookings
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    FlightID INT,
    Status ENUM ('Confirmed' , 'Cancelled') DEFAULT 'Confirmed',
    FOREIGN KEY (PassengerID) REFERENCES Passengers (PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights (FlightID)
);
ALTER TABLE Bookings ADD COLUMN BookingDate DATE AFTER Status;  -- Drop BookingDate Column
ALTER TABLE Bookings DROP COLUMN BookingDate;
ALTER TABLE Bookings ADD COLUMN BookingDate DATE AFTER FlightID;  -- Add new column 
ALTER TABLE Bookings ADD COLUMN SeatID INT PRIMARY KEY AUTO_INCREMENT; -- DELETE This column
ALTER TABLE Bookings DROP COLUMN SeatID;
ALTER TABLE Bookings ADD FOREIGN KEY (SeatID) REFERENCES Seats (SeatID);
-- ALTER TABLE Bookings ADD FOREIGN KEY (SeatID) REFERENCES Seats (SeatID);
-- Only run this if SeatID is not yet present
ALTER TABLE Bookings ADD COLUMN SeatID INT;

-- Then add foreign key constraint
ALTER TABLE Bookings
ADD CONSTRAINT fk_SeatID FOREIGN KEY (SeatID) REFERENCES Seats(SeatID);

SELECT BookingID, PassengerID, FlightID, BookingDate, Status, SeatID FROM Bookings WHERE SeatID IS NOT NULL;
SELECT * FROM Bookings;



-- Insert Data Table-3 (Booking)
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (13, 1, '2025-07-01', 'Confirmed');
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (14, 2, '2025-07-02', 'Confirmed');
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (15, 3, '2025-07-03', 'Cancelled');
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (16, 4, '2025-07-04', 'Confirmed');
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (17, 5, '2025-07-05', 'Confirmed');
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (18, 6, '2025-07-06', 'Cancelled');
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (19, 7, '2025-07-07', 'Confirmed');
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (20, 8, '2025-07-08', 'Confirmed');
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (21, 9, '2025-07-09', 'Cancelled');
INSERT INTO Bookings (PassengerID, FlightID, BookingDate,  Status) VALUES  (22, 10, '2025-07-10', 'Confirmed');


SELECT * FROM Bookings;

-- 4. Create Table Seats
CREATE TABLE Seats (
    SeatID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    SeatNumber VARCHAR (20),
    Booked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (FlightID) REFERENCES Flights (FlightID)
);
-- ALTER TABLE Seats MODIFY COLUMN Booked VARCHAR (20);  -- this is Change from Varchar to Boolean data type
-- ALTER TABLE Seats MODIFY COLUMN Booked BOOLEAN;
ALTER TABLE Seats MODIFY COLUMN Booked VARCHAR (20);

--  If your column has mixed values like = True, False, 0, 1, so use this command
UPDATE Seats SET Booked = TRUE WHERE Booked IN ('TRUE', '1');
UPDATE Seats SET Booked = FALSE WHERE Booked IN ('FALSE', '0');

-- Insert Data Table-4 (Seats)

INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (1, '12A', TRUE);   -- Modify column
INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (2, '15C', TRUE);
INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (3, '18B', FALSE);
INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (4, '10D', TRUE);
INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (5, '20E', TRUE);
INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (6, '16G', 1);
INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (7, '11H', 0);
INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (8, '13I', TRUE);
INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (9, '17J', 0);
INSERT INTO Seats (Flightid, SeatNumber, Booked)  VALUES  (10, '14F', TRUE);

DELETE FROM Seats WHERE SeatID = 11;  -- Delete command 

SELECT * FROM Seats;

-- Available Seats on a Flight

SELECT SeatNumber FROM Seats WHERE FlightID = 1 AND Booked = FALSE;

SELECT * FROM Seats;


--  Available Seats more on a Flight
SELECT SeatNumber  FROM Seats WHERE FlightID = 7 AND Booked = FALSE LIMIT 5;

-- Count available seats
SELECT COUNT(*) AS AvailableSeats  FROM Seats  WHERE FlightID = 1 AND Booked = FALSE;


    -- Search flight by Source and Destination:

SELECT * FROM Flights WHERE Source = 'Delhi' AND Destination = 'Mumbai';
SELECT * FROM Flights WHERE Source = 'Goa' AND Destination = 'Dehradoon';

-- Book a Seats (Update Booking & Mark Seats)
UPDATE Seats SET Booked = TRUE WHERE SeatID IN (3, 5, 8);

UPDATE seats SET Booked = FALSE WHERE SeatID IN (3, 5, 8);     -- Use this statement for Cancel Booking Seats Queries

SELECT SeatID, SeatNumber, Booked  FROM Seats WHERE SeatID IN (3, 5, 8);         -- use this command for Retrieve the data which is update for booking


-- Triggers
-- Trigger on new booking to Auto-Update Seat as Booked with Delimetrs

DELIMITER //

CREATE TRIGGER After_Booking_Insert AFTER INSERT ON Bookings FOR EACH ROW 
BEGIN
    UPDATE Seats
    SET Booked = TRUE
    WHERE SeatID = New.SeatID;
END;
//
DELIMITER ;

SHOW TRIGGERS LIKE 'Bookings';   -- Use for retrieve both queries
SHOW CREATE TRIGGER After_Booking_Insert;

-- Trigger on Booking Cancellation with Delimiter
DELIMITER //

CREATE TRIGGER after_booking_cancel
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
    IF NEW.Status = 'CANCELLED' THEN
        UPDATE Seats
        SET Booked = FALSE
        WHERE SeatID = NEW.SeatID;
    END IF;
END;
//
DELIMITER ;


-- Booking Summary Report
SELECT
    B.BookingID,
    P.Name AS PassengerName,
    F.FlightNumber,
    F.Source,
    F.Destination,
    S.SeatNumber,
    B.BookingDate,
    B.Status
FROM Bookings B
JOIN Passengers P ON B.PassengerID = P.PassengerID
JOIN Flights F ON B.FlightID = F.FlightID
JOIN Seats S ON B.SeatID = S.SeatID;

-- Flight Availability View
CREATE VIEW AvailableFlights AS
SELECT 
    F.FlightID,
    F.FlightNumber,
    F.Source,
    F.Destination,
    COUNT(S.SeatID) AS AvailableSeats
FROM Flights F
JOIN Seats S ON F.FlightID = S.FlightID
WHERE S.Booked = FALSE
GROUP BY F.FlightID, F.FlightNumber, F.Source, F.Destination;

SELECT * FROM AvailableFlights;  -- To view only

  -- -- End of Airline Reservation System Project