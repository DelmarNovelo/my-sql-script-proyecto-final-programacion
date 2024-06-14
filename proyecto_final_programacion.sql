CREATE DATABASE proyecto_final_programacion;

use proyecto_final_programacion;

CREATE TABLE airport (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(15) NOT NULL,
    country VARCHAR(15) NOT NULL,
    iata_code VARCHAR(5) NOT NULL UNIQUE
);

INSERT INTO airport (name, iata_code, city, country) VALUES
('Los Angeles International Airport', 'LAX', 'Los Angeles', 'USA'),
('John F. Kennedy International Airport', 'JFK', 'New York', 'USA'),
('Heathrow Airport', 'LHR', 'London', 'UK'),
('Tokyo Haneda Airport', 'HND', 'Tokyo', 'Japan'),
('Charles de Gaulle Airport', 'CDG', 'Paris', 'France'),
('Dubai International Airport', 'DXB', 'Dubai', 'UAE'),
('Sydney Kingsford Smith Airport', 'SYD', 'Sydney', 'Australia'),
('Beijing Capital International Airport', 'PEK', 'Beijing', 'China');

SELECT * FROM airport;

CREATE TABLE airplane (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(25) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0)
);

INSERT INTO airplane (model, capacity) VALUES 
('Boeing 737-800', 189),
('Airbus A320-200', 180),
('Boeing 777-300', 396),
('Airbus A380-800', 853),
('Embraer E190', 100);

SELECT * FROM airplane;

CREATE TABLE airline (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL UNIQUE,
    iata_code VARCHAR(5) NOT NULL UNIQUE
);

INSERT INTO airline (iata_code, name) VALUES
('AA', 'American Airlines'),
('DL', 'Delta Air Lines'),
('UA', 'United Airlines'),
('BA', 'British Airways'),
('AF', 'Air France'),
('LH', 'Lufthansa'),
('EK', 'Emirates'),
('QF', 'Qantas');

SELECT * FROM airline;

CREATE TABLE passenger (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL,
    address VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    passport_number VARCHAR(20) NOT NULL UNIQUE
);

SELECT * FROM passenger;

CREATE TABLE flight (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(20) NOT NULL UNIQUE,
    date DATE NOT NULL,
    departure_time TIME NOT NULL,
    boarding_time TIME NOT NULL,
    arrival_time TIME NOT NULL,
    airline_id INT NOT NULL,
    airplane_id INT NOT NULL,
    origin_id INT NOT NULL,
    destination_id INT NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES airline(id),
    FOREIGN KEY (airplane_id) REFERENCES airplane(id),
    FOREIGN KEY (origin_id) REFERENCES airport(id),
    FOREIGN KEY (destination_id) REFERENCES airport(id)
);

SELECT * FROM flight;
    
CREATE TABLE reservation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT NOT NULL,
    flight_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    reservation_date DATE NOT NULL,
    booking_reference VARCHAR(20) NOT NULL UNIQUE,
    ticket_number VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (passenger_id) REFERENCES passenger(id),
    FOREIGN KEY (flight_id) REFERENCES flight(id)
);

SELECT * FROM reservation;

CREATE TABLE boarding_pass (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    issue_date DATE NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);


