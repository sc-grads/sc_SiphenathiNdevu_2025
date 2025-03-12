-- Insert sample users into the Users table
USE MyDatabase;
GO

INSERT INTO Users (FullName, Email, Age)
VALUES 
    ('Siphenathi Ndevu', 'siphenathi.doe@example.com', 25),
    ('Jane Smith', 'jane.smith@example.com', 30),
    ('Siphe John', 'siphe.john@example.com', 22);
	
GO
