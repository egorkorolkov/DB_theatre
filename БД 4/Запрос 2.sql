--¬ывести даты, когда играет каждый актер

SELECT Employee.Name, Playbill.Date
FROM Employee, Playbill, [Actors&Performers], List_of_characters, Repertoire
WHERE [Actors&Performers].Soloist_ID = Employee.Employee_ID
AND [Actors&Performers].Character_ID = List_of_characters.Character_ID
AND List_of_characters.Performance_ID = Repertoire.Performance_ID
AND Playbill.Performance_ID = Repertoire.Performance_ID
GROUP BY Employee.Name, Playbill.Date;