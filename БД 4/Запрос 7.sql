--����������, ���������� ����� ���������� ���� ����� ���������� ��������� ��������� ������

SELECT	Employee.Graduated, COUNT (Employee.Graduated) AS number
FROM Employee
WHERE Awards = '�������� ������ ������'
GROUP BY Employee.Graduated
ORDER BY number DESC;