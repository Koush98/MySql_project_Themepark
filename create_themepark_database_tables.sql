/* Create Database Called Themepark*/
create database themepark;

-- use themepark database
use themepark;
-- SQL script to create tables for the "themepark" database --

-- Create table for theme parks
CREATE TABLE themepark (
    park_code VARCHAR(10) PRIMARY KEY,
    park_name VARCHAR(100) NOT NULL,
    park_city VARCHAR(50),
    park_country VARCHAR(50)
);

-- Create table for tickets
CREATE TABLE ticket (
    ticket_no INT PRIMARY KEY,
    ticket_price DECIMAL(10, 2),
    ticket_type VARCHAR(50),
    park_code VARCHAR(10),
    FOREIGN KEY (park_code) REFERENCES themepark(park_code)
);

-- Create table for attractions
CREATE TABLE attraction (
    attract_no INT PRIMARY KEY,
    attract_name VARCHAR(100),
    attract_age INT,
    attract_capacity INT,
    park_code VARCHAR(10),
    FOREIGN KEY (park_code) REFERENCES themepark(park_code)
);

-- Create table for employees
CREATE TABLE employee (
    emp_num INT PRIMARY KEY,
    emp_title VARCHAR(50),
    emp_lname VARCHAR(100),
    emp_fname VARCHAR(100),
    emp_dob DATE,
    emp_hire_date DATE,
    emp_area_code VARCHAR(10),
    emp_phone VARCHAR(15),
    park_code VARCHAR(10),
    FOREIGN KEY (park_code) REFERENCES themepark(park_code)
);

-- Create table for hours worked
CREATE TABLE hours (
    emp_num INT,
    attract_no INT,
    hours_per_attract DECIMAL(5, 2),
    hour_rate DECIMAL(8, 2),
    date_worked DATE,
    PRIMARY KEY (emp_num, attract_no, date_worked),
    FOREIGN KEY (emp_num) REFERENCES employee(emp_num),
    FOREIGN KEY (attract_no) REFERENCES attraction(attract_no)
);

-- Create table for sales transactions
CREATE TABLE sales (
    transaction_no INT PRIMARY KEY,
    park_code VARCHAR(10),
    sale_date DATE,
    FOREIGN KEY (park_code) REFERENCES themepark(park_code)
);

-- Create table for sales line items
CREATE TABLE sales_line (
    transaction_no INT,
    line_no INT,
    ticket_no INT,
    line_qty INT,
    line_price DECIMAL(10, 2),
    PRIMARY KEY (transaction_no, line_no),
    FOREIGN KEY (transaction_no) REFERENCES sales(transaction_no),
    FOREIGN KEY (ticket_no) REFERENCES ticket(ticket_no)
);

