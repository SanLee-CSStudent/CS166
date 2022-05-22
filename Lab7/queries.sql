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
SELECT c.color_name AS Color, SUM(n.on_hand) AS total_parts
FROM color c, part_nyc n
WHERE c.color_name = 'Red' AND c.color_id = n.color
GROUP BY Color;
