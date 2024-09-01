CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson person.name%TYPE DEFAULT 'Dmitriy',
												  pprice menu.price%TYPE DEFAULT 500,
												  pdate person_visits.visit_date%TYPE DEFAULT '2022-01-08')
RETURNS TABLE(name pizzeria.name%TYPE) AS $person_visits_and_eats$
    SELECT piz.name AS pizzeria_name
	FROM person_visits pv
	INNER JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	INNER JOIN person p
	ON pv.person_id = p.id
	INNER JOIN menu m
	ON piz.id = m.pizzeria_id
	WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate; 
$person_visits_and_eats$ LANGUAGE sql;
