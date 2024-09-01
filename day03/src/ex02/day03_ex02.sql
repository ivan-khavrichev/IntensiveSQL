	SELECT m1.pizza_name,
		m1.price,
		piz1.name AS pizzeria_name
	FROM menu m1
	INNER JOIN pizzeria piz1
	ON m1.pizzeria_id = piz1.id
EXCEPT
	SELECT m2.pizza_name,
		m2.price,
		piz2.name AS pizzeria_name
	FROM menu m2
	INNER JOIN person_order po
	ON po.menu_id = m2.id
	INNER JOIN pizzeria piz2
	ON m2.pizzeria_id = piz2.id
ORDER BY 1, 2