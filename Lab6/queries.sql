--First query
SELECT s.sname, COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid
GROUP BY s.sname;

--Second query
SELECT s.sname, COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid
GROUP BY s.sname
HAVING COUNT(*) > 3;

--Third query
SELECT s.sname, COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid
GROUP BY s.sname
INTERSECT
SELECT s.sname,  COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid AND s.sname NOT IN(
    SELECT s.sname
    FROM parts p, catalog c, suppliers s
    WHERE p.pid = c.pid AND s.sid = c.sid AND NOT p.color = 'green'
);