--Problem 4.Create a stored procedure that uses the function from the previous example.
--Your task is to create a stored procedure that uses the function from the previous example to give an interest to a person's account for one month.
-- It should take the AccountId and the interest rate as parameters.


USE Bank
GO
CREATE PROC usp_InterestOverAccounts 
@accountId INT, @interestRate FLOAT
AS
	SELECT a.Balance,
			dbo.ufn_CalcSum(a.Balance, @interestRate, 1) AS [Interest]
	FROM Accounts a
	WHERE a.AccountsId = @accountId
GO

EXEC dbo.usp_InterestOverAccounts	@accountId = 1,
									@interestRate = 0.3

