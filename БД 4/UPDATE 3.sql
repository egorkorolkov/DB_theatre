--��������� ���� �� �����, ������������� � ������� �����, �� ����������, ���������� � ��-��, �� 200 ���.

UPDATE Prices
SET Price = Price + 200
WHERE ID IN
(SELECT Prices.ID 
FROM Prices, Zones, Periods
WHERE Prices.Zone_ID = Zones.Zone_ID
AND Prices.Period_ID = Periods.ID
AND Periods.Description = '����������� - �������'
AND Zones.Name = '������� ����')