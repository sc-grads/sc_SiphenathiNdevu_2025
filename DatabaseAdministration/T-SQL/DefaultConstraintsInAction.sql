-- Add a new nullable DateOfEntry column to tblTransaction
ALTER TABLE tblTransaction
ADD DateOfEntry datetime

-- Create a default constraint so new rows get GETDATE() if DateOfEntry isn’t supplied
ALTER TABLE tblTransaction
ADD CONSTRAINT defDateOfEntry
  DEFAULT GETDATE() FOR DateOfEntry;

-- Remove any existing test rows for EmployeeNumber < 3
DELETE FROM tblTransaction
WHERE EmployeeNumber < 3

-- Insert a row without DateOfEntry (will use default GETDATE())
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES (1, '2014-01-01', 1)

-- Insert a row with an explicit DateOfEntry value
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
VALUES (2, '2014-01-02', 1, '2013-01-01')

-- Verify the inserts for EmployeeNumber < 3
SELECT *
FROM tblTransaction
WHERE EmployeeNumber < 3

-- Create a new table with DateOfEntry column and inline default constraint
CREATE TABLE tblTransaction2 (
  Amount             smallmoney    NOT NULL,
  DateOfTransaction  smalldatetime NOT NULL,
  EmployeeNumber     int           NOT NULL,
  DateOfEntry        datetime NULL
    CONSTRAINT tblTransaction2_defDateOfEntry
      DEFAULT GETDATE()
)

-- Insert without DateOfEntry into the new table (uses default)
INSERT INTO tblTransaction2(Amount, DateOfTransaction, EmployeeNumber)
VALUES (1, '2014-01-01', 1)

-- Insert with an explicit DateOfEntry
INSERT INTO tblTransaction2(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
VALUES (2, '2014-01-02', 1, '2013-01-01')

-- Check the rows in tblTransaction2 for EmployeeNumber < 3
SELECT *
FROM tblTransaction2
WHERE EmployeeNumber < 3

-- Clean up: drop the temporary table
DROP TABLE tblTransaction2

-- Remove the DateOfEntry column and its constraint from tblTransaction
ALTER TABLE tblTransaction
DROP COLUMN DateOfEntry

ALTER TABLE tblTransaction
DROP CONSTRAINT defDateOfEntry

-- Demonstrate adding DateOfEntry with default and backfilling existing rows
BEGIN TRAN
  ALTER TABLE tblTransaction
    ADD DateOfEntry datetime
      DEFAULT GETDATE() WITH VALUES  -- populates existing rows immediately
  -- Inspect the table with newly backfilled DateOfEntry values
  SELECT *
  FROM tblTransaction
ROLLBACK TRAN  -- undo the demo changes
