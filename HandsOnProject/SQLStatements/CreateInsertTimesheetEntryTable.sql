IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertTimesheetEntry')
BEGIN
    EXEC('
        CREATE PROCEDURE InsertTimesheetEntry
            @EmployeeID INT,
            @ProjectID INT,
            @ActivityID INT,
            @BillableTypeID INT,
            @WorkDate DATE,
            @DayOfWeek NVARCHAR(20),
            @StartTime TIME,
            @EndTime TIME,
            @TotalHours DECIMAL(5,2),
            @Comments NVARCHAR(MAX),
            @FileName NVARCHAR(255)
        AS
        BEGIN
            INSERT INTO Timesheets (
                EmployeeID, ProjectID, ActivityID, BillableTypeID,
                WorkDate, DayOfWeek, StartTime, EndTime,
                TotalHours, Comments, FileName
            )
            VALUES (
                @EmployeeID, @ProjectID, @ActivityID, @BillableTypeID,
                @WorkDate, @DayOfWeek, @StartTime, @EndTime,
                @TotalHours, @Comments, @FileName
            );
        END
    ');
END
GO