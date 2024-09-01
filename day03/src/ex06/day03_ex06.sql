SELECT m1.pizza_name,
	piz1.name AS pizzeria_name_1,
	piz2.name AS pizzeria_name_2,
	m1.price
FROM menu m1
INNER JOIN menu m2
ON m1.id <> m2.id
INNER join pizzeria piz1
ON m1.pizzeria_id = piz1.id
INNER join pizzeria piz2
ON m2.pizzeria_id = piz2.id
WHERE m1.pizza_name = m2.pizza_name AND m1.price = m2.price and piz1.id > piz2.id
ORDER BY 1