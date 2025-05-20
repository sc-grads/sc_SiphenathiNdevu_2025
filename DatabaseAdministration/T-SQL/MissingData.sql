-- Query 1: List employees who have no transactions
SELECT 
    E.EmployeeNumber    AS ENumber,           -- Employee number from tblEmployee, aliased as ENumber
    E.EmployeeFirstName,                       -- First name of the employee
    E.EmployeeLastName,                        -- Last name of the employee
    T.EmployeeNumber    AS TNumber,           -- Employee number from tblTransaction (will be NULL for no-transaction rows)
    SUM(T.Amount)       AS TotalAmount        -- Sum of transaction amounts (NULL or 0 when no transactions)
FROM tblEmployee AS E                         -- Base table of all employees, aliased as E
LEFT JOIN tblTransaction AS T                 -- Left join to include all employees
  ON E.EmployeeNumber = T.EmployeeNumber      -- Join on matching employee numbers
WHERE T.EmployeeNumber IS NULL               -- Filter to only those employees with no matching transactions
GROUP BY 
    E.EmployeeNumber,                         -- Group by employee number
    T.EmployeeNumber,                         -- (Always NULL here) grouped for compliance with SQL when aggregating
    E.EmployeeFirstName,
    E.EmployeeLastName
ORDER BY 
    E.EmployeeNumber,                         -- Order results by employee number
    T.EmployeeNumber,                         -- (NULL) included to match GROUP BY order
    E.EmployeeFirstName,
    E.EmployeeLastName;

-- Query 2: Using a derived table to find employees without transactions
SELECT 
    ENumber,                                   -- Employee number from derived table
    EmployeeFirstName,                         -- First name from derived table
    EmployeeLastName                           -- Last name from derived table
FROM (
    SELECT 
        E.EmployeeNumber    AS ENumber,        -- Employee number
        E.EmployeeFirstName,                   -- Employee first name
        E.EmployeeLastName,                    -- Employee last name
        T.EmployeeNumber    AS TNumber,        -- Transaction employee number (NULL if no transactions)
        SUM(T.Amount)       AS TotalAmount     -- Sum of transaction amounts per employee
    FROM tblEmployee AS E
    LEFT JOIN tblTransaction AS T
      ON E.EmployeeNumber = T.EmployeeNumber
    GROUP BY 
        E.EmployeeNumber,
        T.EmployeeNumber,
        E.EmployeeFirstName,
        E.EmployeeLastName
) AS newTable                                  -- Derived table alias containing aggregated results
WHERE TNumber IS NULL                          -- Keep only rows where no transactions exist
ORDER BY 
    ENumber,                                   -- Order by derived employee number
    TNumber,                                   -- (NULL) included to satisfy ORDER BY
    EmployeeFirstName,
    EmployeeLastName;

-- Query 3: Find “orphan” transactions whose employee number does not exist
SELECT *
FROM (
    SELECT 
        E.EmployeeNumber    AS ENumber,        -- Employee number (NULL for orphan transactions)
        E.EmployeeFirstName,                   -- Employee first name (NULL for orphans)
        E.EmployeeLastName,                    -- Employee last name (NULL for orphans)
        T.EmployeeNumber    AS TNumber,        -- Transaction’s employee number
        SUM(T.Amount)       AS TotalAmount     -- Sum of amounts per transaction grouping
    FROM tblEmployee AS E
    RIGHT JOIN tblTransaction AS T              -- Right join to include all transactions
      ON E.EmployeeNumber = T.EmployeeNumber
    GROUP BY 
        E.EmployeeNumber,
        T.EmployeeNumber,
        E.EmployeeFirstName,
        E.EmployeeLastName
) AS newTable                                  -- Derived table alias for joined results
WHERE ENumber IS NULL                          -- Filter to only transactions without matching employees
ORDER BY 
    ENumber,                                   -- (NULL) first in ordering, since these are orphans
    TNumber,                                   -- Transaction employee number
    EmployeeFirstName,
    EmployeeLastName;
