-- Add a CHECK constraint to enforce that Amount stays within the allowed range
ALTER TABLE tblTransaction
  ADD CONSTRAINT chkAmount
    CHECK (Amount > -1000 AND Amount < 1000);

-- Attempt to insert a value outside the allowed range (should fail)
INSERT INTO tblTransaction
VALUES (1010, '2014-01-01', 1);

-- Temporarily disable enforcement on existing rows, then add a CHECK on MiddleName
ALTER TABLE tblEmployee WITH NOCHECK
  ADD CONSTRAINT chkMiddleName
    CHECK (
      REPLACE(EmployeeMiddleName, '.', '') = EmployeeMiddleName
      OR EmployeeMiddleName IS NULL
    );

-- Drop the MiddleName check constraint
ALTER TABLE tblEmployee
  DROP CONSTRAINT chkMiddleName;

-- Begin a transaction to test inserting a middle name containing a dot (no validation due to NOCHECK)
BEGIN TRAN
  INSERT INTO tblEmployee
    VALUES (2003, 'A', 'B.', 'C', 'D', '2014-01-01', 'Accounts');
  SELECT * FROM tblEmployee WHERE EmployeeNumber = 2003;
ROLLBACK TRAN

-- Temporarily disable enforcement on existing rows, then add a date-of-birth constraint
ALTER TABLE tblEmployee WITH NOCHECK
  ADD CONSTRAINT chkDateOfBirth
    CHECK (DateOfBirth BETWEEN '1900-01-01' AND GETDATE());

-- Begin a transaction to test inserting a future date of birth (should fail)
BEGIN TRAN
  INSERT INTO tblEmployee
    VALUES (2003, 'A', 'B', 'C', 'D', '2115-01-01', 'Accounts');
  SELECT * FROM tblEmployee WHERE EmployeeNumber = 2003;
ROLLBACK TRAN

-- Create a new table with an inline CHECK constraint on MiddleName
CREATE TABLE tblEmployee2 (
  EmployeeMiddleName VARCHAR(50) NULL,
  CONSTRAINT CK_EmployeeMiddleName
    CHECK (
      REPLACE(EmployeeMiddleName, '.', '') = EmployeeMiddleName
      OR EmployeeMiddleName IS NULL
    )
);

-- Drop the temporary table once done
DROP TABLE tblEmployee2;

-- Remove the date-of-birth and middle-name check constraints, and the amount constraint
ALTER TABLE tblEmployee
  DROP CONSTRAINT chkDateOfBirth;
ALTER TABLE tblEmployee
  DROP CONSTRAINT chkMiddleName;
ALTER TABLE tblTransaction
  DROP CONSTRAINT chkAmount;
