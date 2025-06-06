DROP DATABASE IF EXISTS car_dealership;

CREATE DATABASE IF NOT EXISTS car_dealership;

USE car_dealership;


-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS lease_contracts;
DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS dealerships;


-- Create the dealerships table
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

-- Create the vehicles table
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    SOLD BOOLEAN,
    color VARCHAR(50),
    vehicleType VARCHAR(50),
    odometer INT,
    price DOUBLE
);
-- Create the inventory table
CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Create the sales_contracts table
CREATE TABLE sales_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    sale_date DATE,
    price DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Create the lease_contracts table
CREATE TABLE lease_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    lease_start DATE,
    lease_end DATE,
    monthly_payment DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Insert sample dealerships
INSERT INTO dealerships (name, address, phone) VALUES
('Auto World', '123 Main St', '555-123-4567'),
('DriveNow Motors', '456 Elm St', '555-987-6543');

-- Insert sample vehicles
INSERT INTO vehicles (VIN, make, model, year, SOLD, color, vehicleType, odometer, price) VALUES
('1HGCM82633A004352', 'Honda', 'Accord', 2020, FALSE, 'Red', 'Sedan', 30000, 18000.00),
('2T1BURHE5JC123456', 'Toyota', 'Corolla', 2019, TRUE, 'Blue', 'Sedan', 25000, 15000.00),
('3N1AB7AP5KY123789', 'Nissan', 'Sentra', 2021, FALSE, 'Black', 'Sedan', 15000, 17000.00);

-- Insert into inventory
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A004352'),
(1, '2T1BURHE5JC123456'),
(2, '3N1AB7AP5KY123789');

-- Insert into sales_contracts
INSERT INTO sales_contracts (VIN, sale_date, price) VALUES
('2T1BURHE5JC123456', '2025-05-01', 14500.00);

-- Insert into lease_contracts
INSERT INTO lease_contracts (VIN, lease_start, lease_end, monthly_payment) VALUES
('3N1AB7AP5KY123789', '2025-06-01', '2026-06-01', 320.00);
