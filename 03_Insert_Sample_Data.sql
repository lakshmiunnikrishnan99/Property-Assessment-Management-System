INSERT INTO Municipality
(MunicipalityName, Region, Province)

VALUES
('Vancouver','Lower Mainland','BC'),
('Burnaby','Lower Mainland','BC'),
('Richmond','Lower Mainland','BC'),
('Surrey','Lower Mainland','BC'),
('Coquitlam','Lower Mainland','BC');

INSERT INTO PropertyType
(PropertyTypeName)

VALUES
('Residential'),
('Commercial'),
('Industrial'),
('Agricultural');

INSERT INTO Owner
(FirstName, LastName, Phone, Email, DateOfBirth)

VALUES

('John','Smith','6045551111','john.smith@email.com','1984-05-11'),

('Emily','Johnson','6045551112','emily@email.com','1990-09-15'),

('David','Brown','6045551113','david@email.com','1978-12-01'),

('Sophia','Wilson','6045551114','sophia@email.com','1995-02-18'),

('Michael','Lee','6045551115','michael@email.com','1986-11-29');

INSERT INTO Property
(
OwnerID,
MunicipalityID,
PropertyTypeID,
StreetAddress,
PostalCode,
YearBuilt,
LotSize,
Bedrooms,
Bathrooms
)

VALUES

(1,1,1,'123 Main Street','V5K1A1',2004,5200,4,3),

(2,2,1,'85 Kingsway','V5H2A3',2010,4300,3,2),

(3,3,2,'500 Westminster Hwy','V6X2A1',2015,8900,NULL,NULL),

(4,4,1,'72 Fraser Highway','V3R2B3',1998,6100,5,4),

(5,5,1,'12 Pinetree Way','V3B5A8',2020,4700,4,3);

INSERT INTO Assessment
(
PropertyID,
AssessmentYear,
LandValue,
BuildingValue,
AssessmentDate
)

VALUES

(1001,2025,680000,520000,'2025-01-01'),

(1002,2025,590000,430000,'2025-01-01'),

(1003,2025,1400000,900000,'2025-01-01'),

(1004,2025,710000,490000,'2025-01-01'),

(1005,2025,760000,560000,'2025-01-01');

INSERT INTO Sales
(
PropertyID,
SaleDate,
SalePrice,
BuyerName
)

VALUES

(1001,'2024-08-15',1225000,'Sarah Jones'),

(1002,'2023-06-10',1040000,'Kevin White'),

(1003,'2025-02-20',2480000,'ABC Holdings'),

(1004,'2022-10-05',1175000,'Olivia Green'),

(1005,'2025-03-12',1360000,'Lucas Martin');

--TESTING

SELECT * FROM Municipality;

SELECT * FROM PropertyType;

SELECT * FROM Owner;

SELECT * FROM Property;

SELECT * FROM Assessment;

SELECT * FROM Sales;

--JOIN
SELECT

StreetAddress,
FirstName,
LastName,
MunicipalityName,
AssessedValue

FROM Property

JOIN Owner
ON Property.OwnerID=Owner.OwnerID

JOIN Municipality
ON Property.MunicipalityID=Municipality.MunicipalityID

JOIN Assessment
ON Property.PropertyID=Assessment.PropertyID;
