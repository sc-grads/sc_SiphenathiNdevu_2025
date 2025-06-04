--Create the TimesheetDB database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'TimesheetDB')
BEGIN
    CREATE DATABASE TimesheetDB;
END
GO
