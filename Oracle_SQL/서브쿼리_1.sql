REM   Script: SQL 서브쿼리
REM   서브쿼리 실습

CREATE TABLE PARTICIPANT ( 
partic_id NUMBER, 
nation_id NUMBER, 
main_sport_id NUMBER, 
first_name VARCHAR2(30), 
last_name VARCHAR2(30), 
gender VARCHAR2(1), 
height NUMBER, 
weight NUMBER 
);

INSERT INTO PARTICIPANT VALUES (1, 1, 101, 'John', 'Doe', 'M', 180, 75);

INSERT INTO PARTICIPANT VALUES (2, 2, 102, 'Jane', 'Smith', 'F', 165, 55);

INSERT INTO PARTICIPANT VALUES (3, 3, 103, 'Michael', 'Johnson', 'M', 175, 70);

INSERT INTO PARTICIPANT VALUES (4, 4, 104, 'Emily', 'Davis', 'F', 160, 50);

INSERT INTO PARTICIPANT VALUES (5, 5, 105, 'Chris', 'Brown', 'M', 190, 80);

INSERT INTO PARTICIPANT VALUES (6, 1, 101, 'Sarah', 'Wilson', 'F', 170, 60);

INSERT INTO PARTICIPANT VALUES (7, 2, 102, 'David', 'Lee', 'M', 175, 70);

INSERT INTO participant VALUES (8, 1, 102, 'Laura', 'Johnson', 'F', 160, 55);

CREATE TABLE NATION ( 
    nation_id NUMBER, 
    country_name VARCHAR2(30), 
    population NUMBER 
);

INSERT INTO NATION VALUES (1, 'United States', 331002651);

INSERT INTO NATION VALUES (2, 'India', 1380004385);

INSERT INTO NATION VALUES (3, 'China', 1444216107);

INSERT INTO NATION VALUES (4, 'Brazil', 212559417);

INSERT INTO NATION VALUES (5, 'United Kingdom', 67886011);

INSERT INTO NATION VALUES (6, 'Canada', 37742154);

INSERT INTO NATION VALUES (7, 'Australia', 25788221);

CREATE TABLE SPORT ( 
    sport_id NUMBER PRIMARY KEY, 
    sport_name VARCHAR2(20), 
    max_weight NUMBER, 
    min_weight NUMBER 
);

INSERT INTO SPORT VALUES (101, 'Football', 100, 60);

INSERT INTO SPORT VALUES  (102, 'Basketball', 120, 50);

INSERT INTO SPORT VALUES  (103, 'Tennis', 90, 50);

INSERT INTO SPORT VALUES  (104, 'Swimming', 85, 45);

INSERT INTO SPORT VALUES  (105, 'Gymnastics', 80, 40);

SELECT DISTINCT country_name 
FROM nation n  
WHERE EXISTS( 
    SELECT 1  
    FROM participant p  
    WHERE p.nation_id = n.nation_id 
);

SELECT first_name, height 
FROM PARTICIPANT 
WHERE height > (SELECT AVG(height) FROM PARTICIPANT);

SELECT MAX(height) 
FROM participant 
WHERE height NOT IN (SELECT MAX(height) FROM participant);

SELECT first_name, main_sport_id, weight 
FROM participant 
WHERE weight > (SELECT MAX(weight) FROM partiipant WHERE main_sport_id = 101);

CREATE TABLE PARTICIPANT ( 
partic_id NUMBER, 
nation_id NUMBER, 
main_sport_id NUMBER, 
first_name VARCHAR2(30), 
last_name VARCHAR2(30), 
gender VARCHAR2(1), 
height NUMBER, 
weight NUMBER 
);

INSERT INTO PARTICIPANT VALUES (1, 1, 101, 'John', 'Doe', 'M', 180, 75);

INSERT INTO PARTICIPANT VALUES (2, 2, 102, 'Jane', 'Smith', 'F', 165, 55);

INSERT INTO PARTICIPANT VALUES (3, 3, 103, 'Michael', 'Johnson', 'M', 175, 70);

INSERT INTO PARTICIPANT VALUES (4, 4, 104, 'Emily', 'Davis', 'F', 160, 50);

INSERT INTO PARTICIPANT VALUES (5, 5, 105, 'Chris', 'Brown', 'M', 190, 80);

INSERT INTO PARTICIPANT VALUES (6, 1, 101, 'Sarah', 'Wilson', 'F', 170, 60);

INSERT INTO PARTICIPANT VALUES (7, 2, 102, 'David', 'Lee', 'M', 175, 70);

INSERT INTO participant VALUES (8, 1, 102, 'Laura', 'Johnson', 'F', 160, 55);

CREATE TABLE NATION ( 
    nation_id NUMBER, 
    country_name VARCHAR2(30), 
    population NUMBER 
);

INSERT INTO NATION VALUES (1, 'United States', 331002651);

INSERT INTO NATION VALUES (2, 'India', 1380004385);

INSERT INTO NATION VALUES (3, 'China', 1444216107);

INSERT INTO NATION VALUES (4, 'Brazil', 212559417);

INSERT INTO NATION VALUES (5, 'United Kingdom', 67886011);

INSERT INTO NATION VALUES (6, 'Canada', 37742154);

INSERT INTO NATION VALUES (7, 'Australia', 25788221);

CREATE TABLE SPORT ( 
    sport_id NUMBER PRIMARY KEY, 
    sport_name VARCHAR2(20), 
    max_weight NUMBER, 
    min_weight NUMBER 
);

INSERT INTO SPORT VALUES (101, 'Football', 100, 60);

INSERT INTO SPORT VALUES  (102, 'Basketball', 120, 50);

INSERT INTO SPORT VALUES  (103, 'Tennis', 90, 50);

INSERT INTO SPORT VALUES  (104, 'Swimming', 85, 45);

INSERT INTO SPORT VALUES  (105, 'Gymnastics', 80, 40);

SELECT DISTINCT country_name 
FROM nation n  
WHERE EXISTS( 
    SELECT 1  
    FROM participant p  
    WHERE p.nation_id = n.nation_id 
);

SELECT first_name, height 
FROM PARTICIPANT 
WHERE height > (SELECT AVG(height) FROM PARTICIPANT);

SELECT MAX(height) 
FROM participant 
WHERE height NOT IN (SELECT MAX(height) FROM participant);

SELECT first_name, main_sport_id, weight 
FROM participant 
WHERE weight > (SELECT MAX(weight) FROM participant WHERE main_sport_id = 101);

SELECT first_name, main_sport_id, weight 
FROM participant 
WHERE weight > (SELECT MAX(weight) FROM participant WHERE main_sport_id = 101);

create table dept( 
  deptno     number(2,0), 
  dname      varchar2(14), 
  loc        varchar2(13), 
  constraint pk_dept primary key (deptno) 
);

create table emp( 
  empno    number(4,0), 
  ename    varchar2(10), 
  job      varchar2(9), 
  mgr      number(4,0), 
  hiredate date, 
  sal      number(7,2), 
  comm     number(7,2), 
  deptno   number(2,0), 
  constraint pk_emp primary key (empno), 
  constraint fk_deptno foreign key (deptno) references dept (deptno) 
);

insert into DEPT (DEPTNO, DNAME, LOC) 
values(10, 'ACCOUNTING', 'NEW YORK');

insert into dept 
values(20, 'RESEARCH', 'DALLAS');

insert into dept 
values(30, 'SALES', 'CHICAGO');

insert into dept 
values(40, 'OPERATIONS', 'BOSTON');

insert into emp 
values( 
 7839, 'KING', 'PRESIDENT', null, 
 to_date('17-11-1981','dd-mm-yyyy'), 
 5000, null, 10 
);

insert into emp 
values( 
 7698, 'BLAKE', 'MANAGER', 7839, 
 to_date('1-5-1981','dd-mm-yyyy'), 
 2850, null, 30 
);

insert into emp 
values( 
 7782, 'CLARK', 'MANAGER', 7839, 
 to_date('9-6-1981','dd-mm-yyyy'), 
 2450, null, 10 
);

insert into emp 
values( 
 7566, 'JONES', 'MANAGER', 7839, 
 to_date('2-4-1981','dd-mm-yyyy'), 
 2975, null, 20 
);

insert into emp 
values( 
 7788, 'SCOTT', 'ANALYST', 7566, 
 to_date('13-JUL-87','dd-mm-rr') - 85, 
 3000, null, 20 
);

insert into emp 
values( 
 7902, 'FORD', 'ANALYST', 7566, 
 to_date('3-12-1981','dd-mm-yyyy'), 
 3000, null, 20 
);

insert into emp 
values( 
 7369, 'SMITH', 'CLERK', 7902, 
 to_date('17-12-1980','dd-mm-yyyy'), 
 800, null, 20 
);

insert into emp 
values( 
 7499, 'ALLEN', 'SALESMAN', 7698, 
 to_date('20-2-1981','dd-mm-yyyy'), 
 1600, 300, 30 
);

insert into emp 
values( 
 7521, 'WARD', 'SALESMAN', 7698, 
 to_date('22-2-1981','dd-mm-yyyy'), 
 1250, 500, 30 
);

insert into emp 
values( 
 7654, 'MARTIN', 'SALESMAN', 7698, 
 to_date('28-9-1981','dd-mm-yyyy'), 
 1250, 1400, 30 
);

insert into emp 
values( 
 7844, 'TURNER', 'SALESMAN', 7698, 
 to_date('8-9-1981','dd-mm-yyyy'), 
 1500, 0, 30 
);

insert into emp 
values( 
 7876, 'ADAMS', 'CLERK', 7788, 
 to_date('13-JUL-87', 'dd-mm-rr') - 51, 
 1100, null, 20 
);

insert into emp 
values( 
 7900, 'JAMES', 'CLERK', 7698, 
 to_date('3-12-1981','dd-mm-yyyy'), 
 950, null, 30 
);

insert into emp 
values( 
 7934, 'MILLER', 'CLERK', 7782, 
 to_date('23-1-1982','dd-mm-yyyy'), 
 1300, null, 10 
);

CREATE TABLE PARTICIPANT ( 
partic_id NUMBER, 
nation_id NUMBER, 
main_sport_id NUMBER, 
first_name VARCHAR2(30), 
last_name VARCHAR2(30), 
gender VARCHAR2(1), 
height NUMBER, 
weight NUMBER 
);

INSERT INTO PARTICIPANT VALUES (1, 1, 101, 'John', 'Doe', 'M', 180, 75);

INSERT INTO PARTICIPANT VALUES (2, 2, 102, 'Jane', 'Smith', 'F', 165, 55);

INSERT INTO PARTICIPANT VALUES (3, 3, 103, 'Michael', 'Johnson', 'M', 175, 70);

INSERT INTO PARTICIPANT VALUES (4, 4, 104, 'Emily', 'Davis', 'F', 160, 50);

INSERT INTO PARTICIPANT VALUES (5, 5, 105, 'Chris', 'Brown', 'M', 190, 80);

INSERT INTO PARTICIPANT VALUES (6, 1, 101, 'Sarah', 'Wilson', 'F', 170, 60);

INSERT INTO PARTICIPANT VALUES (7, 2, 102, 'David', 'Lee', 'M', 175, 70);

INSERT INTO participant VALUES (8, 1, 102, 'Laura', 'Johnson', 'F', 160, 55);

CREATE TABLE NATION ( 
    nation_id NUMBER, 
    country_name VARCHAR2(30), 
    population NUMBER 
);

INSERT INTO NATION VALUES (1, 'United States', 331002651);

INSERT INTO NATION VALUES (2, 'India', 1380004385);

INSERT INTO NATION VALUES (3, 'China', 1444216107);

select A.empno, A.ename, A.deptno 
from emp A  
where A,deptno in (select K.deptno 
    				from dept K 
    				where K.dname in ('ACCOUNTING','SALES')) 
ORDER BY A.deptno;

INSERT INTO NATION VALUES (4, 'Brazil', 212559417);

INSERT INTO NATION VALUES (5, 'United Kingdom', 67886011);

INSERT INTO NATION VALUES (6, 'Canada', 37742154);

INSERT INTO NATION VALUES (7, 'Australia', 25788221);

CREATE TABLE SPORT ( 
    sport_id NUMBER PRIMARY KEY, 
    sport_name VARCHAR2(20), 
    max_weight NUMBER, 
    min_weight NUMBER 
);

INSERT INTO SPORT VALUES (101, 'Football', 100, 60);

INSERT INTO SPORT VALUES  (102, 'Basketball', 120, 50);

INSERT INTO SPORT VALUES  (103, 'Tennis', 90, 50);

INSERT INTO SPORT VALUES  (104, 'Swimming', 85, 45);

INSERT INTO SPORT VALUES  (105, 'Gymnastics', 80, 40);

SELECT DISTINCT country_name 
FROM nation n  
WHERE EXISTS( 
    SELECT 1  
    FROM participant p  
    WHERE p.nation_id = n.nation_id 
);

SELECT first_name, height 
FROM PARTICIPANT 
WHERE height > (SELECT AVG(height) FROM PARTICIPANT);

SELECT MAX(height) 
FROM participant 
WHERE height NOT IN (SELECT MAX(height) FROM participant);

SELECT first_name, main_sport_id, weight 
FROM participant 
WHERE weight > (SELECT MAX(weight) FROM participant WHERE main_sport_id = 101);

create table dept( 
  deptno     number(2,0), 
  dname      varchar2(14), 
  loc        varchar2(13), 
  constraint pk_dept primary key (deptno) 
);

create table emp( 
  empno    number(4,0), 
  ename    varchar2(10), 
  job      varchar2(9), 
  mgr      number(4,0), 
  hiredate date, 
  sal      number(7,2), 
  comm     number(7,2), 
  deptno   number(2,0), 
  constraint pk_emp primary key (empno), 
  constraint fk_deptno foreign key (deptno) references dept (deptno) 
);

insert into DEPT (DEPTNO, DNAME, LOC) 
values(10, 'ACCOUNTING', 'NEW YORK');

insert into dept 
values(20, 'RESEARCH', 'DALLAS');

insert into dept 
values(30, 'SALES', 'CHICAGO');

insert into dept 
values(40, 'OPERATIONS', 'BOSTON');

insert into emp 
values( 
 7839, 'KING', 'PRESIDENT', null, 
 to_date('17-11-1981','dd-mm-yyyy'), 
 5000, null, 10 
);

insert into emp 
values( 
 7698, 'BLAKE', 'MANAGER', 7839, 
 to_date('1-5-1981','dd-mm-yyyy'), 
 2850, null, 30 
);

insert into emp 
values( 
 7782, 'CLARK', 'MANAGER', 7839, 
 to_date('9-6-1981','dd-mm-yyyy'), 
 2450, null, 10 
);

insert into emp 
values( 
 7566, 'JONES', 'MANAGER', 7839, 
 to_date('2-4-1981','dd-mm-yyyy'), 
 2975, null, 20 
);

insert into emp 
values( 
 7788, 'SCOTT', 'ANALYST', 7566, 
 to_date('13-JUL-87','dd-mm-rr') - 85, 
 3000, null, 20 
);

insert into emp 
values( 
 7902, 'FORD', 'ANALYST', 7566, 
 to_date('3-12-1981','dd-mm-yyyy'), 
 3000, null, 20 
);

insert into emp 
values( 
 7369, 'SMITH', 'CLERK', 7902, 
 to_date('17-12-1980','dd-mm-yyyy'), 
 800, null, 20 
);

insert into emp 
values( 
 7499, 'ALLEN', 'SALESMAN', 7698, 
 to_date('20-2-1981','dd-mm-yyyy'), 
 1600, 300, 30 
);

insert into emp 
values( 
 7521, 'WARD', 'SALESMAN', 7698, 
 to_date('22-2-1981','dd-mm-yyyy'), 
 1250, 500, 30 
);

insert into emp 
values( 
 7654, 'MARTIN', 'SALESMAN', 7698, 
 to_date('28-9-1981','dd-mm-yyyy'), 
 1250, 1400, 30 
);

insert into emp 
values( 
 7844, 'TURNER', 'SALESMAN', 7698, 
 to_date('8-9-1981','dd-mm-yyyy'), 
 1500, 0, 30 
);

insert into emp 
values( 
 7876, 'ADAMS', 'CLERK', 7788, 
 to_date('13-JUL-87', 'dd-mm-rr') - 51, 
 1100, null, 20 
);

insert into emp 
values( 
 7900, 'JAMES', 'CLERK', 7698, 
 to_date('3-12-1981','dd-mm-yyyy'), 
 950, null, 30 
);

insert into emp 
values( 
 7934, 'MILLER', 'CLERK', 7782, 
 to_date('23-1-1982','dd-mm-yyyy'), 
 1300, null, 10 
) 
 
select A.empno, A.ename, A.deptno 
from emp A  
where A,deptno in (select K.deptno 
    				from dept K 
    				where K.dname in ('ACCOUNTING','SALES')) 
ORDER BY A.deptno;

select sport_id, sport_name, max_weight, min_weight 
from sport 
where sport_id in (select distinct main_sport_id from participant  
    				where height > (select avg(height) from participant) 
);

SELECT deptno, dname, empno, ename, sal 
FROM (SELECT e.deptno, d.dname, e.empno, e.ename, e.sal, 
    	RANK() OVER (PARTITION BY e.deptno ORDER BY e.sal DESC) AS sal_rank 
    FROM emp e  
    JOIN dept d ON e.deptno = d.deptno 
) 
WHERE sal_rank = 1;

select first_name, last_name, height, weight 
from participant 
where (nation_id, gender) in ( 
    select nation_id, 'F' 
    from nation 
    where country_name = 'United States' 
);

CREATE TABLE PARTICIPANT ( 
partic_id NUMBER, 
nation_id NUMBER, 
main_sport_id NUMBER, 
first_name VARCHAR2(30), 
last_name VARCHAR2(30), 
gender VARCHAR2(1), 
height NUMBER, 
weight NUMBER 
);

INSERT INTO PARTICIPANT VALUES (1, 1, 101, 'John', 'Doe', 'M', 180, 75);

INSERT INTO PARTICIPANT VALUES (2, 2, 102, 'Jane', 'Smith', 'F', 165, 55);

INSERT INTO PARTICIPANT VALUES (3, 3, 103, 'Michael', 'Johnson', 'M', 175, 70);

INSERT INTO PARTICIPANT VALUES (4, 4, 104, 'Emily', 'Davis', 'F', 160, 50);

INSERT INTO PARTICIPANT VALUES (5, 5, 105, 'Chris', 'Brown', 'M', 190, 80);

INSERT INTO PARTICIPANT VALUES (6, 1, 101, 'Sarah', 'Wilson', 'F', 170, 60);

INSERT INTO PARTICIPANT VALUES (7, 2, 102, 'David', 'Lee', 'M', 175, 70);

INSERT INTO participant VALUES (8, 1, 102, 'Laura', 'Johnson', 'F', 160, 55);

CREATE TABLE NATION ( 
    nation_id NUMBER, 
    country_name VARCHAR2(30), 
    population NUMBER 
);

INSERT INTO NATION VALUES (1, 'United States', 331002651);

INSERT INTO NATION VALUES (2, 'India', 1380004385);

INSERT INTO NATION VALUES (3, 'China', 1444216107);

INSERT INTO NATION VALUES (4, 'Brazil', 212559417);

INSERT INTO NATION VALUES (5, 'United Kingdom', 67886011);

INSERT INTO NATION VALUES (6, 'Canada', 37742154);

INSERT INTO NATION VALUES (7, 'Australia', 25788221);

CREATE TABLE SPORT ( 
    sport_id NUMBER PRIMARY KEY, 
    sport_name VARCHAR2(20), 
    max_weight NUMBER, 
    min_weight NUMBER 
);

INSERT INTO SPORT VALUES (101, 'Football', 100, 60);

INSERT INTO SPORT VALUES  (102, 'Basketball', 120, 50);

INSERT INTO SPORT VALUES  (103, 'Tennis', 90, 50);

INSERT INTO SPORT VALUES  (104, 'Swimming', 85, 45);

INSERT INTO SPORT VALUES  (105, 'Gymnastics', 80, 40);

SELECT DISTINCT country_name 
FROM nation n  
WHERE EXISTS( 
    SELECT 1  
    FROM participant p  
    WHERE p.nation_id = n.nation_id 
);

SELECT first_name, height 
FROM PARTICIPANT 
WHERE height > (SELECT AVG(height) FROM PARTICIPANT);

SELECT MAX(height) 
FROM participant 
WHERE height NOT IN (SELECT MAX(height) FROM participant);

SELECT first_name, main_sport_id, weight 
FROM participant 
WHERE weight > (SELECT MAX(weight) FROM participant WHERE main_sport_id = 101);

create table dept( 
  deptno     number(2,0), 
  dname      varchar2(14), 
  loc        varchar2(13), 
  constraint pk_dept primary key (deptno) 
);

create table emp( 
  empno    number(4,0), 
  ename    varchar2(10), 
  job      varchar2(9), 
  mgr      number(4,0), 
  hiredate date, 
  sal      number(7,2), 
  comm     number(7,2), 
  deptno   number(2,0), 
  constraint pk_emp primary key (empno), 
  constraint fk_deptno foreign key (deptno) references dept (deptno) 
);

insert into DEPT (DEPTNO, DNAME, LOC) 
values(10, 'ACCOUNTING', 'NEW YORK');

insert into dept 
values(20, 'RESEARCH', 'DALLAS');

insert into dept 
values(30, 'SALES', 'CHICAGO');

insert into dept 
values(40, 'OPERATIONS', 'BOSTON');

insert into emp 
values( 
 7839, 'KING', 'PRESIDENT', null, 
 to_date('17-11-1981','dd-mm-yyyy'), 
 5000, null, 10 
);

insert into emp 
values( 
 7698, 'BLAKE', 'MANAGER', 7839, 
 to_date('1-5-1981','dd-mm-yyyy'), 
 2850, null, 30 
);

insert into emp 
values( 
 7782, 'CLARK', 'MANAGER', 7839, 
 to_date('9-6-1981','dd-mm-yyyy'), 
 2450, null, 10 
);

insert into emp 
values( 
 7566, 'JONES', 'MANAGER', 7839, 
 to_date('2-4-1981','dd-mm-yyyy'), 
 2975, null, 20 
);

insert into emp 
values( 
 7788, 'SCOTT', 'ANALYST', 7566, 
 to_date('13-JUL-87','dd-mm-rr') - 85, 
 3000, null, 20 
);

insert into emp 
values( 
 7902, 'FORD', 'ANALYST', 7566, 
 to_date('3-12-1981','dd-mm-yyyy'), 
 3000, null, 20 
);

insert into emp 
values( 
 7369, 'SMITH', 'CLERK', 7902, 
 to_date('17-12-1980','dd-mm-yyyy'), 
 800, null, 20 
);

insert into emp 
values( 
 7499, 'ALLEN', 'SALESMAN', 7698, 
 to_date('20-2-1981','dd-mm-yyyy'), 
 1600, 300, 30 
);

insert into emp 
values( 
 7521, 'WARD', 'SALESMAN', 7698, 
 to_date('22-2-1981','dd-mm-yyyy'), 
 1250, 500, 30 
);

insert into emp 
values( 
 7654, 'MARTIN', 'SALESMAN', 7698, 
 to_date('28-9-1981','dd-mm-yyyy'), 
 1250, 1400, 30 
);

insert into emp 
values( 
 7844, 'TURNER', 'SALESMAN', 7698, 
 to_date('8-9-1981','dd-mm-yyyy'), 
 1500, 0, 30 
);

insert into emp 
values( 
 7876, 'ADAMS', 'CLERK', 7788, 
 to_date('13-JUL-87', 'dd-mm-rr') - 51, 
 1100, null, 20 
);

insert into emp 
values( 
 7900, 'JAMES', 'CLERK', 7698, 
 to_date('3-12-1981','dd-mm-yyyy'), 
 950, null, 30 
);

insert into emp 
values( 
 7934, 'MILLER', 'CLERK', 7782, 
 to_date('23-1-1982','dd-mm-yyyy'), 
 1300, null, 10 
) 
 
select A.empno, A.ename, A.deptno 
from emp A  
where A,deptno in (select K.deptno 
    				from dept K 
    				where K.dname in ('ACCOUNTING','SALES')) 
ORDER BY A.deptno;

'''실습 sport테이블에서 각 스포츠 종목별로 키가 평균키보다 큰 선수들의 정보를 출력해보세요''' 


select sport_id, sport_name, max_weight, min_weight 
from sport 
where sport_id in (select distinct main_sport_id from participant  
    				where height > (select avg(height) from participant) 
);

'''다중컬럼 서브쿼리''' 


'''예시 부서별로 가장 높은 급여를 받는 사원을 찾는 sql문 ''' 


SELECT deptno, dname, empno, ename, sal 
FROM (SELECT e.deptno, d.dname, e.empno, e.ename, e.sal, 
    	RANK() OVER (PARTITION BY e.deptno ORDER BY e.sal DESC) AS sal_rank 
    FROM emp e  
    JOIN dept d ON e.deptno = d.deptno 
) 
WHERE sal_rank = 1;

'''실습: 국가id가 1(us)이고 성별이 f인 선수의 정보를 출력해 보세요''' 


select first_name, last_name, height, weight 
from participant 
where (nation_id, gender) in ( 
    select nation_id, 'F' 
    from nation 
    where country_name = 'United States' 
);

CREATE TABLE Participant_B ( 
    partic_id NUMBER PRIMARY KEY, 
    nation_id NUMBER, 
    main_sport_id NUMBER, 
    first_name VARCHAR2(30), 
    last_name VARCHAR2(30), 
    gender VARCHAR2(1), 
    height NUMBER, 
    weight NUMBER 
);

INSERT INTO Participant_B VALUES (1, 1, 3, 'John', 'Doe', 'M', 180, 75);

INSERT INTO Participant_B VALUES (2, 2, NULL, 'Jane', 'Smith', 'F', 165, 55);

INSERT INTO Participant_B VALUES (3, 3, NULL, 'Michael', 'Johnson', 'M', 175, 70);

INSERT INTO Participant_B VALUES (4, 4, 2, 'Emily', 'Davis', 'F', 160, 50);

INSERT INTO Participant_B VALUES (5, 5, NULL, 'Chris', 'Brown', 'M', 190, 80);

INSERT INTO Participant_B VALUES (6, 1, 3, 'Sarah', 'Wilson', 'F', 170, 60);

INSERT INTO Participant_B VALUES (7, 2, NULL, 'David', 'Lee', 'M', 175, 70);

CREATE TABLE sport_B ( 
    sport_id NUMBER PRIMARY KEY, 
    sport_name VARCHAR2(30) 
);

INSERT INTO sport_B (sport_id, sport_name) VALUES (1, '100미터 달리기');

INSERT INTO sport_B (sport_id, sport_name) VALUES (2, '수영');

INSERT INTO sport_B (sport_id, sport_name) VALUES (3, '농구');

SELECT A.EMPNO, A.ENAME, A.DEPTNO, 
(SELECT L.DNAME FROM DEPT L WHERE L.DEPTNO = A.DEPTNO ) AS DNAME 
FROM EMP A 
WHERE A.DEPTNO IN (SELECT K.DEPTNO 
				FROM DEPT K 
				WHERE K.DNAME IN ('ACCOUNTING', 'SALES')) 
ORDER BY A.DEPTNO;

select rownum, ename 
from emp 
where rownum <= 5;

select rownum, ename 
from emp 
where rownum <= 5 
order by ename;

select rownum, ename 
from (select ename from emp order by ename) 
where rownum <= 5;

select e.empno, e.ename, e.job, d.dname, d.loc 
from (select empno, ename, job, deptno 
    from emp) e  
inner join dept d on e.deptno = d.deptno;

select partic_id, first_name, last_name, nation_id, height 
from participant  
where height < (select avg(height) 
    			from participant 
);

select first_name, height, weight, main_sport_id 
from participant  
where weight > (select avg(weight) 
    			from participant 
    			having avg(weight) > (select avg(weight) 
    									from participant 
    									where height <= 170));

update Participant_B 
set main_sport_id = ( 
    select sport_id 
    from Sport_B 
    where sport_name = '100미터 달리기' 
    ) 
where main_sport_id is null;

select * from participant;

