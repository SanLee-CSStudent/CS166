--DB Information
--part_nyc(part_number integer, supplier integer, color integer, on_hand integer, descr text)
--part_sfo(part_number integer, supplier integer, color integer, on_hand integer, descr text)
--supplier(supplier_id integer, supplier_name varchar(20));
--color (color_id integer, color_name varchar(20));

--First Query
SELECT n.part_number AS Part_ID, COUNT(*) AS Count_On_Hand
FROM part_nyc n
WHERE n.on_hand > 70
GROUP BY Part_ID;

--Second Query
SELECT c.color_name AS NYC_Color, SUM(n.on_hand) AS total_parts
FROM color c, part_nyc n
WHERE c.color_name = 'Red' AND c.color_id = n.color
GROUP BY NYC_Color
UNION
SELECT c.color_name AS SFO_Color, SUM(s.on_hand) AS total_parts
FROM color c, part_sfo s
WHERE c.color_name = 'Red' AND c.color_id = s.color
GROUP BY SFO_Color;

--Third Query
SELECT supp.supplier_name, 
FROM supplier supp, part_nyc n
WHERE supp.supplier_id = n.supplier
HAVING SUM(n.on_hand) > (SELECT SUM(s.on_hand)
    FROM supplier supp, part_sfo s
    WHERE supp.supplier_id = s.supplier
);

--Fourth Query


--Fifth Query???
UPDATE part_nyc
SET on_hand - 10;

--Sixth Query???
DELETE
FROM part_nyc
WHERE on_hand < 30;
