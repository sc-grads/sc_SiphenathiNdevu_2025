USE TimesheetDB;
GO

IF OBJECT_ID('dbo.Leave','U') IS NOT NULL
  DROP TABLE dbo.Leave;
GO

CREATE TABLE dbo.Leave
(
  LeaveID        INT IDENTITY(1,1)   NOT NULL PRIMARY KEY,
  EmployeeID     INT                  NOT NULL,  -- FK → Employee.EmployeeID
  ActivityID     INT                  NOT NULL,  -- reuse Activity.ActivityID for LeaveType
  LeaveStart     DATE                 NOT NULL,
  LeaveEnd       DATE                 NOT NULL,
  NumberOfDays   DECIMAL(5,2)         NOT NULL,
  ApprovalFlag   CHAR(1)              NULL,      -- 'Y' / 'N'
  HasSickNote    CHAR(1)              NULL,      -- 'Y' / 'N'
  FileName       NVARCHAR(260)        NOT NULL,
  InsertedAt     DATETIME             NOT NULL 
    CONSTRAINT DF_Leave_InsertedAt DEFAULT(GETDATE()),

  CONSTRAINT FK_Leave_Employee 
    FOREIGN KEY(EmployeeID) REFERENCES dbo.Employee(EmployeeID),

  CONSTRAINT FK_Leave_Activity
    FOREIGN KEY(ActivityID) REFERENCES dbo.Activity(ActivityID)
);
GO
