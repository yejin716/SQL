REM   Script: 0418_SQLD_02
REM   쿼리 

CREATE TABLE nation ( 
    nation_id NUMBER PRIMARY KEY, 
    country_name VARCHAR2(100) 
);

CREATE TABLE sport ( 
    sport_id NUMBER PRIMARY KEY, 
    sport_name VARCHAR2(100) 
);

CREATE TABLE participant ( 
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

INSERT INTO nation (nation_id, country_name) VALUES (1, 'USA');

INSERT INTO nation (nation_id, country_name) VALUES (2, 'Canada');

INSERT INTO nation (nation_id, country_name) VALUES (3, 'South Korea');

INSERT INTO sport (sport_id, sport_name) VALUES (1, 'Basketball');

INSERT INTO sport (sport_id, sport_name) VALUES (2, 'Hockey');

INSERT INTO sport (sport_id, sport_name) VALUES (3, 'Archery');

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (1, 'John', 1, 1);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (2, 'Emma', 1, 3);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (3, 'Chris', 2, 2);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (4, 'Olivia', 3, 3);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (5, 'Sophia', 2, 1);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (6, 'Liam', 3, 2);

select * from nation;

select * from sport;

select * from participant;

select  
    p.first_name, 
    n.country, 
    s.sport_name 
from participant p, nation n, sport s  
where  
    (n.nation_id = p.nation_id) and 
	(s.sport_id = p. main_sport_id) 
order by s.sport_name;

select  
    p.first_name, 
    n.country_name, 
    s.sport_name 
from participant p, nation n, sport s  
where  
    (n.nation_id = p.nation_id) and 
	(s.sport_id = p. main_sport_id) 
order by s.sport_name;

CREATE TABLE VolunteerActivity ( 
    activity_id NUMBER PRIMARY KEY, 
    juice_type VARCHAR2(20), 
    quantity_sold NUMBER 
);

INSERT INTO VolunteerActivity VALUES (1, 'Orange Juice', 100);

INSERT INTO VolunteerActivity VALUES (2, 'Apple Juice', 80);

INSERT INTO VolunteerActivity VALUES (3, 'Grape Juice', 640);

INSERT INTO VolunteerActivity VALUES (4, 'Pineapple Juice', 300);

INSERT INTO VolunteerActivity VALUES (5, 'Lemonade Juice', 110);

CREATE TABLE Unit ( 
    unit_id NUMBER PRIMARY KEY, 
    unit_name VARCHAR2(20), 
    activity_id NUMBER, 
    FOREIGN KEY (activity_id) REFERENCES VolunteerActivity(activity_id) 
);

INSERT INTO Unit VALUES (101, 'Alpha Unit', 1);

INSERT INTO Unit VALUES (102, 'Bravo Unit', 2);

INSERT INTO Unit VALUES (103, 'Charlie Unit', 3);

INSERT INTO Unit VALUES (104, 'Delta Unit', 4);

INSERT INTO Unit VALUES (105, 'Echo Unit', 5);

CREATE TABLE Soldier ( 
    soldier_id NUMBER PRIMARY KEY, 
    first_name VARCHAR2(20), 
    last_name VARCHAR2(20), 
    rank VARCHAR2(20), 
    unit_id NUMBER, 
    activity_id NUMBER, 
    FOREIGN KEY (unit_id) REFERENCES Unit(unit_id), 
    FOREIGN KEY (activity_id) REFERENCES VolunteerActivity(activity_id) 
);

INSERT INTO Soldier VALUES (3028, 'John', 'Doe', 'Sergeant', 101, 1);

INSERT INTO Soldier VALUES (2734, 'Jane', 'Smith', 'Private', 102, 2);

INSERT INTO Soldier VALUES (3103, 'Michael', 'Johnson', 'Private', 103, 3);

INSERT INTO Soldier VALUES (4865, 'Emily', 'Davis', 'Private', 104, 4);

INSERT INTO Soldier VALUES (5371, 'Chris', 'Brown', 'Sergeant', 105, 5);

SELECT u.unit_name, v.juice_type 
FROM unit u JOIN volunteerActivity v 
  ON u.activity_id = v.activity_id;

select first_name, unit_name, rank 
from soldier natural join unit;

select s.unit_id, s.first_name, u.unit_name 
from soldier s join unit u 
using (unit_id);

elect unit_id, s.first_name, u.unit_name 


from soldier s join unit u 


using (unit_id);


select unit_id, s.first_name, u.unit_name 
from soldier s join unit u 
using (unit_id);

select s.first_name, s.last_name, s.rank, activity_id 
from solider s join unit u  
on unit_name = 'Alpha Unit';

select s.first_name, s.last_name, s.rank, activity_id 
from soldier s join unit u  
on unit_name = 'Alpha Unit';

select s.first_name, s.last_name, s.rank, activity_id 
from soldier s join unit u  
on (u.unit_name = 'Alpha Unit');

select s.first_name, s.last_name, s.rank, activity_id 
from soldier s join unit u  
on (s.unit_id = u.unit_id) 
where (unit_name = 'Alpha Unit');

select s.first_name, s.last_name, s.rank, u.activity_id 
from soldier s join unit u  
on (s.unit_id = u.unit_id) 
where (unit_name = 'Alpha Unit');

select s.first_name, s.last_name, s.rank, u.activity_id 
from soldier s join unit u  
on (s.activity_id = u.activity_id) 
where (unit_name = 'Alpha Unit');

select s.first_name, s.last_name, s.rank, u.activity_id 
from soldier s join unit u  
on (s.activity_id = u.activity_id) 
where (u.unit_name = 'Alpha Unit');

select u.unit_name, v.quantity_sold 
from VolunteerActivity v join unit u 
	on v.activity_id = u.activity_id 
where v.quantity_sold >= 110;

select s.first_name, u_unit_name 
from soldier s join unit u 
on s.unit_id = s.unit_id 
order by unit_name;

select s.first_name, u.unit_name 
from soldier s join unit u 
on s.unit_id = s.unit_id 
order by unit_name;

select s.first_name, u.unit_name 
from soldier s join unit u 
on s.unit_id = s.unit_id 
order by u.unit_name;

select first_name, unit_name 
from soldier s join unit u 
on s.unit_id = s.unit_id 
order by unit_name;

select first_name, unit_name 
from soldier s join unit u 
on s.unit_id = u.unit_id 
order by unit_name;

CREATE TABLE dept_temp ( 
deptno NUMBER PRIMARY KEY, 
dname VARCHAR2(30), 
loc VARCHAR2(30) 
);

INSERT INTO dept_temp VALUES (10, 'Administration', 'New York');

INSERT INTO dept_temp VALUES (20, 'Marketing', 'Los Angeles');

INSERT INTO dept_temp VALUES (30, 'Purchasing', 'San Francisco');

INSERT INTO dept_temp VALUES (40, 'Human Resources', 'Chicago');

CREATE TABLE nation ( 
    nation_id NUMBER PRIMARY KEY, 
    country_name VARCHAR2(100) 
);

CREATE TABLE sport ( 
    sport_id NUMBER PRIMARY KEY, 
    sport_name VARCHAR2(100) 
);

CREATE TABLE participant ( 
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

INSERT INTO nation (nation_id, country_name) VALUES (1, 'USA');

INSERT INTO nation (nation_id, country_name) VALUES (2, 'Canada');

INSERT INTO nation (nation_id, country_name) VALUES (3, 'South Korea');

INSERT INTO sport (sport_id, sport_name) VALUES (1, 'Basketball');

INSERT INTO sport (sport_id, sport_name) VALUES (2, 'Hockey');

INSERT INTO sport (sport_id, sport_name) VALUES (3, 'Archery');

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (1, 'John', 1, 1);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (2, 'Emma', 1, 3);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (3, 'Chris', 2, 2);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (4, 'Olivia', 3, 3);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (5, 'Sophia', 2, 1);

INSERT INTO participant (participant_id, first_name, nation_id, main_sport_id) VALUES (6, 'Liam', 3, 2);

select * from nation;

select * from sport;

select * from participant;

select  
    p.first_name, 
    n.country_name, 
    s.sport_name 
from participant p, nation n, sport s  
where  
    (n.nation_id = p.nation_id) and 
	(s.sport_id = p. main_sport_id) 
order by s.sport_name;

CREATE TABLE VolunteerActivity ( 
    activity_id NUMBER PRIMARY KEY, 
    juice_type VARCHAR2(20), 
    quantity_sold NUMBER 
);

INSERT INTO VolunteerActivity VALUES (1, 'Orange Juice', 100);

INSERT INTO VolunteerActivity VALUES (2, 'Apple Juice', 80);

INSERT INTO VolunteerActivity VALUES (3, 'Grape Juice', 640);

INSERT INTO VolunteerActivity VALUES (4, 'Pineapple Juice', 300);

INSERT INTO VolunteerActivity VALUES (5, 'Lemonade Juice', 110);

CREATE TABLE Unit ( 
    unit_id NUMBER PRIMARY KEY, 
    unit_name VARCHAR2(20), 
    activity_id NUMBER, 
    FOREIGN KEY (activity_id) REFERENCES VolunteerActivity(activity_id) 
);

INSERT INTO Unit VALUES (101, 'Alpha Unit', 1);

INSERT INTO Unit VALUES (102, 'Bravo Unit', 2);

INSERT INTO Unit VALUES (103, 'Charlie Unit', 3);

INSERT INTO Unit VALUES (104, 'Delta Unit', 4);

INSERT INTO Unit VALUES (105, 'Echo Unit', 5);

CREATE TABLE Soldier ( 
    soldier_id NUMBER PRIMARY KEY, 
    first_name VARCHAR2(20), 
    last_name VARCHAR2(20), 
    rank VARCHAR2(20), 
    unit_id NUMBER, 
    activity_id NUMBER, 
    FOREIGN KEY (unit_id) REFERENCES Unit(unit_id), 
    FOREIGN KEY (activity_id) REFERENCES VolunteerActivity(activity_id) 
);

INSERT INTO Soldier VALUES (3028, 'John', 'Doe', 'Sergeant', 101, 1);

INSERT INTO Soldier VALUES (2734, 'Jane', 'Smith', 'Private', 102, 2);

INSERT INTO Soldier VALUES (3103, 'Michael', 'Johnson', 'Private', 103, 3);

INSERT INTO Soldier VALUES (4865, 'Emily', 'Davis', 'Private', 104, 4);

INSERT INTO Soldier VALUES (5371, 'Chris', 'Brown', 'Sergeant', 105, 5);

#부대 이름과 봉사활동 시 판매했던 과일명을 출력해 보세요. 


SELECT u.unit_name, v.juice_type 
FROM unit u JOIN volunteerActivity v 
  ON u.activity_id = v.activity_id;

select first_name, unit_name, rank 
from soldier natural join unit;

select unit_id, s.first_name, u.unit_name 
from soldier s join unit u 
using (unit_id);

select s.first_name, s.last_name, s.rank, u.activity_id 
from soldier s join unit u  
on (s.activity_id = u.activity_id) 
where (u.unit_name = 'Alpha Unit');

select u.unit_name, v.quantity_sold 
from VolunteerActivity v join unit u 
	on v.activity_id = u.activity_id 
where v.quantity_sold >= 110;

select first_name, unit_name 
from soldier s join unit u 
on s.unit_id = u.unit_id 
order by unit_name;

CREATE TABLE dept_temp ( 
deptno NUMBER PRIMARY KEY, 
dname VARCHAR2(30), 
loc VARCHAR2(30) 
);

INSERT INTO dept_temp VALUES (10, 'Administration', 'New York');

INSERT INTO dept_temp VALUES (20, 'Marketing', 'Los Angeles');

INSERT INTO dept_temp VALUES (30, 'Purchasing', 'San Francisco');

INSERT INTO dept_temp VALUES (40, 'Human Resources', 'Chicago');

select * from dept_temp;

CREATE TABLE departments ( 
department_id NUMBER PRIMARY KEY, 
department_name VARCHAR2(50) 
);

INSERT INTO departments (department_id, department_name) VALUES (10, 'Accounting');

INSERT INTO departments (department_id, department_name) VALUES (20, 'Marketing');

INSERT INTO departments (department_id, department_name) VALUES (30, 'Engineering');

select * from departments;

CREATE TABLE employees ( 
employee_id NUMBER PRIMARY KEY, 
last_name VARCHAR2(50), 
department_id NUMBER 
);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (1, 'Smith', 10);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (2, 'Johnson', 20);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (3, 'Williams', 10);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (4, 'Jones', 30);

INSERT INTO employees (employee_id, last_name, department_id) VALUES (5, 'Brown', 30);

select * from employees;

select * from dept_temp;

CREATE TABLE departments ( 
department_id NUMBER PRIMARY KEY, 
department_name VARCHAR2(50) 
);

CREATE TABLE department ( 
department_id NUMBER PRIMARY KEY, 
department_name VARCHAR2(50) 
);

INSERT INTO department (department_id, department_name) VALUES (10, 'Accounting');

INSERT INTO department (department_id, department_name) VALUES (20, 'Marketing');

INSERT INTO department (department_id, department_name) VALUES (30, 'Engineering');

select * from department;

CREATE TABLE employee ( 
employee_id NUMBER PRIMARY KEY, 
last_name VARCHAR2(50), 
department_id NUMBER 
);

select * from employee;

INSERT INTO employee (employee_id, last_name, department_id) VALUES (1, 'Smith', 10);

INSERT INTO employee (employee_id, last_name, department_id) VALUES (2, 'Johnson', 20);

INSERT INTO employee (employee_id, last_name, department_id) VALUES (3, 'Williams', 10);

INSERT INTO employee (employee_id, last_name, department_id) VALUES (4, 'Jones', 30);

INSERT INTO employee (employee_id, last_name, department_id) VALUES (5, 'Brown', 30);

select * from employee;

select u.unit_name, v.quantity_sold, v.juice_type, s.first_name,s.rank 
from VolunteerActivity v  
join unit u 
on v.activity_id = u.activity_id 
join soldier s 
on u.activity_id = s.activity_id 
where v.quantity_sold between 100 and 600;

select u.unit_name, v.quantity_sold, v.juice_type, s.first_name,s.rank 
from VolunteerActivity v  
join unit u 
on v.activity_id = u.activity_id 
join soldier s 
on u.unit_id = s.unit_id 
where v.quantity_sold between 100 and 600;

