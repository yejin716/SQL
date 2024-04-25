REM   Script: 0418_SQLD_03
REM   OUTER JOIN  /nvl / 

CREATE TABLE EMP_EX ( 
    EMP_NO VARCHAR(10), 
    EMP_NM VARCHAR(50), 
    DEPT_NO VARCHAR(10), 
    FOREIGN KEY (DEPT_NO) REFERENCES DEPT_EX(DEPT_NO) 
);

CREATE TABLE DEPT_EX ( 
    DEPT_NO VARCHAR(10), 
    DEPT_NM VARCHAR(50), 
    PRIMARY KEY (DEPT_NO) 
);

INSERT INTO DEPT_EX (DEPT_NO, DEPT_NM) VALUES ('D01', '인사팀');

INSERT INTO DEPT_EX (DEPT_NO, DEPT_NM) VALUES ('D02', '개발팀');

INSERT INTO DEPT_EX (DEPT_NO, DEPT_NM) VALUES ('D03', '영업팀');

INSERT INTO EMP_EX (EMP_NO, EMP_NM, DEPT_NO) VALUES ('E01', '홍길동', 'D02');

INSERT INTO EMP_EX (EMP_NO, EMP_NM, DEPT_NO) VALUES ('E02', '김철수', 'D01');

INSERT INTO EMP_EX (EMP_NO, EMP_NM, DEPT_NO) VALUES ('E03', '이영희', 'D02');

INSERT INTO EMP_EX (EMP_NO, EMP_NM, DEPT_NO) VALUES ('E04', '박보검', 'D03');

SELECT 
    a.dept_no, a.dept_nm 
    ,nvl(b.emp_no, 'null') as emp_no 
    ,nvl(b.emp_nm, 'null') as emp_nm 
FROM dept_ex a left outer join emp_ex b 
on (a.dept_no = b.emp_no) and (a.dept_nm = '개발팀') 
where a.dept_no is not null;

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

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.unit_id, "") as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by unit;

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.unit_id, "") as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id);

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.unit_id, "") as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by u.unit_id;

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.unit_id, " ") as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by u.unit_id;

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.unit_id, '' ) as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by u.unit_id;

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.unit_id, '' ) as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by unit;

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.unit_id, '' ) as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by u;

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.unit_id, '' ) as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by unit_name;

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.first_name, '' ) as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by unit_name;

select  
    s.soldier_id,  
    s.first_name,  
    nvl(s.unit_id, '' ) as unit_n 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by unit_name;

select  
    u.unit_name, 
    u.unit_id  
    s.first_name,  
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by unit_id;

select  
    u.unit_name, 
    u.unit_id, 
    s.first_name 
from unit u left outer join soldier s  
on (u.unit_id = s.unit_id) 
order by unit_id;

CREATE TABLE dept ( 
deptno INT, 
dname VARCHAR(50), 
PRIMARY KEY (deptno) 
);

CREATE TABLE emp ( 
empno INT, 
ename VARCHAR(50), 
deptno INT, 
);

CREATE TABLE emp ( 
empno INT, 
ename VARCHAR(50), 
deptno INT, 
);

CREATE TABLE emps ( 
empno INT, 
ename VARCHAR(50), 
deptno INT, 
);

CREATE TABLE emps ( 
empno INT, 
ename VARCHAR(50), 
deptno INT, 
);

