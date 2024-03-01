-- Data Engineering

-- Create table syntax was exported from QuickDBD but made some changes
-- such as adding the DROP TABLE IF EXISTS functions.
-- I also updated the data type of emp_no from integer to varchar because enountered issues when importing the data to the tables. 

DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
    title_id VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY (title_id)
);

DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no VARCHAR(255) NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (dept_no)
);

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_no VARCHAR(255) NOT NULL,
    emp_title_id VARCHAR(255) NOT NULL,
    birth_date VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(255) NOT NULL,
    hire_date VARCHAR(255) NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
    emp_no VARCHAR(255) NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
    dept_no VARCHAR(255) NOT NULL,
    emp_no VARCHAR(255) NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
    emp_no VARCHAR(255) NOT NULL,
    dept_no VARCHAR(255) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

--Check tables
SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;