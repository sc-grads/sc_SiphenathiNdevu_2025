-- 1) Create a temporal table to track full history of changes
CREATE TABLE dbo.tblEmployeeTemporal
(
    EmployeeNumber       int            NOT NULL PRIMARY KEY CLUSTERED,  -- business key + clustered index
    EmployeeFirstName    varchar(50)    NOT NULL,
    EmployeeMiddleName   varchar(50)    NULL,
    EmployeeLastName     varchar(50)    NOT NULL,
    EmployeeGovernmentID char(10)       NOT NULL,
    DateOfBirth          date           NOT NULL,
    Department           varchar(19)    NULL,

    -- 2) Period columns for system time, auto-managed by SQL Server
    ValidFrom            datetime2(2)   GENERATED ALWAYS AS ROW START  HIDDEN,
    ValidTo              datetime2(2)   GENERATED ALWAYS AS ROW END    HIDDEN,
    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)
)
-- 3) Enable system-versioning, routing history into a dedicated table
WITH (
    SYSTEM_VERSIONING = ON
    (HISTORY_TABLE = dbo.tblEmployeeHistory)
);
GO

-- 4) Seed the table with some initial “current” records
INSERT INTO dbo.tblEmployeeTemporal
    (EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName,
     EmployeeGovernmentID, DateOfBirth, Department)
VALUES
    (123, 'Jane',    NULL,   'Zwilling',  'AB123456S4', '1985-01-01', 'Customer Relations'),
    (124, 'Carolyn', 'Andrea','Zimmerman', 'AB345678J',  '1975-06-01', 'Commercial'),
    (125, 'Jane',    NULL,   'Zaboritski','UT778728T',  '1977-12-08', 'Commercial'),
    (126, 'Ken',     'J',    'Yukish',    'PO219030I',  '1969-12-27', 'HR'),
    (127, 'Terri',   'Lee',  'Yu',        'ZH2646994',  '1986-11-14', 'Customer Relations'),
    (128, 'Roberto', NULL,   'Young',     'EYH39280D',  '1967-04-05', 'Customer Relations');
GO

-- 5) View the “current” snapshot of tblEmployeeTemporal
SELECT *
FROM dbo.tblEmployeeTemporal;
GO

-- 6) Make some updates – each update generates a history row automatically
UPDATE dbo.tblEmployeeTemporal
SET EmployeeLastName = 'Smith'
WHERE EmployeeNumber = 124;

UPDATE dbo.tblEmployeeTemporal
SET EmployeeLastName = 'Albert'
WHERE EmployeeNumber = 124;
GO

-- 7) View the current table again (only the latest row for Employee 124 is shown)
SELECT *
FROM dbo.tblEmployeeTemporal;
GO

-- 8) To see history, query the HISTORY_TABLE or use FOR SYSTEM_TIME clauses in dbo.tblEmployeeTemporal:
--    e.g. 
SELECT * FROM dbo.tblEmployeeTemporal FOR SYSTEM_TIME ALL WHERE EmployeeNumber = 124;

alter table [dbo].[tblEmployee]
add
ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START CONSTRAINT def_ValidFrom DEFAULT SYSUTCDATETIME()
	, ValidTo datetime2(2) GENERATED ALWAYS AS ROW END CONSTRAINT def_ValidTo DEFAULT
																  CONVERT(datetime2(2), '9999-12-31 23:59:59')

alter table dbo.tblEmployee
set (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory2))

alter table dbo.tblEmployee
set (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory2))
--Querying temporal data at a point of time
select * from dbo.tblEmployeeTemporal
FOR SYSTEM_TIME AS OF '2021-02-01'
--Querying temporal data between time periods
select * from dbo.tblEmployeeTemporal
FOR SYSTEM_TIME
--FROM startdatetime TO enddatetime
--BETWEEN startdatetime AND enddatetime
--CONTAINED IN (startdatetime, enddatetime)