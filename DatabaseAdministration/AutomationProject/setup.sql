-- 1. Create the Database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
END
GO

-- Switch to the AutoTest database
USE AutoTest;
GO

-- 2. Create the User Table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'user')
BEGIN
    CREATE TABLE [dbo].[user] (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(100) NOT NULL,
        Surname NVARCHAR(100) NOT NULL,
        Email NVARCHAR(255) UNIQUE NOT NULL
    );
END
GO

-- 3. Create a Stored Procedure to Insert Data
IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertUser')
BEGIN
    EXEC('
        CREATE PROCEDURE InsertUser
            @Name NVARCHAR(100),
            @Surname NVARCHAR(100),
            @Email NVARCHAR(255)
        AS
        BEGIN
            INSERT INTO [dbo].[user] (Name, Surname, Email)
            VALUES (@Name, @Surname, @Email);
        END
    ');
END
GO

-- 4. Create SQL Server Login and User
IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'Auto_user')
BEGIN
    CREATE LOGIN Auto_user WITH PASSWORD = 'Siphenathi';
END
GO

USE AutoTest;
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Auto_user')
BEGIN
    CREATE USER Auto_user FOR LOGIN Auto_user;
    ALTER ROLE db_owner ADD MEMBER Auto_user;
END
GO
