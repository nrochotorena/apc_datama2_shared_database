-- Drop table

-- DROP TABLE "MI182_nrochotorena".employee;

CREATE TABLE "MI182_nrochotorena".employee (
	id int4 NOT NULL,
	emp_num int4 NOT NULL,
	emp_fname text NOT NULL,
	emp_lname text NOT NULL,
	emp_initial text NOT NULL,
	emp_address text NOT NULL,
	emp_dob date NOT NULL,
	CONSTRAINT employee_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE "MI182_nrochotorena".employee OWNER TO datama2mi182;
GRANT ALL ON TABLE "MI182_nrochotorena".employee TO datama2mi182;

-- Drop table

-- DROP TABLE "MI182_nrochotorena".training;

CREATE TABLE "MI182_nrochotorena".training (
	id int4 NOT NULL,
	trai_num int4 NOT NULL,
	trai_location text NOT NULL,
	trai_num_employee int4 NOT NULL,
	employee_id int4 NOT NULL,
	CONSTRAINT training_pkey PRIMARY KEY (id),
	CONSTRAINT training_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES employee(id)
);

-- Permissions

ALTER TABLE "MI182_nrochotorena".training OWNER TO datama2mi182;
GRANT ALL ON TABLE "MI182_nrochotorena".training TO datama2mi182;

INSERT INTO MI182_NROCHOTORENA.EMPLOYEE
(ID, EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_INITIAL, EMP_ADDRESS, EMP_DOB)
VALUES(1, 2019000, 'Albert', 'Yao', 'A', 'Taguig City', '1996-10-25');
  
INSERT INTO MI182_NROCHOTORENA.EMPLOYEE
(ID, EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_INITIAL, EMP_ADDRESS, EMP_DOB)
VALUES(2, 2019001, 'Bianca', 'Yu', 'B', 'Pasay City', '1993-05-20');

INSERT INTO MI182_NROCHOTORENA.TRAINING
(ID, TRAI_NUM, TRAI_LOCATION, TRAI_NUM_EMPLOYEE, EMPLOYEE_ID)
VALUES(1, 19000, 'Makati City', 2019000, 1);

INSERT INTO MI182_NROCHOTORENA.TRAINING
(ID, TRAI_NUM, TRAI_LOCATION, TRAI_NUM_EMPLOYEE, EMPLOYEE_ID)
VALUES(2, 19001, 'Makati City', 2019001, 2);

create or replace procedure updateCity(empid int,city character varying(50))
LANGUAGE plpgsql
AS $$
BEGIN
update training
set trai_location = city
where trai_num_employee = empid;
commit;
end;
$$;
