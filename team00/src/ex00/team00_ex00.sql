CREATE TABLE nodes
(
	point1 VARCHAR,
	point2 VARCHAR,
	cost INT
);

INSERT INTO nodes VALUES
	('a', 'b', 10),
	('b', 'a', 10),
	
	('a', 'd', 20),
	('d', 'a', 20),
	
	('a', 'c', 15),
	('c', 'a', 15),
	
	('b', 'd', 25),
	('d', 'b', 25),
	
	('b', 'c', 35),
	('c', 'b', 35),
	
	('c', 'd', 30),
	('d', 'c', 30);


WITH RECURSIVE recursive_table AS (SELECT point1,
	point2,
	cost,
	point1::bpchar AS path,
	cost AS sum
	FROM nodes
	WHERE point1 = 'a'

	UNION ALL

	SELECT nodes.point1,
		nodes.point2,
		recursive_table.cost,
		CONCAT(recursive_table.path, ',', recursive_table.point2) AS path,
		recursive_table.sum + nodes.cost AS sum
	FROM nodes
	INNER JOIN recursive_table  
	ON nodes.point1 = recursive_table.point2
	WHERE path NOT LIKE CONCAT('%', recursive_table.point2, '%'))

SELECT sum AS total_cost,
	CONCAT ('{', path, ',', recursive_table.point2, '}') AS tour
FROM recursive_table
WHERE length(path) = 7 AND point2 = 'a' 
	AND sum = (SELECT min(sum)
	FROM recursive_table
	WHERE length(path) = 7 AND point2 = 'a')
ORDER BY 1, 2;
