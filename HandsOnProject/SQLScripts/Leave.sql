CREATE TABLE dbo.Leave
(
  LeaveID         INT IDENTITY(1,1)   NOT NULL PRIMARY KEY,
  EmployeeID      INT                  NOT NULL,    -- FK to Employee.EmployeeID
  LeaveTypeID     INT                  NOT NULL,    -- FK to LeaveType.LeaveTypeID
  LeaveStart      DATE                 NOT NULL,
  LeaveEnd        DATE                 NOT NULL,
  NumberOfDays    DECIMAL(5,2)         NOT NULL,
  ApprovalFlag    CHAR(1)              NULL,        -- 'Y' or 'N'
  HasSickNote     CHAR(1)              NULL,        -- 'Y' or 'N'
  FileName        NVARCHAR(260)        NOT NULL,
  InsertedAt      DATETIME             NOT NULL 
    CONSTRAINT DF_Leave_InsertedAt DEFAULT(GETDATE())
);

-- FK to Employee
ALTER TABLE dbo.Leave
  ADD CONSTRAINT FK_Leave_Employee
    FOREIGN KEY(EmployeeID) REFERENCES dbo.Employee(EmployeeID);

-- FK to LeaveType
ALTER TABLE dbo.Leave
  ADD CONSTRAINT FK_Leave_LeaveType
    FOREIGN KEY(LeaveTypeID) REFERENCES dbo.LeaveType(LeaveTypeID);
GO
