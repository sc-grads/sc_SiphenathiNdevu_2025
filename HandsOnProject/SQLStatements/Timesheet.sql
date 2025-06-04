IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Timesheets')
BEGIN
    CREATE TABLE Timesheets (
        TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
        EmployeeID INT NOT NULL,
        ProjectID INT NOT NULL,
        ActivityID INT NOT NULL,
        BillableTypeID INT NOT NULL,
        WorkDate DATE NOT NULL,
        DayOfWeek NVARCHAR(20),
        StartTime TIME NOT NULL,
        EndTime TIME NOT NULL,
        TotalHours DECIMAL(5,2) NOT NULL,
        Comments NVARCHAR(MAX),
        FileName NVARCHAR(255) DEFAULT 'N/A',
        InsertedAt DATETIME NOT NULL DEFAULT GETDATE(),
        CONSTRAINT FK_Timesheets_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
        CONSTRAINT FK_Timesheets_Projects FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
        CONSTRAINT FK_Timesheets_Activities FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID),
        CONSTRAINT FK_Timesheets_BillableTypes FOREIGN KEY (BillableTypeID) REFERENCES BillableTypes(BillableTypeID),
        CONSTRAINT CK_Timesheets_TotalHours CHECK (TotalHours >= 0),
        CONSTRAINT CK_TimeRange CHECK (StartTime < EndTime),
        CONSTRAINT UQ_Timesheet_UniqueEntry UNIQUE (EmployeeID, ProjectID, WorkDate, StartTime)
    );
END
GO
