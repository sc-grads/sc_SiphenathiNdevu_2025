USE TimesheetDB;
GO

CREATE TABLE dbo.ErrorLog
(
  ErrorLogID    INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  PackageName   NVARCHAR(100)   NOT NULL,   -- e.g. LoadLeaveStaging.dtsx
  TaskName      NVARCHAR(100)   NOT NULL,   -- Data Flow Task name
  ComponentName NVARCHAR(100)   NOT NULL,   -- e.g. Conditional Split
  RowData       NVARCHAR(MAX)   NULL,       -- Serialized row text (optional)
  ErrorCode     INT             NULL,       -- DTS or SQL error code
  ErrorMessage  NVARCHAR(4000)  NULL,       -- Full error text
  FileName      NVARCHAR(260)   NULL,       -- Source file if relevant
  OccurredAt    DATETIME        NOT NULL DEFAULT(GETDATE())
);
GO
