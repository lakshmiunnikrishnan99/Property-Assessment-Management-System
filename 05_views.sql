USE PropertyAssessmentDB;
GO

CREATE VIEW PropertySummary AS

SELECT
StreetAddress,
MunicipalityName,
PropertyTypeName,
AssessedValue

FROM Property

JOIN Municipality
ON Property.MunicipalityID=Municipality.MunicipalityID

JOIN PropertyType
ON Property.PropertyTypeID=PropertyType.PropertyTypeID

JOIN Assessment
ON Property.PropertyID=Assessment.PropertyID;

--test
SELECT *
FROM PropertySummary;

