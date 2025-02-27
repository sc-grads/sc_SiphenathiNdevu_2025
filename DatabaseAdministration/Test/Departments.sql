-- Create a Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,        -- Unique identifier for each department
    DepartmentName VARCHAR(100) NOT NULL, -- Name of the department
    Location VARCHAR(100)                 -- Location of the department
);
