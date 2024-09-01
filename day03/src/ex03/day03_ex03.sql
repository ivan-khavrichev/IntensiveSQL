	(SELECT piz.name AS pizzeria_name
	FROM person_visits pv 
	INNER JOIN person p
	ON pv.person_id = p.id
	INNER JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	WHERE p.gender = 'male'
EXCEPT ALL
	SELECT piz.name AS pizzeria_name
	FROM person_visits pv 
	INNER JOIN person p
	ON pv.person_id = p.id
	INNER JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	WHERE p.gender = 'female')
	
UNION ALL

	(SELECT piz.name AS pizzeria_name
	FROM person_visits pv 
	INNER JOIN person p
	ON pv.person_id = p.id
	INNER JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	WHERE p.gender = 'female'
EXCEPT ALL
	SELECT piz.name AS pizzeria_name
	FROM person_visits pv 
	INNER JOIN person p
	ON pv.person_id = p.id
	INNER JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	WHERE p.gender = 'male')
ORDER BY 1