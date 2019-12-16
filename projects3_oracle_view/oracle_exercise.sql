CREATE TABLE MI182_NROCHOTORENA.employee (
	id number,
	emp_num NUMBER NOT null,
	emp_fname varchar2(50) NOT null,
	emp_lname varchar2(50) NOT null,
	emp_initial varchar2(1) NOT null,
	emp_address varchar2(200) NOT null,
	emp_dob DATE NOT null,
	CONSTRAINT employee_pkey PRIMARY KEY (id)
);

CREATE TABLE MI182_NROCHOTORENA.training (
	id NUMBER,
	trai_num NUMBER NOT NULL,
	trai_location varchar2(200) NOT NULL,
	trai_num_employee number NOT NULL,
	employee_id number NOT null,
	CONSTRAINT training_pkey PRIMARY KEY (id),
	CONSTRAINT training_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE OR REPLACE VIEW MI182_NROCHOTORENA.otm_exercise
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
    
ALTER USER MI182_NROCHOTORENA quota unlimited ON USERS;   
    
    
INSERT INTO MI182_NROCHOTORENA.EMPLOYEE
(ID, EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_INITIAL, EMP_ADDRESS, EMP_DOB)
VALUES(1, 2019000, 'Albert', 'Yao', 'A', 'Taguig City', '25-OCT-96');
  
INSERT INTO MI182_NROCHOTORENA.EMPLOYEE
(ID, EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_INITIAL, EMP_ADDRESS, EMP_DOB)
VALUES(2, 2019001, 'Bianca', 'Yu', 'B', 'Pasay City', '20-MAY-93');

INSERT INTO MI182_NROCHOTORENA.TRAINING
(ID, TRAI_NUM, TRAI_LOCATION, TRAI_NUM_EMPLOYEE, EMPLOYEE_ID)
VALUES(1, 19000, 'Makati City', 2019000, 1);

INSERT INTO MI182_NROCHOTORENA.TRAINING
(ID, TRAI_NUM, TRAI_LOCATION, TRAI_NUM_EMPLOYEE, EMPLOYEE_ID)
VALUES(2, 19001, 'Makati City', 2019001, 2);
   
CREATE OR REPLACE VIEW MI182_NROCHOTORENA.otm_exercise
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