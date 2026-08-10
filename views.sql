DROP DATABASE IF EXISTS employeedb1;

CREATE DATABASE employeedb1;
USE employeedb1;


-- =========================
-- 1. CREATE TABLES
-- =========================

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2)
);


-- =========================
-- 2. INSERT DATA
-- =========================

INSERT INTO departments VALUES
(1, 'CSE'),
(2, 'ECE'),
(3, 'EEE');

INSERT INTO employees VALUES
(101, 'Rahul', 1, 50000),
(102, 'Priya', 2, 65000),
(103, 'Anil', 1, 55000),
(104, 'Sneha', 3, 70000),
(105, 'Kiran', 2, 48000);


-- =========================
-- 3. DISPLAY TABLES
-- =========================

SHOW TABLES;

SELECT * FROM departments;

SELECT * FROM employees;


-- =========================
-- 4. EMPLOYEE VIEW
-- =========================

CREATE VIEW EmployeeView AS
SELECT *
FROM employees;

SELECT * FROM EmployeeView;


-- =========================
-- 5. BASIC EMPLOYEE VIEW
-- =========================

CREATE VIEW EmployeeBasicView AS
SELECT emp_id, emp_name, salary
FROM employees;

SELECT * FROM EmployeeBasicView;


-- =========================
-- 6. HIGH SALARY EMPLOYEES
-- =========================

CREATE VIEW HighSalaryEmployees AS
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > 55000;

SELECT * FROM HighSalaryEmployees;


-- =========================
-- 7. EMPLOYEE DEPARTMENT VIEW
-- =========================

CREATE VIEW EmployeeDepartmentView AS
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees AS e
JOIN departments AS d
ON e.dept_id = d.dept_id;

SELECT * FROM EmployeeDepartmentView;


-- =========================
-- 8. CSE EMPLOYEES
-- =========================

CREATE VIEW CSEEmployees AS
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees AS e
JOIN departments AS d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'CSE';

SELECT * FROM CSEEmployees;


-- =========================
-- 9. DEPARTMENT SALARY VIEW
-- =========================

CREATE VIEW DepartmentSalaryView AS
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS EmployeeCount,
    AVG(e.salary) AS AverageSalary
FROM employees AS e
JOIN departments AS d
ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name;

SELECT * FROM DepartmentSalaryView;


-- =========================
-- 10. HIGH AVERAGE DEPARTMENTS
-- =========================

CREATE VIEW HighAverageDepartments AS
SELECT
    d.dept_name,
    AVG(e.salary) AS AverageSalary
FROM employees AS e
JOIN departments AS d
ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING AVG(e.salary) > 55000;

SELECT * FROM HighAverageDepartments;


-- =========================
-- 11. SALARY RANGE VIEW
-- =========================

CREATE VIEW SalaryRangeView AS
SELECT
    emp_id,
    emp_name,
    salary
FROM employees
WHERE salary BETWEEN 50000 AND 70000;

SELECT * FROM SalaryRangeView;


-- =========================
-- 12. ANNUAL SALARY VIEW
-- =========================

CREATE VIEW AnnualSalaryView AS
SELECT
    emp_id,
    emp_name,
    salary AS MonthlySalary,
    salary * 12 AS AnnualSalary
FROM employees;

SELECT * FROM AnnualSalaryView;


-- =========================
-- 13. UPDATABLE VIEW
-- =========================

CREATE VIEW EmployeeSalaryView AS
SELECT
    emp_id,
    emp_name,
    salary
FROM employees;

UPDATE EmployeeSalaryView
SET salary = 60000
WHERE emp_id = 101;

SELECT * FROM EmployeeSalaryView;

SELECT * FROM employees
WHERE emp_id = 101;


-- =========================
-- 14. REPLACE BASIC VIEW
-- =========================

CREATE OR REPLACE VIEW EmployeeBasicView AS
SELECT
    emp_name,
    salary
FROM employees;

SELECT * FROM EmployeeBasicView;


-- =========================
-- 15. SHOW VIEW DEFINITION
-- =========================

SHOW CREATE VIEW EmployeeDepartmentView;


-- =========================
-- 16. SHOW ALL VIEWS
-- =========================

SHOW FULL TABLES
WHERE Table_type = 'VIEW';


-- =========================
-- 17. DROP SALARY RANGE VIEW
-- =========================

DROP VIEW SalaryRangeView;