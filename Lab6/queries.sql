--First query
SELECT s.sname, COUNT(c.pid) AS 'Number of Parts'
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid;