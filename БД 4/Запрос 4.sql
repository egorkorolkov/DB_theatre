--Вывести список актеров, окончивших ГИТИС, которые моложе 60, участвующих менее, чем в пяти спектаклях

WITH number_of_performances(number, Employee_ID)
AS(
SELECT DISTINCT COUNT (Repertoire.Performance_ID) AS number, Employee.Employee_ID
FROM Repertoire, Employee, [Actors&Performers], List_of_characters
WHERE [Actors&Performers].Soloist_ID = Employee.Employee_ID
AND [Actors&Performers].Character_ID = List_of_characters.Character_ID
AND List_of_characters.Performance_ID = Repertoire.Performance_ID
GROUP BY Employee.Employee_ID
)

SELECT DISTINCT Employee.Name, DATEDIFF(YEAR, Employee.Birth_date, SYSDATETIME()) AS AGE, Repertoire.Name
FROM Repertoire, Employee, [Actors&Performers], List_of_characters, number_of_performances
WHERE [Actors&Performers].Soloist_ID = Employee.Employee_ID
AND [Actors&Performers].Character_ID = List_of_characters.Character_ID
AND List_of_characters.Performance_ID = Repertoire.Performance_ID
AND number_of_performances.Employee_ID = Employee.Employee_ID
AND DATEDIFF(YEAR, Employee.Birth_date, SYSDATETIME()) < 60
AND Graduated = 'ГИТИС'
AND number_of_performances.number < 5;