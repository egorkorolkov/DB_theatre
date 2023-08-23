--Удалить Зайцеву Елену Геннадьевну из базы

SELECT * FROM Employee
WHERE Employee.Name = 'Зайцева Елена Геннадьевна'

DELETE FROM Employee
WHERE Employee.Name = 'Зайцева Елена Геннадьевна'

SELECT * FROM Employee
WHERE Employee.Name = 'Зайцева Елена Геннадьевна'
