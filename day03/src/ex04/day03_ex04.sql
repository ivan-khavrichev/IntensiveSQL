	(SELECT piz.name AS pizzeria_name
	FROM person_order po
	INNER JOIN person p
	ON po.person_id = p.id
	INNER JOIN menu m
	ON po.menu_id = m.id
	INNER JOIN pizzeria piz
	ON m.pizzeria_id = piz.id 
	WHERE p.gender = 'male'
EXCEPT
	SELECT piz.name AS pizzeria_name
	FROM person_order po
	INNER JOIN person p
	ON po.person_id = p.id
	INNER JOIN menu m
	ON po.menu_id = m.id
	INNER JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
	WHERE p.gender = 'female')
	
UNION

	(SELECT piz.name AS pizzeria_name
	FROM person_order po
	INNER JOIN person p
	ON po.person_id = p.id
	INNER JOIN menu m
	ON po.menu_id = m.id
	INNER JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
	WHERE p.gender = 'female'
EXCEPT
	SELECT piz.name AS pizzeria_name
	FROM person_order po
	INNER JOIN person p
	ON po.person_id = p.id
	INNER JOIN menu m
	ON po.menu_id = m.id
	INNER JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
	WHERE p.gender = 'male')
ORDER BY 1