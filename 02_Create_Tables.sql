CREATE TABLE Municipality
(
    MunicipalityID INT IDENTITY(1,1) PRIMARY KEY,

    MunicipalityName VARCHAR(50) NOT NULL,

    Region VARCHAR(50) NOT NULL,

    Province CHAR(2) NOT NULL DEFAULT 'BC'
);
 CREATE TABLE PropertyType
(
    PropertyTypeID INT IDENTITY(1,1) PRIMARY KEY,

    PropertyTypeName VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE Owner
(
    OwnerID INT IDENTITY(1,1) PRIMARY KEY,

    FirstName VARCHAR(50) NOT NULL,

    LastName VARCHAR(50) NOT NULL,

    Phone VARCHAR(20),

    Email VARCHAR(100),

    DateOfBirth DATE
);
CREATE TABLE Property
(
    PropertyID INT IDENTITY(1001,1) PRIMARY KEY,

    OwnerID INT NOT NULL,

    MunicipalityID INT NOT NULL,

    PropertyTypeID INT NOT NULL,

    StreetAddress VARCHAR(120) NOT NULL,

    PostalCode VARCHAR(10),

    YearBuilt INT,

    LotSize DECIMAL(8,2),

    Bedrooms INT,

    Bathrooms DECIMAL(3,1),

    FOREIGN KEY (OwnerID)
        REFERENCES Owner(OwnerID),

    FOREIGN KEY (MunicipalityID)
        REFERENCES Municipality(MunicipalityID),

    FOREIGN KEY (PropertyTypeID)
        REFERENCES PropertyType(PropertyTypeID)
);
CREATE TABLE Assessment
(
    AssessmentID INT IDENTITY(1,1) PRIMARY KEY,

    PropertyID INT NOT NULL,

    AssessmentYear INT NOT NULL,

    LandValue MONEY NOT NULL,

    BuildingValue MONEY NOT NULL,

    AssessedValue AS (LandValue + BuildingValue),

    AssessmentDate DATE NOT NULL,

    FOREIGN KEY (PropertyID)
        REFERENCES Property(PropertyID)
);
CREATE TABLE Sales
(
    SaleID INT IDENTITY(1,1) PRIMARY KEY,

    PropertyID INT NOT NULL,

    SaleDate DATE NOT NULL,

    SalePrice MONEY NOT NULL,

    BuyerName VARCHAR(100),

    FOREIGN KEY (PropertyID)
        REFERENCES Property(PropertyID)
);
