-- Create Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,        -- Unique identifier for each project
    ProjectName VARCHAR(100) NOT NULL, -- Name of the project
    StartDate DATE,                    -- Start date of the project
    EndDate DATE,                      -- End date of the project (nullable)
    Budget DECIMAL(15,2)               -- Budget allocated for the project
);
