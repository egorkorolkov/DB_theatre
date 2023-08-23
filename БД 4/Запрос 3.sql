--Подсчитать кол-во постановок для каждого режиссера


SELECT Employee.Name, COUNT(Artistic_direction.Person) as number
FROM Artistic_direction RIGHT JOIN Employee ON Artistic_direction.Person = Employee.Employee_ID
WHERE Employee.Position_ID = 15
GROUP BY Employee.Name


select * from Employee