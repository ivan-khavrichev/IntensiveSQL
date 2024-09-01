SELECT total.name,
	SUM(total.count) AS total_count
	FROM
			((SELECT piz.name,
				COUNT(m.pizzeria_id) AS count
			FROM person_order po
			INNER JOIN menu m
			ON po.menu_id = m.id
			INNER JOIN pizzeria piz
			ON m.pizzeria_id = piz.id
			GROUP BY piz.name)

		UNION ALL

			(SELECT piz.name,
				COUNT(pv.pizzeria_id) AS count
			FROM person_visits pv
			INNER JOIN pizzeria piz
			ON pv.pizzeria_id = piz.id
			GROUP BY piz.name)) total

GROUP BY total.name
ORDER BY 2 DESC, 1 ASC
