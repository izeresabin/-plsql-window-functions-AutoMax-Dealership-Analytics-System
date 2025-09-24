-- =====================================================
-- AutoMax Dealership Analytics System
-- Complete SQL Implementation
-- Student: [IZERE Sabin Patience]
-- Course: Database Development with PL/SQL (INSY 8311)
-- Date: September 2025
-- =====================================================

-- =====================================================
-- SCRIPT 1: SCHEMA CREATION (01_schema_creation.sql)
-- ====================================================


-- Create LOCATIONS table
CREATE TABLE locations (
    location_id NUMBER PRIMARY KEY,
    location_name VARCHAR2(100) NOT NULL,
    manager VARCHAR2(100) NOT NULL,
    address VARCHAR2(200) NOT NULL,
    phone VARCHAR2(20),
    created_date DATE DEFAULT SYSDATE
);

--Create CUSTOMERS table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20) NOT NULL,
    email VARCHAR2(100),
    customer_type VARCHAR2(20) CHECK (customer_type IN ('Individual', 'Corporate')) NOT NULL,
    location VARCHAR2(50) NOT NULL,
    registration_date DATE DEFAULT SYSDATE
);

--create VEHICLES table
CREATE TABLE vehicles (
    vehicle_id NUMBER PRIMARY KEY,
    brand VARCHAR2(50) NOT NULL,
    model VARCHAR2(50) NOT NULL,
    year NUMBER(4) CHECK (year BETWEEN 2015 AND 2025) NOT NULL,
    price NUMBER(12,2) CHECK (price > 0) NOT NULL,
    category VARCHAR2(30) NOT NULL,
    color VARCHAR2(30),
    engine_size VARCHAR2(10),
    fuel_type VARCHAR2(20) DEFAULT 'Petrol',
    status VARCHAR2(20) DEFAULT 'Available' CHECK (status IN ('Available', 'Sold', 'Reserved'))
);

-- Create SALES table
CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL REFERENCES customers(customer_id),
    vehicle_id NUMBER NOT NULL REFERENCES vehicles(vehicle_id),
    location_id NUMBER NOT NULL REFERENCES locations(location_id),
    sale_date DATE NOT NULL,
    sale_amount NUMBER(12,2) CHECK (sale_amount > 0) NOT NULL,
    salesperson VARCHAR2(100) NOT NULL,
    commission_rate NUMBER(3,2) DEFAULT 0.05,
    payment_method VARCHAR2(20) DEFAULT 'Bank Transfer',
    created_date DATE DEFAULT SYSDATE
);

-- Create indexes for better performance
CREATE INDEX idx_sales_date ON sales(sale_date);
CREATE INDEX idx_sales_location ON sales(location_id);
CREATE INDEX idx_sales_customer ON sales(customer_id);
CREATE INDEX idx_sales_vehicle ON sales(vehicle_id);
CREATE INDEX idx_customers_type ON customers(customer_type);
CREATE INDEX idx_vehicles_brand ON vehicles(brand);

-- Add comments for documentation
COMMENT ON TABLE customers IS 'Customer information including individual and corporate clients';
COMMENT ON TABLE vehicles IS 'Vehicle inventory with specifications and pricing';
COMMENT ON TABLE locations IS 'AutoMax dealership branch locations';
COMMENT ON TABLE sales IS 'Sales transactions linking customers, vehicles, and locations';

--Insert into LOCATIONS
INSERT INTO locations (location_id, location_name, manager, address, phone)
VALUES (1, 'Kigali Branch', 'Alice Uwimana', 'KN 5 Rd, Kigali', '+250788111111');

INSERT INTO locations (location_id, location_name, manager, address, phone)
VALUES (2, 'Musanze Branch', 'John Niyonsenga', 'RN 2 Rd, Musanze', '+250788222222');

INSERT INTO locations (location_id, location_name, manager, address, phone)
VALUES (3, 'Huye Branch', 'Grace Ingabire', 'HU 17 Ave, Huye', '+250788333333');

-- Insert into CUSTOMERS
INSERT INTO customers (customer_id, name, phone, email, customer_type, location)
VALUES (101, 'Emmanuel Mugisha', '+250781111111', 'emmanuel@example.com', 'Individual', 'Kigali');

INSERT INTO customers (customer_id, name, phone, email, customer_type, location)
VALUES (102, 'RwandaTech Ltd', '+250782222222', 'contact@rwandatech.rw', 'Corporate', 'Kigali');

INSERT INTO customers (customer_id, name, phone, email, customer_type, location)
VALUES (103, 'Claudine Uwase', '+250783333333', 'claudine@example.com', 'Individual', 'Musanze');

INSERT INTO customers (customer_id, name, phone, email, customer_type, location)
VALUES (104, 'AgriCoop Ltd', '+250784444444', 'info@agricoop.rw', 'Corporate', 'Huye');

-- Insert into VEHICLES
INSERT INTO vehicles (vehicle_id, brand, model, year, price, category, color, engine_size, fuel_type, status)
VALUES (201, 'Toyota', 'Corolla', 2020, 15000, 'Sedan', 'White', '1.8L', 'Petrol', 'Available');

INSERT INTO vehicles (vehicle_id, brand, model, year, price, category, color, engine_size, fuel_type, status)
VALUES (202, 'Nissan', 'Navara', 2021, 28000, 'Pickup', 'Black', '2.5L', 'Diesel', 'Available');

INSERT INTO vehicles (vehicle_id, brand, model, year, price, category, color, engine_size, fuel_type, status)
VALUES (203, 'Suzuki', 'Swift', 2019, 12000, 'Hatchback', 'Red', '1.2L', 'Petrol', 'Available');

INSERT INTO vehicles (vehicle_id, brand, model, year, price, category, color, engine_size, fuel_type, status)
VALUES (204, 'Mitsubishi', 'Outlander', 2022, 35000, 'SUV', 'Blue', '2.0L', 'Petrol', 'Available');

INSERT INTO vehicles (vehicle_id, brand, model, year, price, category, color, engine_size, fuel_type, status)
VALUES (205, 'Toyota', 'Hilux', 2023, 40000, 'Pickup', 'Silver', '2.8L', 'Diesel', 'Available');

-- Insert into SALES
INSERT INTO sales (sale_id, customer_id, vehicle_id, location_id, sale_date, sale_amount, salesperson, payment_method)
VALUES (301, 101, 201, 1, DATE '2024-01-15', 15000, 'Patrick Nshimiyimana', 'Cash');

INSERT INTO sales (sale_id, customer_id, vehicle_id, location_id, sale_date, sale_amount, salesperson, payment_method)
VALUES (302, 102, 202, 1, DATE '2024-02-10', 28000, 'Alice Uwimana', 'Bank Transfer');

INSERT INTO sales (sale_id, customer_id, vehicle_id, location_id, sale_date, sale_amount, salesperson, payment_method)
VALUES (303, 103, 203, 2, DATE '2024-03-05', 12000, 'Eric Manzi', 'Credit Card');

INSERT INTO sales (sale_id, customer_id, vehicle_id, location_id, sale_date, sale_amount, salesperson, payment_method)
VALUES (304, 104, 204, 3, DATE '2024-03-25', 35000, 'Grace Ingabire', 'Bank Transfer');

INSERT INTO sales (sale_id, customer_id, vehicle_id, location_id, sale_date, sale_amount, salesperson, payment_method)
VALUES (305, 101, 205, 1, DATE '2024-04-15', 40000, 'Patrick Nshimiyimana', 'Cash');