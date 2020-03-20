USE TrainWebApp1;

CREATE TABLE Employee
	(username VARCHAR(45),
    password VARCHAR(45),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
	ssn VARCHAR(9) PRIMARY KEY,
    access_Level ENUM('employee', 'admin', 'customer rep'));

CREATE TABLE Station
	(station_id VARCHAR(10) PRIMARY KEY,
    station_name VARCHAR(30),
    state VARCHAR(25),
    city VARCHAR(25));

CREATE TABLE Line
	(line_name VARCHAR(25) PRIMARY KEY);

CREATE TABLE Trains
	(train_id VARCHAR(10) PRIMARY KEY,
    number_of_cars INT,
    number_of_seats int);

CREATE TABLE Reservation
    (reservation_num INT PRIMARY KEY,
    one_way_or_round_trip ENUM('one way', 'round way'), 
    reservation_date DATE,
	customer_rep VARCHAR(50),
    username VARCHAR(45) REFERENCES Customer);

CREATE TABLE Fare
	(discount INT,
    class VARCHAR(50),
    booking_fee INT,
    route_fare INT,
    weekly_or_monthly_fare INT,
    reservation_num INT PRIMARY KEY REFERENCES Reservation);
    
    