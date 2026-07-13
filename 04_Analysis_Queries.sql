SELECT DISTINCT MunicipalityName
FROM Municipality;

SELECT *
FROM Sales
ORDER BY SalePrice DESC;

--Avg Assessed Value
SELECT AVG(AssessedValue)
FROM Assessment;
--Highest assessment
SELECT MAX(AssessedValue)
FROM Assessment;
--Number of properties
SELECT COUNT(*)
FROM Property;
--Average assessment by municipality
SELECT
MunicipalityName,
AVG(AssessedValue)
FROM Municipality
JOIN Property
ON Municipality.MunicipalityID=Property.MunicipalityID
JOIN Assessment
ON Property.PropertyID=Assessment.PropertyID
GROUP BY MunicipalityName;
--Inner join
SELECT
StreetAddress,
AssessedValue
FROM Property
JOIN Assessment
ON Property.PropertyID=Assessment.PropertyID;
--Properties sold below assessment
SELECT
StreetAddress,
SalePrice,
AssessedValue
FROM Sales
JOIN Assessment
ON Sales.PropertyID=Assessment.PropertyID
JOIN Property
ON Property.PropertyID=Assessment.PropertyID
WHERE SalePrice < AssessedValue;
--Having
SELECT
MunicipalityName,
AVG(AssessedValue)
FROM Municipality
JOIN Property
ON Municipality.MunicipalityID=Property.MunicipalityID
JOIN Assessment
ON Property.PropertyID=Assessment.PropertyID
GROUP BY MunicipalityName
HAVING AVG(AssessedValue) > 1000000;
--Case
SELECT
StreetAddress,
AssessedValue,

CASE

WHEN AssessedValue>1500000
THEN 'Luxury'

WHEN AssessedValue>900000
THEN 'Premium'

ELSE 'Standard'

END AS PropertyClass

FROM Assessment
JOIN Property
ON Assessment.PropertyID=Property.PropertyID;
--Top
SELECT TOP 5
StreetAddress,
AssessedValue
FROM Property
JOIN Assessment
ON Property.PropertyID=Assessment.PropertyID
ORDER BY AssessedValue DESC;
--All functions
SELECT

StreetAddress,

MunicipalityName,

FirstName+' '+LastName AS Owner,

PropertyTypeName,

AssessedValue,

SalePrice

FROM Property

JOIN Owner
ON Property.OwnerID=Owner.OwnerID

JOIN Municipality
ON Property.MunicipalityID=Municipality.MunicipalityID

JOIN PropertyType
ON Property.PropertyTypeID=PropertyType.PropertyTypeID

JOIN Assessment
ON Property.PropertyID=Assessment.PropertyID

JOIN Sales
ON Property.PropertyID=Sales.PropertyID;
