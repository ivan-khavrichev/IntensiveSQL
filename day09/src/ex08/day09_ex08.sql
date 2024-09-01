CREATE FUNCTION fnc_fibonacci(pstop bigint DEFAULT 10)
RETURNS TABLE(fibonacci_numbers bigint) AS $fibonacci$
    WITH RECURSIVE fibonacci(x1, x2) AS
		(VALUES(0,1)
		
		UNION ALL
		
		SELECT greatest(x1, x2), x1 + x2 AS x1
		FROM fibonacci
		WHERE x2 < pstop)
	SELECT x1
	FROM fibonacci;
$fibonacci$ LANGUAGE sql;
