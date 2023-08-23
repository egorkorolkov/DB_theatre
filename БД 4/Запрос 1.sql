--Выбрать самого молодого артиста, играющего в мюзиклах-проектах

SELECT Employee.Name, Birth_date
FROM [Actors&Performers], Employee, List_of_characters, Repertoire, Types
WHERE [Actors&Performers].Soloist_ID = Employee.Employee_ID
AND [Actors&Performers].Character_ID = List_of_characters.Character_ID
AND List_of_characters.Performance_ID = Repertoire.Performance_ID
AND Repertoire.Type_ID = Types.Type_ID
AND Types.Type_ID = 1
AND Birth_date =   (SELECT MAX(Birth_date)
					FROM [Actors&Performers], Employee, List_of_characters, Repertoire, Types
					WHERE [Actors&Performers].Soloist_ID = Employee.Employee_ID
					AND [Actors&Performers].Character_ID = List_of_characters.Character_ID
					AND List_of_characters.Performance_ID = Repertoire.Performance_ID
					AND Repertoire.Type_ID = Types.Type_ID
					AND Types.Type_ID = 1);
