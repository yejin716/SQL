REM   Script: 0418_SQLD
REM   JOIN

CREATE TABLE employees ( 
employee_id NUMBER PRIMARY KEY, 
last_name VARCHAR2(50), 
department_id NUMBER 
);

CREATE TABLE departments ( 
department_id NUMBER PRIMARY KEY, 
department_name VARCHAR2(50) 
);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (1, 'Smith', 10);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (2, 'Johnson', 20);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (3, 'Williams', 10);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (4, 'Jones', 30);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (5, 'Brown', 30);

INSERT INTO departments (department_id, department_name) VALUES (10, 'Accounting');

INSERT INTO departments (department_id, department_name) VALUES (20, 'Marketing');

INSERT INTO departments (department_id, department_name) VALUES (30, 'Engineering');

SELECT * FROM employees;

SELECT * FROM departments;

SELECT *  
FROM EMPLOYEES 사원. 
    DEPARTMENTS 부서 
WHERE 
	사원.department_id = 부서.department_id;

CREATE TABLE nation ( 
nation_id NUMBER PRIMARY KEY, 
country_name VARCHAR2(100), 
population NUMBER 
);

CREATE TABLE participant ( 
participant_id NUMBER PRIMARY KEY, 
first_name VARCHAR2(100), 
gender CHAR(1), -- 'M' for Male, 'F' for Female 
nation_id NUMBER, 
CONSTRAINT fk_nation 
FOREIGN KEY (nation_id) 
REFERENCES nation (nation_id) 
);

INSERT INTO nation (nation_id, country_name, population) VALUES (1, 'USA', 330000000);

INSERT INTO nation (nation_id, country_name, population) VALUES (2, 'Canada', 38000000);

INSERT INTO nation (nation_id, country_name, population) VALUES (3, 'South Korea', 51200000);

INSERT INTO participant (participant_id, first_name, gender, nation_id) VALUES (1, 'John', 'M', 1);

INSERT INTO participant (participant_id, first_name, gender, nation_id) VALUES (2, 'Emma', 'F', 1);

INSERT INTO participant (participant_id, first_name, gender, nation_id) VALUES (3, 'Chris', 'M', 2);

INSERT INTO participant (participant_id, first_name, gender, nation_id) VALUES (4, 'Olivia', 'F', 3);

SELECT employee_id.사원번호, 
    department_id.부서번호 
    department_name.부서명 
FROM EMPLOYEES 사원. 
    DEPARTMENTS 부서 
WHERE 
	사원.department_id = 부서.department_id;

SELECT p. first_name, 
    	p.gender, 
    n.country_name, 
    n.population 
     
FROM participant p, nation n 
WHERE p.nation_id = n.nation_id;

SELECT 사원.employee_id, 
    사원.last_name, 
    부서.department_id, 
    부서.department_name 
FROM EMPLOYEES 사원. 
    DEPARTMENTS 부서 
WHERE 
	사원.department_id = 부서.department_id;

SELECT 사원.employee_id, 
    사원.last_name, 
     
    부서.department_name 
FROM EMPLOYEES 사원. 
    DEPARTMENTS 부서 
WHERE 
	사원.department_id = 부서.department_id;

CREATE TABLE employees ( 
employee_id NUMBER PRIMARY KEY, 
last_name VARCHAR2(50), 
department_id NUMBER 
);

CREATE TABLE employee ( 
employee_id NUMBER PRIMARY KEY, 
last_name VARCHAR2(50), 
department_id NUMBER 
);

CREATE TABLE department ( 
department_id NUMBER PRIMARY KEY, 
department_name VARCHAR2(50) 
);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (1, 'Smith', 10);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (2, 'Johnson', 20);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (3, 'Williams', 10);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (4, 'Jones', 30);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (5, 'Brown', 30);

INSERT INTO employee (employee_id, last_name, department_id) VALUES (1, 'Smith', 10);

INSERT INTO employee (employee_id, last_name, department_id) VALUES (2, 'Johnson', 20);

INSERT INTO employee (employee_id, last_name, department_id) VALUES (3, 'Williams', 10);

INSERT INTO employee (employee_id, last_name, department_id) VALUES (4, 'Jones', 30);

INSERT INTO employee (employee_id, last_name, department_id) VALUES (5, 'Brown', 30);

INSERT INTO department (department_id, department_name) VALUES (10, 'Accounting');

INSERT INTO department (department_id, department_name) VALUES (20, 'Marketing');

INSERT INTO department (department_id, department_name) VALUES (30, 'Engineering');

select * from employee;

select * from department;

select  
    e.last_name, 
    e.employee_id, 
    d.department_name 
from employee e, department d 
where e.department_id = d.department_id 
order by e.last_name;

SELECT  
	사원.employee_id, 
    사원.last_name, 
    부서.department_name 
FROM EMPLOYEES 사원. 
    DEPARTMENTS 부서 
WHERE 
	사원.department_id = 부서.department_id;

SELECT  
	사원.employee_id, 
    사원.last_name, 
    부서.department_name 
FROM emplyees 사원, 
    departments 부서 
WHERE 
	사원.department_id = 부서.department_id;

SELECT  
	사원.employee_id, 
    사원.last_name, 
    부서.department_name 
FROM employees 사원, 
    departments 부서 
WHERE 
	사원.department_id = 부서.department_id;

drop table nation;

CREATE TABLE nations ( 
nation_id NUMBER PRIMARY KEY, 
country_name VARCHAR2(100), 
population NUMBER 
);

CREATE TABLE participants ( 
participant_id NUMBER PRIMARY KEY, 
first_name VARCHAR2(100), 
gender CHAR(1), -- 'M' for Male, 'F' for Female 
nation_id NUMBER, 
CONSTRAINT fk_nation 
FOREIGN KEY (nation_id) 
REFERENCES nation (nation_id) 
);

CREATE TABLE participants ( 
participant_id NUMBER PRIMARY KEY, 
first_name VARCHAR2(100), 
gender CHAR(1), -- 'M' for Male, 'F' for Female 
nation_id NUMBER, 
CONSTRAINT fk_nation 
FOREIGN KEY (nation_id) 
REFERENCES nation (nation_id) 
);

CREATE TABLE participants ( 
participant_id NUMBER PRIMARY KEY, 
first_name VARCHAR2(100), 
gender CHAR(1), -- 'M' for Male, 'F' for Female 
nation_id NUMBER, 
CONSTRAINT fk_nation 
FOREIGN KEY (nation_id) 
REFERENCES nation (nation_id) 
);

INSERT INTO nations (nation_id, country_name, population) VALUES (1, 'USA', 330000000);

INSERT INTO nations (nation_id, country_name, population) VALUES (2, 'Canada', 38000000);

INSERT INTO nations (nation_id, country_name, population) VALUES (3, 'South Korea', 51200000);

INSERT INTO participant (participant_id, first_name, gender, nation_id) VALUES (5, 'Sophia', 'F', 2);

INSERT INTO participant (participant_id, first_name, gender, nation_id) VALUES (6, 'Isabella', 'F', 1);

select  
    p.first_name, 
    n.country_name, 
    n.population 
from participant p, nations n 
where (p.nation_id = n.nation_id) and (p.gender == 'F') 
order by p.first_name desc;

select  
    p.first_name, 
    n.country_name, 
    n.population 
from participant p, nations n 
where (p.nation_id = n.nation_id) and (p.gender == 'F') 
order by p.first_name desc;

select  
    p.first_name, 
    n.country_name, 
    n.population 
from participant p, nations n 
where (p.nation_id = n.nation_id) and (p.gender = 'F') 
order by p.first_name desc;

CREATE TABLE nation_ ( 
    nation_id NUMBER PRIMARY KEY, 
    country_name VARCHAR2(100) 
);

CREATE TABLE sport ( 
    sport_id NUMBER PRIMARY KEY, 
    sport_name VARCHAR2(100) 
);

CREATE TABLE participant_ ( 
    participant_id NUMBER PRIMARY KEY, 
    first_name VARCHAR2(100), 
    nation_id NUMBER, 
    main_sport_id NUMBER, 
    CONSTRAINT fk_nation 
        FOREIGN KEY (nation_id) 
        REFERENCES nation (nation_id), 
    CONSTRAINT fk_sport 
        FOREIGN KEY (main_sport_id) 
        REFERENCES sport (sport_id) 
);

CREATE TABLE part ( 
    participant_id NUMBER PRIMARY KEY, 
    first_name VARCHAR2(100), 
    nation_id NUMBER, 
    main_sport_id NUMBER, 
    CONSTRAINT fk_nation 
        FOREIGN KEY (nation_id) 
        REFERENCES nation_ (nation_id), 
    CONSTRAINT fk_sport 
        FOREIGN KEY (main_sport_id) 
        REFERENCES sport (sport_id) 
);

CREATE TABLE participant_ ( 
    participant_id NUMBER PRIMARY KEY, 
    first_name VARCHAR2(100), 
    nation_id NUMBER, 
    main_sport_id NUMBER, 
    CONSTRAINT fk_nation 
        FOREIGN KEY (nation_id) 
        REFERENCES nation_ (nation_id), 
    CONSTRAINT fk_sport 
        FOREIGN KEY (main_sport_id) 
        REFERENCES sport (sport_id) 
);

CREATE TABLE part ( 
    participant_id NUMBER PRIMARY KEY, 
    first_name VARCHAR2(100), 
    nation_id NUMBER, 
    main_sport_id NUMBER, 
    CONSTRAINT fk_nation 
        FOREIGN KEY (nation_id) 
        REFERENCES nation_ (nation_id), 
    CONSTRAINT fk_sport 
        FOREIGN KEY (main_sport_id) 
        REFERENCES sport (sport_id) 
);

CREATE TABLE part ( 
    participant_id NUMBER PRIMARY KEY, 
    first_name VARCHAR2(100), 
    nation_id NUMBER, 
    main_sport_id NUMBER, 
    
);

