SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN	

INSERT INTO Employee VALUES ((SELECT MAX(Employee_ID)+1 FROM Employee),'�������� ����� ����������', '�', '�������� ������ ������', '1995-09-11', '����', '2011-01-03', 1, 1);

COMMIT