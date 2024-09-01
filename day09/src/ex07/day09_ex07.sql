CREATE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS numeric AS $minimum$
    SELECT  min($1[i]) FROM generate_subscripts($1, 1) g(i);
$minimum$ LANGUAGE sql;
