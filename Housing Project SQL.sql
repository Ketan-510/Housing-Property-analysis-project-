create database HousingDB;
use HousingDB;

CREATE TABLE HouseSales (
    PropertyID INT PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    PropertyType VARCHAR(50),
    Bedrooms INT,
    Bathrooms INT,
    AreaSqFt INT,
    YearBuilt INT,
    Floor INT,
    TotalFloors INT,
    Furnishing VARCHAR(50),
    Parking VARCHAR(50),
    SaleType VARCHAR(50),
    SaleDate DATE,
    Currency VARCHAR(10),
    Price BIGINT
);

ALTER TABLE HouseSales ADD SaleYear INT;
ALTER TABLE HouseSales ADD SaleMonth INT;

UPDATE HouseSales
SET SaleYear = YEAR(SaleDate),
    SaleMonth = MONTH(SaleDate);
    
ALTER TABLE HouseSales ADD PricePerSqFt DECIMAL(12,2);
UPDATE HouseSales 
SET PricePerSqFt = Price / NULLIF(AreaSqFt,0);

ALTER TABLE HouseSales ADD PropertyCategory VARCHAR(20);
UPDATE HouseSales
SET PropertyCategory = CASE
    WHEN Price < 5000000 THEN 'Affordable'
    WHEN Price BETWEEN 5000000 AND 15000000 THEN 'Mid-Range'
    ELSE 'Luxury'
END;
