--First query
SELECT p.pid
FROM parts p, catalog c
WHERE p.pid = c.pid AND c.cost < 10;

--Second query
SELECT p.pname
FROM parts p, catalog c
WHERE p.pid = c.pid AND c.cost < 10;

--Third query
SELECT s.address
FROM suppliers s, parts p, catalog c
WHERE s.sid = c.sid AND c.pid = p.pid AND p.pname = 'Fire Hydrant Cap';

--Fourth query
SELECT s.sname
FROM suppliers s, parts p, catalog c
WHERE s.sid = c.sid AND c.pid = p.pid AND p.color = 'Green';

--Fifth query
SELECT s.sname, p.pname
FROM suppliers s, parts p, catalog c
WHERE s.sid = c.sid AND c.pid = p.pid;