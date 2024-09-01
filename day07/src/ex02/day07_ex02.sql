	(SELECT piz.name,
		COUNT(m.pizzeria_id) AS count,
		'order' AS action_type
	FROM person_order po
	INNER JOIN menu m
	ON po.menu_id = m.id
	INNER JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
	GROUP BY piz.name
	ORDER BY 3 ASC, 2 DESC
	LIMIT 3)

UNION

	(SELECT piz.name,
		COUNT(pv.pizzeria_id) AS count,
		'visit' AS action_type
	FROM person_visits pv
	INNER JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	GROUP BY piz.name
	ORDER BY 3 ASC, 2 DESC
	LIMIT 3)

ORDER BY 3 ASC, 2 DESC;
