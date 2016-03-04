--Problem 6.Create table Logs.
--Create another table – Logs (LogID, AccountID, OldSum, NewSum). 
--Add a trigger to the Accounts table that enters a new entry into the Logs table every time the sum on an account changes.



Use Bank
GO

ALTER TABLE Logs(
LogId INT PRIMARY KEY IDENTITY NOT NULL,
AccountId INT FOREIGN KEY REFERENCES Accounts(AccountsId) NOT NULL,
OldSum MONEY NOT NULL,
NewSum MONEY NOT NULL
)
GO
ALTER TRIGGER tg_ChangeBalance ON Accounts FOR UPDATE
AS
INSERT INTO Logs(AccountId, OldSum, NewSum)
SELECT d.AccountsId, d.Balance, i.Balance
FROM INSERTED i
INNER JOIN DELETED d
ON d.AccountsId = i.AccountsId
GO