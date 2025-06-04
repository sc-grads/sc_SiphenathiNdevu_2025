-- Create BillableTypes table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BillableTypes')
BEGIN
    CREATE TABLE BillableTypes (
        BillableTypeID INT IDENTITY(1,1) PRIMARY KEY,
        BillableStatus NVARCHAR(50) NOT NULL UNIQUE
    );
END
GO