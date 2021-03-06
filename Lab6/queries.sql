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
SELECT s.sname AS Suppliers, COUNT(p.pid) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid AND s.sname IN(
    SELECT s.sname AS Suppliers
    FROM suppliers s
    WHERE s.sname NOT IN (
        SELECT s.sname
        FROM parts p, catalog c, suppliers s
        WHERE p.pid = c.pid AND s.sid = c.sid AND NOT p.color = 'Green'
        GROUP BY s.sname)
    GROUP BY Suppliers
)
GROUP BY Suppliers;

--Fourth query
SELECT s.sname AS Suppliers, MAX(c.cost) AS ExpensivePart
FROM catalog c, suppliers s
WHERE s.sid = c.sid AND s.sname IN (
    SELECT s.sname AS Suppliers
    FROM parts p, catalog c, suppliers s
    WHERE p.pid = c.pid AND s.sid = c.sid AND p.color = 'Green'
    GROUP BY Suppliers
    INTERSECT
    SELECT s.sname AS Suppliers
    FROM parts p, catalog c, suppliers s
    WHERE p.pid = c.pid AND s.sid = c.sid AND p.color = 'Red'
    GROUP BY Suppliers
)
GROUP BY Suppliers;

--Fifth query
--SELECT p.pname, c.cost
--FROM catalog c, parts p
--WHERE c.pid = p.pid AND cost < 10;

--Sixth query
--SELECT s.address AS Address, p.pname AS Part
--FROM catalog c, parts p, suppliers s
--WHERE c.pid = p.pid AND c.sid = s.sid AND p.pname = ''
--GROUP BY Address;