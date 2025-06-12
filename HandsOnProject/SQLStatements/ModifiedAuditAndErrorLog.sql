IF OBJECT_ID('dbo.ErrorLog','U')     IS NOT NULL DROP TABLE dbo.ErrorLog;
IF OBJECT_ID('dbo.AuditLog','U')     IS NOT NULL DROP TABLE dbo.AuditLog;
GO

CREATE TABLE dbo.AuditLog
(
    -- surrogate key for each package‐run batch
    BatchID       INT IDENTITY(1,1) NOT NULL 
        CONSTRAINT PK_AuditLog_BatchID PRIMARY KEY,
    
    PackageName   NVARCHAR(100)   NOT NULL,   -- e.g. 'LeaveStaging.dtsx'
    TaskName      NVARCHAR(100)   NOT NULL,   -- e.g. 'Load Leave Staging'
    TableName     NVARCHAR(100)   NOT NULL,   -- e.g. 'LeaveStaging'
    
    RunStartUtc   DATETIME2(7)    NOT NULL 
        CONSTRAINT DF_AuditLog_RunStartUtc DEFAULT (SYSUTCDATETIME()),
    RunEndUtc     DATETIME2(7)    NULL,        -- populated at package end
    
    RowsLoaded    INT             NULL,        -- optional: how many rows you inserted
    ErrorCount    INT             NULL,        -- optional: total error rows
    RunStatus     NVARCHAR(20)    NULL,        -- ‘Started’ / ‘Succeeded’ / ‘Failed’
    
    ExecutedBy    NVARCHAR(100)   NOT NULL     -- e.g. SYSTEM_USER() or Env::USERNAME
);
GO

CREATE TABLE dbo.ErrorLog
(
    ErrorLogID     INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_ErrorLog_ErrorLogID PRIMARY KEY,

    BatchID        INT            NOT NULL
        CONSTRAINT FK_ErrorLog_AuditLog_BatchID
        FOREIGN KEY REFERENCES dbo.AuditLog(BatchID),

    ErrorTimeUtc   DATETIME2(7)   NOT NULL
        CONSTRAINT DF_ErrorLog_ErrorTimeUtc DEFAULT (SYSUTCDATETIME()),

    ComponentName  NVARCHAR(100)  NOT NULL,   -- e.g. 'Lookup ActivityID'
    ErrorMessage   NVARCHAR(MAX)  NOT NULL,   -- the SSIS or manual message
    RowKey         NVARCHAR(200)  NULL        -- e.g. business key or entire row CSV
);
GO
