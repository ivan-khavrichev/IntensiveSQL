SELECT p.name,
	m.pizza_name,
	m.price,
	ROUND((1 - pd.discount / 100) * m.price) AS discount_price,
	piz.name AS pizzeria_name
FROM person_order po
INNER JOIN person p
ON po.person_id = p.id
INNER JOIN menu m
ON po.menu_id = m.id
INNER JOIN pizzeria piz
ON m.pizzeria_id = piz.id
INNER JOIN person_discounts pd
ON po.person_id = pd.person_id AND m.pizzeria_id = pd.pizzeria_id
ORDER BY 1, 2;