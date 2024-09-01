SELECT COALESCE(person.name, '-') AS person_name,
		pv.visit_date,
		COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (SELECT *
	  	FROM person_visits pv
		WHERE pv.visit_date = '2022-01-01' OR pv.visit_date = '2022-01-02' OR pv.visit_date = '2022-01-03') pv
FULL JOIN person
ON person.id = pv.person_id
FULL JOIN pizzeria
ON pv.pizzeria_id = pizzeria.id
ORDER BY 1, 2, 3