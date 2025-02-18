-- Update the age of a user based on UserID
USE MyDatabase;
GO

UPDATE Users
SET Age = 35
WHERE UserID = 1;
GO

-- Update the email address of a specific user
UPDATE Users
SET Email = 'siphejohn.newemail@example.com'
WHERE FullName = 'Siphe John';
GO
