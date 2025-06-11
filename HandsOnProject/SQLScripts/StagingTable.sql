USE TimesheetDB;
GO

-- Drop the existing staging table if it exists
IF OBJECT_ID('staging.TimesheetStagingFinal', 'U') IS NOT NULL
    DROP TABLE staging.TimesheetStagingFinal;
GO

-- Create the new staging table without surrogate IDs
CREATE TABLE TimesheetStaging
(
    FileName        NVARCHAR(260)   NOT NULL,            -- e.g. 'Siphenathi_May.xlsx'
    EmployeeName    NVARCHAR(100)   NOT NULL,            -- natural key
    ProjectName     NVARCHAR(100)   NOT NULL,
    ActivityName    NVARCHAR(100)   NULL,                -- if applicable
    BillableType    NVARCHAR(50)    NULL,                -- e.g. 'Billable' / 'Non-Billable'
    WorkDate        DATE            NOT NULL,
    DayOfWeek       NVARCHAR(20)    NULL,
    StartTime       TIME            NULL,
    EndTime         TIME            NULL,
    TotalHours      DECIMAL(5,2)    NOT NULL,
    Comments        NVARCHAR(MAX)   NULL,
    LoadedOnUtc     DATETIME2       NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

PRINT 'staging.TimesheetStagingFinal created without surrogate ID columns.';   
