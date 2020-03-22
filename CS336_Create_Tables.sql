USE TrainWebApp1;

CREATE TABLE Employee
	(username VARCHAR(45),
    password VARCHAR(45),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
	ssn VARCHAR(9) PRIMARY KEY,
    access_level ENUM('employee', 'admin', 'customer rep'));

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
    
CREATE TABLE Origin
    (departure_time TIME,
     station_id VARCHAR(10) REFERENCES Station,
     starting_time time REFERENCES Train_Schedule,
     line_name VARCHAR(25) REFERENCES Line,
     train_id VARCHAR(10) REFERENCES Trains,
     primary key (station_id, starting_time, line_name, train_id));
     
CREATE TABLE Destination
    (arrival_time TIME,
     station_id VARCHAR(10) REFERENCES Station,
     starting_time TIME REFERENCES Train_Schedule,
     line_name VARCHAR(25) REFERENCES Line,
     train_id VARCHAR(10) REFERENCES Trains,
     primary key (station_id, starting_time, line_name, train_id));
     
CREATE TABLE Train_Schedule
    (schedule_date DATE,
     travel_time TIME,
     starting_time TIME,
     line_name VARCHAR(25) REFERENCES Line,
     train_id VARCHAR(10) REFERENCES Trains,
     primary key (starting_time, line_name, train_id));
     
CREATE TABLE Is_Based_On
    (schedule_date DATE REFERENCES Train_Schedule,
    reservation_num int REFERENCES Reservation,
     starting_time time REFERENCES Train_Schedule,
     line_name VARCHAR(25) REFERENCES Line,
     train_id VARCHAR(10) REFERENCES Trains,
     primary key (schedule_date, reservation_num, starting_time, line_name, train_id));
     
CREATE TABLE Stops_At
     (line_name VARCHAR(25) REFERENCES Line,
      station_id int REFERENCES Station,
      primary key (station_id, line_name));
	
CREATE TABLE Access_Train_Schedule
	(ssn VARCHAR(9) REFERENCES Employee,
    schedule_date DATE REFERENCES Train_Schedule,
    starting_time TIME REFERENCES Train_Schedule,
    train_id VARCHAR(10) REFERENCES Trains,
    PRIMARY KEY(ssn, schedule_date, starting_time, train_id));

CREATE TABLE Access_Reservation
	(reservation_num INT REFERENCES Reservation,
    ssn VARCHAR(9) REFERENCES Employee,
    PRIMARY KEY(reservation_num, ssn));
    


