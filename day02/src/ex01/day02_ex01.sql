SELECT gs::date AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs
LEFT JOIN (SELECT *
		  	FROM person_visits
		  	WHERE person_id = 1 OR person_id = 2) pv
ON gs = pv.visit_date
WHERE pv.id IS NULL
ORDER BY 1