
CREATE TABLE departments
(
	dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employees
(
	emp_no INT NOT NULL PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(1),
	hire_date DATE
);

CREATE TABLE dept_emp
(
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL REFERENCES departments(dept_no),
	from_date DATE ,
	to_date DATE,
	PRIMARY KEY (emp_no, from_date,to_date)
);

CREATE TABLE dept_manager
(
	dept_no VARCHAR(4) NOT NULL REFERENCES departments(dept_no),
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (dept_no, from_date,to_date)
);



CREATE TABLE salaries
(
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	salary NUMERIC(18,2),
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (emp_no, from_date,to_date)
);

CREATE TABLE titles
(
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	title VARCHAR(50),
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (emp_no, from_date,to_date)
);

