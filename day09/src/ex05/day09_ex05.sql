DROP FUNCTION fnc_persons_male;
DROP FUNCTION fnc_persons_female;

CREATE FUNCTION fnc_persons(pgender person.gender%TYPE DEFAULT 'female')
RETURNS TABLE(id person.id%TYPE,
			 name person.name%TYPE,
			 age person.age%TYPE,
			 gender person.gender%TYPE,
			 address person.address%TYPE) AS $persons$
    SELECT id, name, age, gender, address
	FROM person
	WHERE gender = pgender;
$persons$ LANGUAGE sql;
