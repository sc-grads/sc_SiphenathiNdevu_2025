-- Create Projects table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Projects')
BEGIN
    CREATE TABLE Projects (
        ProjectID INT IDENTITY(1,1) PRIMARY KEY,
        ClientID INT NOT NULL,
        ProjectName NVARCHAR(100) NOT NULL,
        CONSTRAINT FK_Projects_Clients FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
        CONSTRAINT UQ_Client_Project UNIQUE (ClientID, ProjectName)
    );
END
GO