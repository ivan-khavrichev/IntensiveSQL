SELECT p.address,
	piz.name,
	COUNT(po.menu_id) AS count_of_orders
FROM person_order po
INNER JOIN person p
ON po.person_id = p.id
INNER JOIN menu m
ON po.menu_id = m.id
INNER JOIN pizzeria piz
ON m.pizzeria_id = piz.id
GROUP BY piz.name, p.address
ORDER BY 1, 2
