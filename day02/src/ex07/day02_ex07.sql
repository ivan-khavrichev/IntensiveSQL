SELECT pizzeria.name
AS pizzeria_name

FROM person_visits
INNER JOIN person
ON person_visits.person_id = person.id
INNER JOIN pizzeria
ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN menu
ON menu.pizzeria_id = pizzeria.id
WHERE price < 800 AND person.name = 'Dmitriy' AND person_visits.visit_date = '2022-01-08'