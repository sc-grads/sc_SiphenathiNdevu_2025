-- Add a primary key on EmployeeNumber to uniquely identify each employee
ALTER TABLE tblEmployee
  ADD CONSTRAINT PK_tblEmployee PRIMARY KEY (EmployeeNumber);

-- Insert a new employee with EmployeeNumber = 2004
INSERT INTO tblEmployee(
  EmployeeNumber,
  EmployeeFirstName,
  EmployeeMiddleName,
  EmployeeLastName,
  EmployeeGovernmentID,
  DateOfBirth,
  Department
)
VALUES (
  2004,
  'FirstName',
  'MiddleName',
  'LastName',
  'AB12345FI',
  '2014-01-01',
  'Accounts'
);

-- Remove the test employee we just added
DELETE FROM tblEmployee
WHERE EmployeeNumber = 2004;

-- Drop the primary key constraint to allow schema changes
ALTER TABLE tblEmployee
  DROP CONSTRAINT PK_tblEmployee;

-- Create a new table with an IDENTITY PK on EmployeeNumber
CREATE TABLE tblEmployee2 (
  EmployeeNumber INT
    CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1),  -- auto-incrementing
  EmployeeName NVARCHAR(20)
);

-- Insert two rows with only EmployeeName (EmployeeNumber generated automatically)
INSERT INTO tblEmployee2
VALUES ('My Name'),
       ('My Name');

-- View current contents (to see identity values 1 and 2)
SELECT * FROM tblEmployee2;

-- Delete all rows (identity values remain but rows are removed)
DELETE FROM tblEmployee2;

-- Truncate table to reset identity seed back to 0
TRUNCATE TABLE tblEmployee2;

-- Explicitly insert with specified identity values (3 and 4)
INSERT INTO tblEmployee2(EmployeeNumber, EmployeeName)
VALUES (3, 'My Name'),
       (4, 'My Name');

-- Enable manual identity insertion for this session
SET IDENTITY_INSERT tblEmployee2 ON;

-- Insert additional rows with custom identity values (38 and 39)
INSERT INTO tblEmployee2(EmployeeNumber, EmployeeName)
VALUES (38, 'My Name'),
       (39, 'My Name');

-- Turn off manual identity insertion
SET IDENTITY_INSERT tblEmployee2 OFF;

-- Drop the temporary table once testing is complete
DROP TABLE tblEmployee2;

-- Retrieve the last identity value generated in this session (may be unreliable across scopes)
SELECT @@IDENTITY;

-- Retrieve the last identity value generated in this scope (recommended for current table)
SELECT SCOPE_IDENTITY();

-- Retrieve the current identity seed value for tblEmployee2 (even after table is dropped)
SELECT IDENT_CURRENT('dbo.tblEmployee2');

-- Create another table with an IDENTITY primary key
CREATE TABLE tblEmployee3 (
  EmployeeNumber INT
    CONSTRAINT PK_tblEmployee3 PRIMARY KEY IDENTITY(1,1),
  EmployeeName NVARCHAR(20)
);

-- Insert two rows to see identity values 1 and 2 in the new table
INSERT INTO tblEmployee3
VALUES ('My Name'),
       ('My Name');
