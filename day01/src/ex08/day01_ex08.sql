SELECT order_date,
	name || ' (age:' ||age|| ')' as person_information
FROM person_order
NATURAL JOIN
	(SELECT pers.id AS person_id, 
	name,
	 age 
	FROM person pers) AS pers
ORDER BY 1, 2