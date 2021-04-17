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
	title VARCHAR(30) NOT NULL
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM titles



--DATA ANALYSIS QUESTIONS:

-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;


-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1985-01-01'
AND hire_date < '1986-01-01';


-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no=employees.emp_no;

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no;


-- List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

SELECT last_name, first_name, gender
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- List all employees in the Sales department, 
--including their employee number, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales';

-- List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.