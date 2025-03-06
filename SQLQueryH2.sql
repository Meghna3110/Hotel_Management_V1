create database HotelManagement_V1;
Go

use DROP DATABASE HotelManagement_V1;
Go

CREATE TABLE Customers(
	CustomerId INT PRIMARY KEY IDENTITY,
	FullName VARCHAR(255) NOT NULL,
	Email VARCHAR(255) UNIQUE NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	Address TEXT);
Go


CREATE TABLE Rooms(
	RoomId INT PRIMARY KEY IDENTITY,
	RoomNumber INT UNIQUE NOT NULL,
	RoomType VARCHAR(50) NOT NULL,
	PricePerNight DECIMAL(10,2) NOT NULL,
	AvailabilityStatus BIT NOT NULL);



CREATE TABLE Bookings(
	BookingId INT PRIMARY KEY IDENTITY,
	CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerId),
	RoomId INT FOREIGN KEY REFERENCES Rooms(RoomId),
	CheckInDate DATE NOT NULL,
	CheckOutDate DATE NOT NULL,
	BookingStatus VARCHAR(50) NOT NULL);


	CREATE TABLE Payments(
		PaymentId INT PRIMARY KEY IDENTITY,
		BookingId INT FOREIGN KEY REFERENCES Bookings(BookingId),
		AmountPaid DECIMAL(10,2) NOT NULL,
		PaymentDate DATE NOT NULL,
		PaymentMethod VARCHAR(50) NOT NULL);


CREATE TABLE Employees(
	EmployeeId INT PRIMARY KEY IDENTITY,
	FullName VARCHAR(255) NOT NULL,
	Role VARCHAR(100) NOT NULL,
	Salary DECIMAL(10,2) NOT NULL);

CREATE TABLE Services(
	ServiceId INT PRIMARY KEY IDENTITY,
	ServiceName VARCHAR(100) NOT NULL,
	ServiceCost DECIMAL(10,2) NOT NULL,);

CREATE TABLE ServiceUsage(
	UsageId INT PRIMARY KEY IDENTITY,
	CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerId),
	ServiceId INT FOREIGN KEY REFERENCES Services(ServiceId),
	UsageDate DATE NOT NULL);


CREATE TABLE Feedbacks(
	FeedbackId INT PRIMARY KEY IDENTITY,
	CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerId),
	FeedbackText TEXT NOT NULL,
	FeedbackDate DATETIME DEFAULT GETDATE(),
	Rating INT CHECK (Rating BETWEEN 1 AND 5),
	IsDeleted INT);



INSERT INTO Customers (FullName, Email, PhoneNumber, Address)
VALUES 
('Alice Johnson', 'alice@email.com', '9876543210', 'New York'),
('Bob Smith', 'bob@email.com', '8765432109', 'California'),
('David wilson', 'david@email.com', '9749862130', 'Chicago'),
('Emily Davis', 'emily@email.com', '8745963108', 'Paris'),
('Charlie Brown', 'Charlie@email.com', '7894565213', 'Gerogia');


Select *
From Customers;

INSERT INTO Rooms(RoomNumber, RoomType, PricePerNight, AvailabilityStatus) 
VALUES
('101', 'Single', '900', 1),
('102', 'Double', '1300', 1),
('103', 'Suite', '1600', 1),
('104', 'Delux', '1800', 1),
('105', 'Penthouse', '2600', 1); 



Select *
From Rooms;

INSERT INTO Bookings (CustomerId, RoomId, CheckInDate, CheckOutDate, BookingStatus)
VALUES
(1, 1, '2025-03-01', '2025-03-05', 'Confirmed'),
(2, 2, '2025-03-02', '2025-03-06', 'Confirmed'),
(3, 3, '2025-03-03', '2025-03-07', 'Pending'),
(4, 4, '2025-03-04', '2025-03-08', 'Cancelled'),
(5, 5, '2025-03-05', '2025-03-09', 'Confirmed');


Select *
From Bookings;



INSERT INTO Payments (BookingId, AmountPaid, PaymentDate, PaymentMethod)
VALUES
(1, 200.00, '2025-03-01', 'Credit Card'),
(2, 320.00, '2025-03-02', 'Debit Card'),
(3, 450.00, '2025-03-03', 'PayPal'),
(4, 800.00, '2025-03-04', 'Cash'),
(5, 1200.00, '2025-03-05', 'Credit Card');

Select *
From Payments;



INSERT INTO Employees (FullName, Role, Salary)
VALUES
('John Carter', 'Manager', 5000.00),
('Sarah Lee', 'Receptionist', 2500.00),
('Michael Johnson', 'Housekeeping', 2000.00),
('Lisa White', 'Chef', 3500.00),
('Robert Green', 'Security', 2200.00);



Select *
From Employees;


INSERT INTO Services (ServiceName, ServiceCost)
VALUES
('Laundry', 500.00),
('Spa', 1500.00),
('Gym', 800.00),
('Airport Pickup', 1000.00),
('Room Service', 400.00);


Select * 
From Services;

INSERT INTO ServiceUsage (CustomerId, ServiceId, UsageDate)
VALUES
(1, 1, '2025-03-01'),
(2, 2, '2025-03-02'),
(3, 3, '2025-03-03'),
(4, 4, '2025-03-04'),
(5, 5, '2025-03-05');


Select *
From ServiceUsage;

INSERT INTO Feedbacks (CustomerId, FeedbackText, FeedbackDate, Rating, IsDeleted)
VALUES
(1, 'Great stay, very comfortable!', '2025-03-06 10:30:00', 5, 0),
(2, 'Room was clean but service was slow.', '2025-03-07 12:45:00', 3, 0),
(3, 'Enjoyed the gym and spa facilities.', '2025-03-08 15:20:00', 4, 0),
(4, 'Had issues with WiFi, but overall good.', '2025-03-09 18:10:00', 4, 0),
(5, 'Staff was very friendly and helpful!', '2025-03-10 20:50:00', 5, 0);



Select *
From Feedbacks;




SELECT * FROM Customers;
SELECT * FROM Rooms;
SELECT * FROM Bookings;

SELECT * FROM Payments;
SELECT * FROM Employees;
SELECT * FROM Services;
SELECT * FROM ServiceUsage;
SELECT * FROM Feedbacks;
