SELECT name
FROM person_order po
INNER JOIN menu m
ON po.menu_id = m.id
INNER JOIN person p
ON po.person_id = p.id
WHERE gender = 'female' AND pizza_name = 'pepperoni pizza'
	INTERSECT
	SELECT name
	FROM person_order po
	INNER JOIN menu m
	ON po.menu_id = m.id
	INNER JOIN person p
	ON po.person_id = p.id
	WHERE gender = 'female' AND pizza_name = 'cheese pizza'
ORDER BY 1