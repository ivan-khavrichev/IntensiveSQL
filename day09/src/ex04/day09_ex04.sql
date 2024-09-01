CREATE FUNCTION fnc_persons_male()
RETURNS TABLE(id person.id%TYPE,
			 name person.name%TYPE,
			 age person.age%TYPE,
			 gender person.gender%TYPE,
			 address person.address%TYPE) AS $persons_male$
    SELECT id, name, age, gender, address
	FROM person
	WHERE gender = 'male';
$persons_male$ LANGUAGE sql;

CREATE FUNCTION fnc_persons_female()
RETURNS TABLE(id person.id%TYPE,
			 name person.name%TYPE,
			 age person.age%TYPE,
			 gender person.gender%TYPE,
			 address person.address%TYPE) AS $persons_female$
    SELECT id, name, age, gender, address
	FROM person
	WHERE gender = 'female';
$persons_female$ LANGUAGE sql;
