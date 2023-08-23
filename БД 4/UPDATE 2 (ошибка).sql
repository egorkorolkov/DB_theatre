--ќбновить ID всех дирижеров: увеличить на 300

UPDATE Employee
SET Employee_ID = Employee_ID + 300
WHERE Employee_ID IN 
(SELECT Employee_ID 
FROM Employee, Positions
WHERE Employee.Position_ID = Positions.Position_ID
AND Positions.Name = 'дирижер')