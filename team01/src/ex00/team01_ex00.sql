WITH last_cur AS 
(SELECT id,
	name,
	MAX(currency.updated) AS last_updated
FROM currency
GROUP BY 1, 2
ORDER BY 1)

SELECT COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	b.type AS type,
	SUM(b.money) AS volume,
	COALESCE(cur.name, 'not defined') AS currency_name,
	COALESCE(cur.rate_to_usd, 1) AS last_rate_to_usd,
	SUM(b.money) * COALESCE(cur.rate_to_usd, 1) AS total_volume_in_usd
FROM balance b
FULL JOIN "user" u 
ON u.id = b.user_id
FULL JOIN (SELECT last_cur.id,
		last_cur.name,
		last_cur.last_updated, 
		c.rate_to_usd
	FROM last_cur
	INNER JOIN currency c
	ON last_cur.id = c.id
	WHERE last_cur.last_updated = c.updated) cur
ON b.currency_id = cur.id
GROUP BY u.name, u.lastname, b.type, cur.name, cur.rate_to_usd
ORDER BY 1 DESC, 2, 3;
