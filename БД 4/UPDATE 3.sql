--Увеличить цены на места, расположенные в красном поясе, на спектаклях, проходящих в пн-чт, на 200 руб.

UPDATE Prices
SET Price = Price + 200
WHERE ID IN
(SELECT Prices.ID 
FROM Prices, Zones, Periods
WHERE Prices.Zone_ID = Zones.Zone_ID
AND Prices.Period_ID = Periods.ID
AND Periods.Description = 'понедельник - четверг'
AND Zones.Name = 'красный пояс')