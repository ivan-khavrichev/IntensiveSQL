SELECT menu.pizza_name,
	pizzeria.name
FROM person_order
INNER JOIN
	(SELECT name, 
			id
		FROM person 
		WHERE person.name IN ('Anna', 'Denis')) AS p
ON person_order.person_id = p.id
INNER JOIN menu
ON person_order.menu_id = menu.id
INNER JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2