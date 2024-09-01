set enable_seqscan = off;

EXPLAIN ANALYZE
	SELECT m.pizza_name,
		piz.name AS pizzeria_name
	FROM menu m
	JOIN pizzeria piz 
	ON m.pizzeria_id = piz.id;
