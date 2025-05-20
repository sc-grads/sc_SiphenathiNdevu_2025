-- Version 1: Delete orphan transactions via RIGHT JOIN, wrapped in a transaction for safety
BEGIN TRANSACTION;
    -- Show the number of rows before deletion
    SELECT COUNT(*) AS BeforeDelete_Count FROM tblTransaction;
    
    -- Delete rows in tblTransaction that have no matching EmployeeNumber in tblEmployee
    DELETE T
    FROM tblEmployee AS E
    RIGHT JOIN tblTransaction AS T
      ON E.EmployeeNumber = T.EmployeeNumber
    WHERE E.EmployeeNumber IS NULL;
    -- ↑ “E.EmployeeNumber IS NULL” identifies transactions without a corresponding employee
    
    -- Show the number of rows after deletion
    SELECT COUNT(*) AS AfterDelete_Count FROM tblTransaction;
ROLLBACK TRANSACTION;
    -- Undo the delete so that tblTransaction is unchanged

-- Verify rollback success
SELECT COUNT(*) AS Final_Count FROM tblTransaction;


-- Version 2: Delete orphan transactions by filtering on a derived‐table subquery
BEGIN TRANSACTION;
    -- Show the number of rows before deletion
    SELECT COUNT(*) AS BeforeDelete_Count FROM tblTransaction;
    
    -- Delete rows whose EmployeeNumber appears in the list of “orphan” TNumber values
    DELETE FROM tblTransaction
    WHERE EmployeeNumber IN (
        SELECT TNumber
        FROM (
            -- Build a temporary result set pairing transactions with employees
            SELECT 
                E.EmployeeNumber    AS ENumber,      -- Employee side (NULL if orphan)
                T.EmployeeNumber    AS TNumber,      -- Transaction side
                SUM(T.Amount)       AS TotalAmount   -- Aggregate amount per transaction group
            FROM tblEmployee AS E
            RIGHT JOIN tblTransaction AS T
              ON E.EmployeeNumber = T.EmployeeNumber
            GROUP BY 
                E.EmployeeNumber,
                T.EmployeeNumber
        ) AS newTable
        WHERE ENumber IS NULL
        -- Keep only those TNumber entries where ENumber is NULL (i.e., no matching employee)
    );
    
    -- Show the number of rows after deletion
    SELECT COUNT(*) AS AfterDelete_Count FROM tblTransaction;
ROLLBACK TRANSACTION;
    -- Undo the delete so that tblTransaction is unchanged

-- Verify rollback success
SELECT COUNT(*) AS Final_Count FROM tblTransaction;
