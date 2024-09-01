CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

set enable_seqscan = off;

EXPLAIN ANALYZE
	SELECT *
	FROM menu
	WHERE pizzeria_id = 2 AND pizza_name = 'mushroom pizza';
	