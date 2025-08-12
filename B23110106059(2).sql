DROP TABLE IF EXISTS ServiceRecords;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Salespersons;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Customers;



CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    Model VARCHAR(100),
    Brand VARCHAR(50),
    Year INT,
    Price DECIMAL(10,2),
    Color VARCHAR(50),
    InventoryCount INT
);

CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    HireDate DATE
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    CarID INT,
    SaleDate DATE,
    SalePrice DECIMAL(10,2),
    SalespersonID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID)
);

CREATE TABLE ServiceRecords (
    RecordID INT PRIMARY KEY,
    CarID INT,
    ServiceDate DATE,
    ServiceType VARCHAR(50),
    Cost DECIMAL(10,2),
    TechnicianID INT,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);


-- Customers
INSERT INTO Customers VALUES
(1, 'Ali Khan', 'Karachi', 'Sindh', '2023-01-15'),
(2, 'Fatima Ahmed', 'Lahore', 'Punjab', '2023-02-20'),
(3, 'Usman Sheikh', 'Islamabad', 'ICT', '2023-03-10'),
(4, 'Hira Malik', 'Peshawar', 'KPK', '2023-04-12'),
(5, 'Saad Hussain', 'Quetta', 'Balochistan', '2023-05-18'),
(6, 'Ayesha Siddiqui', 'Multan', 'Punjab', '2023-06-22');

-- Cars
INSERT INTO Cars VALUES
(1, 'Corolla XLI', 'Toyota', 2022, 3200000, 'White', 5),
(2, 'Corolla GLI', 'Toyota', 2023, 3800000, 'Black', 3),
(3, 'Civic Oriel', 'Honda', 2023, 4200000, 'Red', 4),
(4, 'Civic RS', 'Honda', 2022, 4700000, 'Blue', 2),
(5, 'Mehran VX', 'Suzuki', 2019, 850000, 'Silver', 7),
(6, 'Cultus VXR', 'Suzuki', 2021, 1800000, 'White', 6),
(7, 'Swift GLX', 'Suzuki', 2023, 2800000, 'Grey', 3),
(8, 'Alto VXL', 'Suzuki', 2022, 1700000, 'White', 5),
(9, 'Fortuner', 'Toyota', 2023, 9500000, 'Black', 2),
(10, 'Yaris ATIV', 'Toyota', 2023, 3500000, 'Red', 4),
(11, 'City Aspire', 'Honda', 2022, 3600000, 'Silver', 3);

-- Salespersons
INSERT INTO Salespersons VALUES
(1, 'Bilal Qureshi', 'Sales', '2021-05-10'),
(2, 'Sara Javed', 'Sales', '2020-03-15'),
(3, 'Imran Tariq', 'Sales', '2022-07-01');

-- Sales (enough to trigger HAVING conditions)
INSERT INTO Sales VALUES
(1, 1, 1, '2023-04-05', 3200000, 1),
(2, 2, 2, '2023-04-06', 3800000, 1),
(3, 3, 3, '2023-04-07', 4200000, 2),
(4, 4, 4, '2023-04-08', 4700000, 2),
(5, 5, 5, '2023-04-09', 850000, 3),
(6, 6, 6, '2023-04-10', 1800000, 3),
(7, 1, 1, '2023-04-11', 3200000, 1),
(8, 2, 1, '2023-04-12', 3200000, 1),
(9, 3, 1, '2023-04-13', 3200000, 1),
(10, 4, 1, '2023-04-14', 3200000, 1),
(11, 5, 1, '2023-04-15', 3200000, 1),
(12, 6, 1, '2023-04-16', 3200000, 1),
(13, 1, 1, '2023-04-17', 3200000, 1),
(14, 2, 1, '2023-04-18', 3200000, 1),
(15, 3, 9, '2023-04-19', 9500000, 2),
(16, 4, 10, '2023-04-20', 3500000, 3),
(17, 5, 11, '2023-04-21', 3600000, 3),
(18, 6, 11, '2023-04-22', 3600000, 3),
(19, 1, 11, '2023-04-23', 3600000, 3),
(20, 2, 11, '2023-04-24', 3600000, 3),
(21, 3, 11, '2023-04-25', 3600000, 3);

-- Service Records
INSERT INTO ServiceRecords VALUES
(1, 1, '2023-06-01', 'Oil Change', 5000, 101),
(2, 2, '2023-06-05', 'Brake Repair', 15000, 102),
(3, 3, '2023-06-10', 'Engine Overhaul', 80000, 103),
(4, 4, '2023-06-12', 'AC Service', 7000, 104),
(5, 5, '2023-06-15', 'Tire Replacement', 30000, 105);


-- Part 1: Basic Aggregate Functions
SELECT COUNT(*) AS TotalCustomers FROM Customers;
SELECT AVG(SalePrice) AS AverageSalePrice FROM Sales;
SELECT MAX(SalePrice) AS MostExpensiveCar FROM Sales;
SELECT SUM(InventoryCount) AS TotalInventory FROM Cars;
SELECT MIN(SaleDate) AS EarliestSale, MAX(SaleDate) AS LatestSale FROM Sales;


-- Part 2: GROUP BY Exercises
SELECT Brand, COUNT(Model) AS ModelCount
FROM Cars
GROUP BY Brand;

SELECT SalespersonID, SUM(SalePrice) AS TotalSales
FROM Sales
GROUP BY SalespersonID;

SELECT CarID, AVG(SalePrice) AS AvgSalePrice
FROM Sales
GROUP BY CarID;

SELECT ServiceType, AVG(Cost) AS AvgServiceCost
FROM ServiceRecords
GROUP BY ServiceType;

SELECT Brand, Color, COUNT(*) AS CountByBrandColor
FROM Cars
GROUP BY Brand, Color;


-- Part 3: HAVING Clause Exercises
SELECT Brand, COUNT(Model) AS ModelCount
FROM Cars
GROUP BY Brand
HAVING COUNT(Model) > 5;

SELECT CarID, COUNT(*) AS TimesSold
FROM Sales
GROUP BY CarID
HAVING COUNT(*) > 10;

SELECT SalespersonID, AVG(SalePrice) AS AvgSalePrice
FROM Sales
GROUP BY SalespersonID
HAVING AVG(SalePrice) > 5000000; -- Adjusted to match high-end sales

SELECT EXTRACT(MONTH FROM SaleDate) AS SaleMonth, COUNT(*) AS SalesCount
FROM Sales
GROUP BY SaleMonth
HAVING COUNT(*) > 20;

SELECT ServiceType, AVG(Cost) AS AvgCost
FROM ServiceRecords
GROUP BY ServiceType
HAVING AVG(Cost) > 5000;
