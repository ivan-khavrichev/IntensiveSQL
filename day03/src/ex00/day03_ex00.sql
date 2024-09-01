SELECT m.pizza_name,
	m.price, 
	piz.name AS pizzeria_name,
	pv.visit_date
FROM person_visits pv
INNER JOIN person p
ON pv.person_id = p.id
INNER JOIN pizzeria piz
ON pv.pizzeria_id = piz.id
INNER JOIN menu m
ON piz.id = m.pizzeria_id
WHERE m.price BETWEEN 800 AND 1000 AND p.name = 'Kate'
ORDER BY 1, 2, 3
