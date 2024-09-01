SELECT name
FROM person_order
INNER JOIN person
ON person_order.person_id = person.id
INNER JOIN menu
ON person_order.menu_id = menu.id
WHERE gender = 'male' AND address IN ('Moscow', 'Samara') AND pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1 DESC