-- Add a UNIQUE constraint on EmployeeGovernmentID to prevent duplicate IDs
ALTER TABLE tblEmployee
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID);

-- Identify any government IDs that appear more than once
SELECT
  EmployeeGovernmentID,
  COUNT(EmployeeGovernmentID) AS MyCount
FROM tblEmployee
GROUP BY EmployeeGovernmentID
HAVING COUNT(EmployeeGovernmentID) > 1;

-- Show the actual rows with those duplicated IDs for manual inspection
SELECT *
FROM tblEmployee
WHERE EmployeeGovernmentID IN ('HN513777D', 'TX593671R');

-- Begin a transaction to remove duplicate rows in a controlled way
BEGIN TRAN
  -- Delete all rows where EmployeeNumber is less than 3 (IDs 1 and 2)
  DELETE FROM tblEmployee
  WHERE EmployeeNumber < 3;

  -- Delete only the first two rows for EmployeeNumbers 131 and 132
  DELETE TOP (2) FROM tblEmployee
  WHERE EmployeeNumber IN (131, 132);

  -- Re-check that the problematic government IDs no longer have duplicates
  SELECT *
  FROM tblEmployee
  WHERE EmployeeGovernmentID IN ('HN513777D', 'TX593671R');
-- Commit the changes so that the deletions are permanent
COMMIT TRAN

-- Add a composite UNIQUE constraint on tblTransaction to prevent identical transactions
ALTER TABLE tblTransaction
ADD CONSTRAINT unqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber);

-- Clean up any existing transactions for EmployeeNumber 131 before testing
DELETE FROM tblTransaction
WHERE EmployeeNumber = 131;

-- Attempt to insert two identical rows; the second should fail under the UNIQUE constraint
INSERT INTO tblTransaction
VALUES (1, '2015-01-01', 131);
INSERT INTO tblTransaction
VALUES (1, '2015-01-01', 131);  -- Expected to error: duplicate composite key

-- Drop the UNIQUE constraint to allow duplicates again if needed
ALTER TABLE tblTransaction
DROP CONSTRAINT unqTransaction;

-- Create a new table with the composite UNIQUE constraint defined at creation time
CREATE TABLE tblTransaction2 (
  Amount             smallmoney   NOT NULL,
  DateOfTransaction  smalldatetime NOT NULL,
  EmployeeNumber     int          NOT NULL,
  CONSTRAINT unqTransaction2 UNIQUE (Amount, DateOfTransaction, EmployeeNumber)
);

-- Remove the temporary table when finished
DROP TABLE tblTransaction2;
