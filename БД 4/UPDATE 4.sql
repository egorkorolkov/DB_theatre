--замените Голубева Александра Алексеевича на Мишле Виталия Валерьяновича во всех спектаклях
begin tran

insert into Employee (employee_id,name,Position_ID,department_id) values((SELECT MAX(Employee.Employee_ID) + 1 FROM Employee),'Голубев Александр Алексеевич',1,1)

------
insert into Employee (employee_id,name,Position_ID,department_id) values((SELECT MAX(Employee.Employee_ID) + 1 FROM Employee),'Голубев Александр Алексеевич',1,1)

UPDATE [Actors&Performers]
SET Soloist_ID =
(SELECT Employee.Employee_ID
FROM Employee
WHERE Employee.Name = 'Мишле Виталий Валерьянович')
WHERE Soloist_ID =
(SELECT TOP 1 Employee.Employee_ID
FROM Employee
WHERE Employee.Name = 'Голубев Александр Алексеевич');

rollback