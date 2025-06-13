--Create the TimesheetDB database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'TimesheetDB')
BEGIN
    CREATE DATABASE TimesheetDB;
END
GO

-- Create Employee table
CREATE TABLE dbo.Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    ConsultantName NVARCHAR(100) NOT NULL
);

-- Create TimesheetStaging table
CREATE TABLE dbo.TimesheetStaging (
    EmployeeName NVARCHAR(100),
    ActivityName NVARCHAR(100),
    ProjectName NVARCHAR(100),
    BillableType NVARCHAR(50),
    WorkDate DATE,
    StartTime TIME(7),
    EndTime TIME(7),
    Comments NVARCHAR(255),
    FileName NVARCHAR(255),
    Description NVARCHAR(255)
);

-- Create Timesheet table
CREATE TABLE dbo.Timesheet (
    TimesheetID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    ActivityName NVARCHAR(100),
    ProjectName NVARCHAR(100),
    BillableType NVARCHAR(50),
    WorkDate DATE,
    DayOfWeek NVARCHAR(20),
    StartTime VARCHAR(5),
    EndTime VARCHAR(5),
    TotalHours DECIMAL(5,2),
    Comments NVARCHAR(255),
    FileName NVARCHAR(255),
    Description NVARCHAR(255),
    InsertedAt DATETIME,
    FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
);

-- Create AuditLog table
CREATE TABLE dbo.AuditLog (
    AuditLogID INT PRIMARY KEY IDENTITY(1,1),
    PackageName NVARCHAR(100),
    TaskName NVARCHAR(100),
    TableName NVARCHAR(100),
    RowsLoaded INT,
    RunDate DATETIME DEFAULT GETUTCDATE(),
    ExecutedBy NVARCHAR(100),
    EmployeeName NVARCHAR(100),
    FileName NVARCHAR(255)
);

-- Create ErrorLog table
CREATE TABLE dbo.ErrorLog (
    ErrorID INT PRIMARY KEY IDENTITY(1,1),
    ErrorDate DATETIME DEFAULT GETDATE(),
    Source NVARCHAR(255),
    ErrorMessage NVARCHAR(MAX),
    FileName NVARCHAR(255),
    EmployeeName NVARCHAR(100)
);


