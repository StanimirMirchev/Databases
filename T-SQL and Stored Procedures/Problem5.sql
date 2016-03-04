--Problem 5.Add two more stored procedures WithdrawMoney and DepositMoney.
--Add two more stored procedures WithdrawMoney (AccountId, money) and DepositMoney (AccountId, money) that operate in transactions.



USE Bank
GO
ALTER PROC usp_WithdrawMoney (@accountId INT, @money MONEY)
AS
	DECLARE @currentMoney MONEY 
	SELECT @currentMoney = Balance
	FROM Accounts 
	WHERE AccountsId = @accountId

	IF (@currentMoney < @money)
	BEGIN
		 RAISERROR ('The amount must be positive.', 16, 1)	
	END
	IF ((@currentMoney - @money) >= 0)
	BEGIN
		UPDATE Accounts 
		SET Accounts.Balance = (Balance - @money)
		WHERE AccountsId = @accountId
	END

		
GO

EXEC dbo.usp_WithdrawMoney 4,30

SELECT * FROM Accounts

GO
ALTER PROC usp_DepositMoney (@accountId INT, @money MONEY)
AS
	DECLARE @currentMoney MONEY 
	SELECT @currentMoney = Balance
	FROM Accounts 
	WHERE AccountsId = @accountId

		UPDATE Accounts 
		SET Accounts.Balance = (Balance + @money)
		WHERE AccountsId = @accountId

GO

EXEC dbo.usp_DepositMoney 5, 250

SELECT * FROM Accounts