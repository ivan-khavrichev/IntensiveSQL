	SELECT piz.name AS pizzeria_name
	FROM person_visits pv 
	INNER JOIN person p
	ON pv.person_id = p.id
	INNER JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	WHERE p.name = 'Andrey'
EXCEPT
	SELECT piz.name AS pizzeria_name
	FROM person_order po
	INNER JOIN person p
	ON po.person_id = p.id
	INNER JOIN menu m
	ON po.menu_id = m.id
	INNER JOIN pizzeria piz
	ON m.pizzeria_id = piz.id 
	WHERE p.name = 'Andrey'
ORDER BY 1