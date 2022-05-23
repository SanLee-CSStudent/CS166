DROP INDEX IF EXISTS index_supplier;
DROP INDEX IF EXISTS index_nyc;
DROP INDEX IF EXISTS index_sfo;

CREATE INDEX index_supplier 
ON supplier 
USING BTREE
(supplier_name, supplier_id);
CREATE INDEX index_nyc 
ON part_nyc 
USING BTREE
(part_number, supplier, on_hand);
CREATE INDEX index_sfo 
ON part_sfo 
USING BTREE
(part_number, supplier, on_hand);