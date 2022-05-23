--DB Information
--part_nyc(part_number integer, supplier integer, color integer, on_hand integer, descr text)
--part_sfo(part_number integer, supplier integer, color integer, on_hand integer, descr text)
--supplier(supplier_id integer, supplier_name varchar(20));
--color (color_id integer, color_name varchar(20));

--First Query
SELECT COUNT(*) AS Count_On_Hand
FROM part_nyc n
WHERE n.on_hand > 70;

--Second Query
SELECT c.color_name, SUM(n.on_hand) AS total_parts
FROM color c, part_nyc n
WHERE c.color_name = 'Red' AND c.color_id = n.color
GROUP BY c.color_name
UNION
SELECT c1.color_name, SUM(s.on_hand) AS total_parts
FROM color c1, part_sfo s
WHERE c1.color_name = 'Red' AND c1.color_id = s.color
GROUP BY c1.color_name;

--Third Query
--SELECT supp.supplier_name
--FROM supplier supp, part_nyc n
--WHERE supp.supplier_id = n.supplier
--GROUP BY supp.supplier_name
--HAVING SUM(n.on_hand) > (SELECT SUM(s.on_hand)
--    FROM part_sfo s
--    WHERE supp.supplier_id = s.supplier
--);
SELECT supp.supplier_name
FROM supplier supp, part_nyc n
WHERE supp.supplier_id = n.supplier
GROUP By supp.supplier_name
HAVING SUM(n.on_hand) > (
    SELECT SUM(s.on_hand) AS sum
    FROM part_sfo s
    WHERE supp.supplier_id = s.supplier
    GROUP BY supp.supplier_name
);

--Fourth Query
SELECT supp.supplier_name
FROM supplier supp
WHERE supp.supplier_id IN (
    SELECT n.supplier
    FROM part_nyc n
    WHERE NOT EXISTS(SELECT s.part_number
        FROM part_sfo s
        WHERE s.part_number = n.part_number
    )
    GROUP BY n.supplier
);


--Fifth Query???
--UPDATE part_nyc
--SET on_hand - 10;

--Sixth Query???
--DELETE
--FROM part_nyc
--WHERE on_hand < 30;
