--First query
SELECT s.sname, COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid;

--Second query
SELECT s.sname, COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid
HAVING COUNT(*) > 3;

--Third query
SELECT s.sname, COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid
INTERSECT
SELECT s.sname,  COUNT(*) AS PartsNum
FROM parts p, catalog c, suppliers s
WHERE p.pid = c.pid AND s.sid = c.sid AND s.sname NOT IN(
    SELECT s.sname
    FROM parts p, catalog c, suppliers s
    WHERE p.pid = c.pid AND s.sid = c.sid AND NOT p.color = 'green'
);