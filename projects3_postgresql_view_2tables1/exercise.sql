-- DROP SCHEMA nrochotorena;

CREATE SCHEMA nrochotorena AUTHORIZATION datama2mi182;

-- DROP SEQUENCE nrochotorena.employee_id_seq;

CREATE SEQUENCE nrochotorena.employee_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE nrochotorena.training_id_seq;

CREATE SEQUENCE nrochotorena.training_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1
	NO CYCLE;
-- Drop table

-- DROP TABLE nrochotorena.employee;

CREATE TABLE nrochotorena.employee (
	id int4 NOT NULL,
	emp_num int4 NOT NULL,
	emp_fname text NOT NULL,
	emp_lname text NOT NULL,
	emp_initial text NULL,
	emp_address text NULL,
	emp_dob date NULL,
	CONSTRAINT employee_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE nrochotorena.training;

CREATE TABLE nrochotorena.training (
	id int4 NOT NULL,
	trai_num int4 NOT NULL,
	trai_location text NOT NULL,
	trai_num_employee int4 NOT NULL,
	employee_id int4 NULL,
	CONSTRAINT training_pkey PRIMARY KEY (id),
	CONSTRAINT training_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE OR REPLACE VIEW nrochotorena.otm_exercise
AS SELECT employee.id AS employee_id_,
    employee.emp_num,
    employee.emp_fname,
    employee.emp_lname,
    training.id AS training_id,
    training.trai_num,
    training.trai_location,
    training.trai_num_employee,
    training.employee_id
   FROM employee
     JOIN training ON employee.id = training.id;