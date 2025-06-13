IF OBJECT_ID('dbo.ErrorLog','U')     IS NOT NULL DROP TABLE dbo.ErrorLog;
IF OBJECT_ID('dbo.AuditLog','U')     IS NOT NULL DROP TABLE dbo.AuditLog;
GO

IF OBJECT_ID('dbo.AuditLog', 'U') IS NOT NULL
    DROP TABLE dbo.AuditLog;
GO

CREATE TABLE dbo.AuditLog
(
    AuditLogID     INT             IDENTITY(1,1) NOT NULL
                  CONSTRAINT PK_AuditLog PRIMARY KEY,
    PackageName    NVARCHAR(100)   NOT NULL,    -- e.g. 'TimesheetStaging.dtsx'
    TaskName       NVARCHAR(100)   NOT NULL,    -- e.g. 'Data Flow Task'
    TableName      NVARCHAR(100)   NOT NULL,    -- e.g. 'Stg_Monthly'
    RowsLoaded     INT             NOT NULL,
    RunDate        DATETIME2(7)    NOT NULL
                  CONSTRAINT DF_AuditLog_RunDate DEFAULT SYSUTCDATETIME(),
    ExecutedBy     NVARCHAR(100)   NOT NULL,    -- e.g. domain\username
    EmployeeName   NVARCHAR(100)   NULL,        -- from Stg_Months.EmployeeName
    FileName       NVARCHAR(260)   NULL         -- the actual file name processed
);
GO



CREATE TABLE dbo.ErrorLog (
    ErrorLogID     INT IDENTITY(1,1) PRIMARY KEY,
    PackageName    VARCHAR(255),
    TaskName       VARCHAR(255),
    ErrorMessage   NVARCHAR(MAX),
    ErrorTime      DATETIME DEFAULT GETUTCDATE(),
    FileName       VARCHAR(255),        -- optional, useful if error tied to file
    EmployeeName   VARCHAR(255),        -- optional, if error tied to person
    TableName      VARCHAR(255),        -- optional, for context (Timesheet, Leave, etc.)
    ExecutedBy     VARCHAR(255)         -- useful for logging who triggered it
);
