--�������� �������� ���������� ����������� �� ����� ������� ������������� �� ���� ����������
begin tran

insert into Employee (employee_id,name,Position_ID,department_id) values((SELECT MAX(Employee.Employee_ID) + 1 FROM Employee),'������� ��������� ����������',1,1)

------
insert into Employee (employee_id,name,Position_ID,department_id) values((SELECT MAX(Employee.Employee_ID) + 1 FROM Employee),'������� ��������� ����������',1,1)

UPDATE [Actors&Performers]
SET Soloist_ID =
(SELECT Employee.Employee_ID
FROM Employee
WHERE Employee.Name = '����� ������� ������������')
WHERE Soloist_ID =
(SELECT TOP 1 Employee.Employee_ID
FROM Employee
WHERE Employee.Name = '������� ��������� ����������');

rollback