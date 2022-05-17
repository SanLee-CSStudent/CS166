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
SELECT s.sname AS Suppliers, MAX(p.cost) AS ExpensivePart
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid AND p.color = 'Green'
GROUP BY Suppliers
INTERSECT
SELECT s.sname AS Suppliers
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid AND p.color = 'Red'
GROUP BY Suppliers
