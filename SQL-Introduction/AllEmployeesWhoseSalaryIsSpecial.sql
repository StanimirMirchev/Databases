SELECT FirstName + ' ' + MiddleName + ' ' + LastName AS [Persons with special salary]
FROM Employees e
WHERE e.Salary IN (25000,14000,12500,23600)