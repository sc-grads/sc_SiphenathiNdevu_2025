-- Delete a user based on UserID
USE MyDatabase;
GO

DELETE FROM Users
WHERE UserID = 3;
GO

-- Delete all users who are younger than 25
DELETE FROM Users
WHERE Age < 25;
GO
