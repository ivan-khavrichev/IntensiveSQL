INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT 
      cur_u.name, 
      cur_u.lastname, 
      currency_name, 
      money * rate_to_usd AS currency_in_usd 
      
FROM ( 
SELECT 
        COALESCE("user".name,'not defined') AS name, 
        COALESCE("user".lastname,'not defined') AS lastname, 
        table_c.name AS currency_name, 
        money, 
        COALESCE((
        SELECT rate_to_usd FROM currency table_c 
        WHERE table_b.currency_id = table_c.id AND table_c.updated < table_b.updated 
        ORDER BY table_c.updated DESC LIMIT 1), 
(
SELECT 
rate_to_usd FROM currency table_c 
WHERE table_b.currency_id = table_c.id AND table_c.updated > table_b.updated 
ORDER BY table_c.updated ASC LIMIT 1)) AS rate_to_usd 
FROM balance table_b INNER JOIN (
SELECT table_c.id, table_c.name FROM currency table_c GROUP BY table_c.id, table_c.name) AS table_c ON table_c.id = table_b.currency_id 
LEFT JOIN "user"  ON "user".id = table_b.user_id) AS cur_u 
ORDER BY 1 DESC,2,3;
