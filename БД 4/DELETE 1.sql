--Удалить спекакли с участием Зайцевой Елены Геннадьевны

SELECT Repertoire.Performance_ID, Employee.Employee_ID, List_of_characters.Name
FROM Repertoire, Employee, List_of_characters, [Actors&Performers]
WHERE [Actors&Performers].Character_ID = List_of_characters.Character_ID
AND [Actors&Performers].Soloist_ID = Employee.Employee_ID
AND List_of_characters.Performance_ID = Repertoire.Performance_ID
AND Employee.Name = 'Зайцева Елена Геннадьевна'

DELETE FROM Repertoire
WHERE Performance_ID IN
(SELECT Repertoire.Performance_ID 
FROM Repertoire, Employee, List_of_characters, [Actors&Performers]
WHERE [Actors&Performers].Character_ID = List_of_characters.Character_ID
AND [Actors&Performers].Soloist_ID = Employee.Employee_ID
AND List_of_characters.Performance_ID = Repertoire.Performance_ID
AND Employee.Name = 'Зайцева Елена Геннадьевна');

SELECT Repertoire.Performance_ID, Employee.Employee_ID, List_of_characters.Name
FROM Repertoire, Employee, List_of_characters, [Actors&Performers]
WHERE [Actors&Performers].Character_ID = List_of_characters.Character_ID
AND [Actors&Performers].Soloist_ID = Employee.Employee_ID
AND List_of_characters.Performance_ID = Repertoire.Performance_ID
AND Employee.Name = 'Зайцева Елена Геннадьевна'