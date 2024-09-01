SELECT address,
	ROUND(MAX(CAST(age AS numeric)) - (MIN(CAST(age AS numeric)) / MAX(CAST(age AS numeric))), 2) AS formula,
	ROUND(AVG(age), 2) AS average,
	ROUND(MAX(CAST(age AS numeric)) - (MIN(CAST(age AS numeric)) / MAX(CAST(age AS numeric))), 2) > ROUND(AVG(age), 2) AS comparison
FROM person
GROUP BY 1
ORDER BY 1