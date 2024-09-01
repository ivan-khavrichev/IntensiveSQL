CREATE TABLE person_audit (
    created timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event char(1) DEFAULT 'I' NOT NULL,
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar,
    CONSTRAINT ch_type_event CHECK (type_event = 'I' OR type_event = 'U' OR type_event = 'D')
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS trigger AS $person_insert_audit$
    BEGIN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address) 
        VALUES (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        RETURN NULL;
    END;
$person_insert_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
AFTER INSERT ON person 
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();
    
INSERT INTO person(id,
				   name,
				   age,
				   gender,
				   address) 
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
