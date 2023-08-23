--ќпределить актера, играющего больше всего ролей

SELECT TOP 1 Employee.Name, COUNT (Employee.Name) AS NUM
FROM [Actors&Performers], Employee, List_of_characters, Repertoire
WHERE [Actors&Performers].Soloist_ID = Employee.Employee_ID
AND [Actors&Performers].Character_ID = List_of_characters.Character_ID
AND List_of_characters.Performance_ID = Repertoire.Performance_ID
GROUP BY Employee.Name
ORDER BY NUM DESC;