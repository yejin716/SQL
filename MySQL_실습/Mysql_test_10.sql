# 조건에 조건 더하기 
# sub query 쓸 수 있는 쿼리 명령문은?alter
# >> group by 빼고 다 ~ 대부분 select, from, where 

#select 절의 sub query(배태컬) >> 반드시 결과값이 '하나의 값(value)'
#from >> 하나의 테이블(table) as 별명
#where >> 하나의 컬럼(column) >> where 컬연서 (column, 연산자, 서브쿼리) 


DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
number INT,
name VARCHAR(20)
);

INSERT INTO mypokemon (number, name)
VALUES (10, 'caterpie'),
(25, 'pikachu'),
(26, 'raichu'),
(133, 'eevee'),
(152, 'chikoirita');

CREATE TABLE ability (
number INT,
type VARCHAR(10),
height FLOAT,
weight FLOAT,
attack INT,
defense INT,
speed int
);


INSERT INTO ability (number, type, height, weight, attack, defense, speed)
VALUES (10, 'bug', 0.3, 2.9, 30, 35, 45),
(25, 'electric', 0.4, 6, 55, 40, 90),
(26, 'electric', 0.8, 30, 90, 55, 110),
(133, 'normal', 0.3, 6.5, 55, 50, 55),
(152, 'grass', 0.9, 6.4, 49, 65, 45);

#특정 이름으로 데이터 추출
select number, name
from mypokemon
where name = 'pikachu';

#select절에 서브쿼리 적용 (서브쿼리 : 결과값이 '하나의 값')
select number, name,
	(select height 
    from ability
    where number = 25) as height
from mypokemon
where name = 'pikachu';
-- ---------------------------------------------------------------------------
#from절 서브 쿼리 실습 >> 반드시 결과값이 '하나의 테이블'
#(**) 반드시 아무 별명을 가져야 함 
#이 절을 from절에 입력
select number, rank()over (order by height) as height_rank
from ability;

select number, height_rank
from (select number, rank()over(order by height) as height_rank from ability) as a 
where height_rank = 3;
-- ---------------------------------------------------------------------------
#where절 서브쿼리 
#where 절의 서브쿼리는 반드시 결과값이 '하나의 컬럼'
#단, exists 제외
#연산자와 함께 사용 (컬연서) column, 연산자, seb query
#단, 비교연산자만 사용시, 반드시 하나의 값!

select number
from ability;

select number
from ability
where height < (select avg(height) from ability);

#all : 모든 / any : 하나라도 / exists : 존재하면
select number
from ability
where attack < all(select attack from ability where type ='electric');
-- ---------------------------------------------------------------------------
#미션
#mission 1 
select number
from ability
where weight = (select max(weight) from ability);
-- ---------------------------------------------------------------------------
#mission 2 
select number
from ability
where speed < any(select attack from ability where type = 'electric');
-- ---------------------------------------------------------------------------
#mission 3
select name
from mypokemon
where exists (select * from ability where attack > defense);
-- ---------------------------------------------------------------------------
#mission (1) 
#이브이의 번호 133을 활용해서, 이브이의 영문 이름, 키, 몸무게를 가져와 주세요.
# 이 때, 키는 height, 몸무게는 weight이라는 별명으로 가져와 주세요 

select * from ability;

select name,
	(select height from ability where number = 133) as height,
    (select weight from ability where number = 133) as weight
from mypokemon
where number = 133;

#답안)
select (select name from mypokemon where number = 133) as name,height,weight
from ability
where number = 133;
-- -----------------------------------------------------------------------------
#mission 2
#속도가 2번째로 빠른 포켓몬의 번호와 속도를 가져와 주세요
SELECT number, speed
FROM ability
WHERE speed = (
    SELECT MAX(speed)
    FROM ability
    WHERE speed < (
        SELECT MAX(speed)
        FROM ability
    )
);

#답안)
select number, speed 
from (select number, speed, 
	rank()over(order by speed desc) as speed_rank from ability) as a
where a.speed_rank = 2;
-- -----------------------------------------------------------------------------


#mission 3 
#방어력이 모든 전기 포켓몬의 방어력보다 큰 포켓몬의 이름을 가져와 주세요.

 #답안
 -- 방어력이 전기 포켓몬
 select number 
 from ability
 where defense > all(select defense from ability where type = 'electric');
 
 select name
 from mypokemon
 where number 
 in (select number 
	from ability
	where defense > all(select defense from ability where type='electric'));
    
#답안 2
select name
from mypokemon as a
join ability as b
on a.number = b.number
where defense >	all(select defense from ability where type='electric');	
-- ----------------------------------------------------------------------------
#질의문답 any와 max
drop table capability;

create table capability(
number int auto_increment primary key, #자동으로 증가 +1
name varchar(20),
type varchar(20),
attack int,
defense int,
speed int);

insert into capability(name, type, attack, defense, speed) values  
('Pikachu', 'electric', 55, 40, 45),
('Raichu', 'electric', 85, 50, 110),
('Jolteon', 'electric', 65, 60, 130),
('Zapdos', 'electric', 90, 85, 100),
('Electabuzz', 'electric', 83, 57, 105),
('Bulbasaur', 'grass', 49, 49, 45);	

select * from capability;	
select attack from capability where type = 'electric';

select *
from capability
where speed < any(select attack from capability where type = 'electric');

SELECT *
FROM capability
WHERE speed < (SELECT max(attack) FROM capability WHERE type = 'electric');
	