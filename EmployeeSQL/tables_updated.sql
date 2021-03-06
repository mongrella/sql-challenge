-- Create departments table

DROP TABLE departments;

CREATE TABLE departments (
  dept_no VARCHAR(30),
  dept_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

--Create employees table

DROP TABLE employees;

CREATE TABLE employees (
	emp_no VARCHAR(30) NOT NULL,
	emp_title_id VARCHAR,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(2) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

SELECT * FROM employees

--Create table dept_emp

DROP TABLE dept_emp;

CREATE TABLE dept_emp (
	emp_no VARCHAR(30) NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_emp

-- Create dept_managers table

DROP TABLE dept_manager;

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no VARCHAR NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

SELECT * FROM dept_manager

-- Create salaries table

DROP TABLE salaries;

CREATE TABLE salaries (
	emp_no VARCHAR NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries

-- Create titles table
DROP TABLE titles;

CREATE TABLE titles (
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id),
	FOREIGN KEY (title_id) REFERENCES employees(emp_title_id)
);

SELECT * FROM titles

