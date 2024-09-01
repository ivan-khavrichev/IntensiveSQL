INSERT INTO person_discounts
SELECT ROW_NUMBER() OVER(ORDER BY po.person_id, m.pizzeria_id) AS id,
	po.person_id,
	m.pizzeria_id,
	CASE 
		WHEN COUNT(po.person_id) = 1
		THEN 10.5
		WHEN COUNT(po.person_id) = 2
		THEN 22
		ELSE 30 END AS discount
FROM person_order po
INNER JOIN 
	(SELECT menu.id, 
	 	menu.pizzeria_id
	FROM menu) AS m
ON po.menu_id = m.id
GROUP BY 2, 3;
