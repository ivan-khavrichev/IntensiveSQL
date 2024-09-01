CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT piz.name AS pizzeria_name
FROM person_visits pv
INNER JOIN person p
ON pv.person_id = p.id
INNER JOIN pizzeria piz
ON pv.pizzeria_id = piz.id
INNER JOIN menu m
ON m.pizzeria_id = piz.id
WHERE price < 800 AND p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
