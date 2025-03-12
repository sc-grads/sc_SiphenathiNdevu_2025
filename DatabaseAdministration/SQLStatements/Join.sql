
-- Selecting all records from both tables
SELECT * FROM [dbo].[Employee];
SELECT * FROM [dbo].[Sales];

-- Typing a new SELECT statement
SELECT * FROM [dbo].[Employee] e
JOIN [dbo].[Sales] s
on e.empname = s.empname

