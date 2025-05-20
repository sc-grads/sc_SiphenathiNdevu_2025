-- Start a transaction to safely test the following schema and data changes
BEGIN TRAN

-- Allow EmployeeNumber in tblTransaction to be nullable
ALTER TABLE tblTransaction
  ALTER COLUMN EmployeeNumber INT NULL

-- Add default constraint so that new NULL EmployeeNumber values default to 124
ALTER TABLE tblTransaction
  ADD CONSTRAINT DF_tblTransaction
    DEFAULT 124 FOR EmployeeNumber

-- Add a foreign key constraint referencing tblEmployee,
-- but do not validate existing rows (WITH NOCHECK)
-- On parent update: cascade changes to child
-- On parent delete: set child EmployeeNumber to its default value (124)
ALTER TABLE tblTransaction WITH NOCHECK
  ADD CONSTRAINT FK_tblTransaction_EmployeeNumber
    FOREIGN KEY (EmployeeNumber)
      REFERENCES tblEmployee(EmployeeNumber)
      ON UPDATE CASCADE
      ON DELETE SET DEFAULT

-- (Optional) Example of changing a parent key value; commented out so not executed
-- UPDATE tblEmployee SET EmployeeNumber = 9123 WHERE EmployeeNumber = 123

-- Delete an employee to trigger the foreign key ON DELETE SET DEFAULT action
DELETE FROM tblEmployee
WHERE EmployeeNumber = 123

-- Inspect transactions, showing how deleted parent rows were handled.
-- Specifically look at certain Amount values to verify the default was applied.
SELECT
  E.EmployeeNumber,  -- may be NULL or default value if parent was deleted
  T.*
FROM tblEmployee AS E
RIGHT JOIN tblTransaction AS T
  ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.Amount IN (-179.47, 786.22, -967.36, 957.03)

-- Rollback the entire transaction to leave the database unchanged
ROLLBACK TRAN
