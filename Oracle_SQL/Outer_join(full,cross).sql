REM   Script: 0418_SQLD_04
REM   OUTER JOIN / NVL

CREATE TABLE dept ( 
deptno INT, 
dname VARCHAR(50), 
PRIMARY KEY (deptno) 
);

CREATE TABLE emps ( 
empno INT, 
ename VARCHAR(50), 
deptno INT, 
);

CREATE TABLE emp ( 
empno INT, 
ename VARCHAR(50), 
deptno INT, 
);

CREATE TABLE emp ( 
empno INT, 
ename VARCHAR(50), 
deptno INT 
);

INSERT INTO emp (empno, ename, deptno) VALUES (7839, 'KING', 10);

INSERT INTO emp (empno, ename, deptno) VALUES (7566, 'JONES', 20);

INSERT INTO dept (deptno, dname) VALUES (10, 'Accounting');

INSERT INTO dept (deptno, dname) VALUES (20, 'Research');

INSERT INTO dept (deptno, dname) VALUES (30, 'Sales');

INSERT INTO dept (deptno, dname) VALUES (40, 'Operations');

INSERT INTO emp (empno, ename, deptno) VALUES (7902, 'FORD', 20);

INSERT INTO emp (empno, ename, deptno) VALUES (7654, 'MARTIN', 30);

CREATE TABLE Unit ( 
unit_id INT, 
unit_name VARCHAR(50), 
PRIMARY KEY (unit_id) 
);

CREATE TABLE Soldier ( 
soldier_id INT, 
first_name VARCHAR(50), 
unit_id INT, 
FOREIGN KEY (unit_id) REFERENCES Unit(unit_id) 
);

INSERT INTO Unit (unit_id, unit_name) VALUES (1, 'Alpha');

INSERT INTO Unit (unit_id, unit_name) VALUES (2, 'Bravo');

INSERT INTO Unit (unit_id, unit_name) VALUES (3, 'Charlie');

INSERT INTO Soldier (soldier_id, first_name, unit_id) VALUES (101, 'John', 1);

INSERT INTO Soldier (soldier_id, first_name, unit_id) VALUES (102, 'Mike', 1);

INSERT INTO Soldier (soldier_id, first_name, unit_id) VALUES (103, 'Alex', 2);

INSERT INTO Soldier (soldier_id, first_name, unit_id) VALUES (104, 'Liam', NULL);

SELECT  
    u.unit_name, 
    s.soldier_id, 
    s.first_name, 
    s.unit_id 
FROM unit u RIGHT OUTER JOIN soldier s  
ON (u.unit_id = s.unit_id);

SELECT  
    u.unit_name, 
    s.soldier_id, 
    s.first_name, 
    s.unit_id 
FROM unit u RIGHT OUTER JOIN soldier s  
ON (u.unit_id = s.unit_id) 
ORDER BY u.unit_name;

CREATE TABLE dept ( 
    deptno INT, 
    dname VARCHAR(50), 
    PRIMARY KEY (deptno) 
);

CREATE TABLE dept_temp ( 
    deptno INT, 
    dname VARCHAR(50), 
    PRIMARY KEY (deptno) 
);

CREATE TABLE depts ( 
    deptno INT, 
    dname VARCHAR(50), 
    PRIMARY KEY (deptno) 
);

INSERT INTO dept (deptno, dname) VALUES (10, 'Accounting');

INSERT INTO dept (deptno, dname) VALUES (20, 'Research');

INSERT INTO dept (deptno, dname) VALUES (30, 'Sales');

INSERT INTO dept_temp (deptno, dname) VALUES (20, 'Research');

INSERT INTO dept_temp (deptno, dname) VALUES (30, 'Sales');

INSERT INTO dept_temp (deptno, dname) VALUES (40, 'Operations');

INSERT INTO depts (deptno, dname) VALUES (10, 'Accounting');

INSERT INTO depts (deptno, dname) VALUES (20, 'Research');

INSERT INTO depts (deptno, dname) VALUES (30, 'Sales');

INSERT INTO dept_temp (deptno, dname) VALUES (20, 'Research');

INSERT INTO dept_temp (deptno, dname) VALUES (30, 'Sales');

INSERT INTO dept_temp (deptno, dname) VALUES (40, 'Operations');

CREATE TABLE dept_temp ( 
    deptno INT, 
    dname VARCHAR(50), 
    PRIMARY KEY (deptno) 
);

INSERT INTO dept_temp (deptno, dname) VALUES (20, 'Research');

INSERT INTO dept_temp (deptno, dname) VALUES (30, 'Sales');

INSERT INTO dept_temp (deptno, dname) VALUES (40, 'Operations');

drop table dept;

drop table emp;

CREATE TABLE dept ( 
    deptno INT, 
    dname VARCHAR(50), 
    PRIMARY KEY (deptno) 
);

CREATE TABLE dept_temp ( 
    deptno INT, 
    dname VARCHAR(50), 
    PRIMARY KEY (deptno) 
);

REATE TABLE dept_temp ( 


    deptno INT, 


    dname VARCHAR(50), 


    PRIMARY KEY (deptno) 


);


CREATE TABLE dept_temp ( 
    deptno INT, 
    dname VARCHAR(50), 
    PRIMARY KEY (deptno) 
);

INSERT INTO dept (deptno, dname) VALUES (10, 'Accounting');

INSERT INTO dept (deptno, dname) VALUES (20, 'Research');

INSERT INTO dept (deptno, dname) VALUES (30, 'Sales');

INSERT INTO dept_temp (deptno, dname) VALUES (20, 'Research');

INSERT INTO dept_temp (deptno, dname) VALUES (30, 'Sales');

INSERT INTO dept_temp (deptno, dname) VALUES (40, 'Operations');

drop table dept_temp;

CREATE TABLE dept_temp ( 
    deptno INT, 
    dname VARCHAR(50), 
    PRIMARY KEY (deptno) 
);

select * 
from dept full outer join dept_temp 
	on (dept.deptno = dept_temp.deptno);

INSERT INTO dept_temp (deptno, dname) VALUES (20, 'Research');

INSERT INTO dept_temp (deptno, dname) VALUES (30, 'Sales');

INSERT INTO dept_temp (deptno, dname) VALUES (40, 'Operations');

select * 
from dept full outer join dept_temp 
	on (dept.deptno = dept_temp.deptno);

