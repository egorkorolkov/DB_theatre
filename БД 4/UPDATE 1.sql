--��������� ���������� ��������� �� ����� ������, ���� � ��� ��������� �������� ������ ������������ � ���� �� �������� ����� 15 �����

UPDATE Playbill
SET Date = DATEADD (MONTH, 1, Date)
WHERE Performance_ID IN 
(SELECT Playbill.Performance_ID
FROM [Actors&Performers], Employee, List_of_characters, Repertoire
WHERE [Actors&Performers].Soloist_ID = Employee.Employee_ID
AND [Actors&Performers].Character_ID = List_of_characters.Character_ID
AND List_of_characters.Performance_ID = Repertoire.Performance_ID
AND Playbill.Performance_ID = Repertoire.Performance_ID
AND Employee.Name = '�������� ������ ������������'
AND DATEPART(MONTH, Playbill.Date) = 11
AND DATEPART(DAY, Playbill.Date) > 15
);