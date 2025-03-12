-- Step 1: Use the database
USE MyDatabase;
GO

-- Step 2: Create a Users table
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing primary key
    FullName NVARCHAR(100) NOT NULL,       -- User's full name
    Email NVARCHAR(100) UNIQUE NOT NULL,   -- Unique email address
    Age INT CHECK(Age >= 18)               -- Age must be 18 or older
);
GO