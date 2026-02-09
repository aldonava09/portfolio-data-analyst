-- =====================================================
-- 01_create_tables.sql
-- Project: Product Revenue Drivers Analysis
-- Description: Database schema definition
-- =====================================================

-- Categories

CREATE TABLE categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR
);

-- Countries

CREATE TABLE countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(45),
    CountryCode VARCHAR(2)
);

-- Cities

CREATE TABLE cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(45),
    Zipcode DECIMAL(5,0),
    ContryID INT
);

-- Customers

CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    MiddleInitial VARCHAR(1),
    LastName VARCHAR(45),
    CityID INT,
    Adress VARCHAR(90)
);

-- Employees

CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    MiddleInitial VARCHAR(1),
    LastName VARCHAR(45),
    BirthDate DATE,
    Gender VARCHAR(10),
    CityId INT,
    HireDate DATE
);

-- Products

CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(45),
    Price DECIMAL(4,0),
    CategoryID INT,
    Class VARCHAR(15),
    ModifyDate DATE,
    Resistant VARCHAR(15),
    IsAllergic VARCHAR,
    VitalyDays DECIMAL(3,0)
);

-- Sales

CREATE TABLE sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    Discount DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    SalesDate DATE,
    TransactionNumber VARCHAR(25)
);