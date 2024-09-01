SELECT id AS object_id,
	name AS object_name
FROM person
UNION
SELECT id, 
	pizza_name 
FROM menu
ORDER BY 1, 2;
