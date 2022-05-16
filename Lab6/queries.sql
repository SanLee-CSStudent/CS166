--First query
SELECT s.sname AS Suppliers, COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid
GROUP BY Suppliers;

--Second query
SELECT s.sname AS Suppliers, COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid
GROUP BY Suppliers
HAVING COUNT(*) > 2;

--Third query
--SELECT s.sname AS Suppliers, COUNT(*) AS PartsNum
--FROM parts p, catalog c, suppliers s
--WHERE p.pid = c.pid AND s.sid = c.sid
--GROUP BY Suppliers
--INTERSECT
--SELECT s.sname,  COUNT(*) AS PartsNum
--FROM parts p, catalog c, suppliers s
--WHERE p.pid = c.pid AND s.sid = c.sid
--GROUP BY s.sname
--EXCEPT
SELECT s.sname
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid AND p.color = 'Green';