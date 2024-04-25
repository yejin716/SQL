#테이블 합치기 join

#테이블 생성 (mypokemon, ability)

drop database if exists pokemon;
create database pokemon;
use pokemon;

create table mypokemon(
		number int,
        name varchar(20),
        type varchar(20)
);

insert into mypokemon(number,name,type)
values (10, 'caterpie', 'bug'), 
(25, 'pikachu', 'electric'), 
(26, 'raichu', 'electric'), 
(133, 'eevee', 'normal'), 
(152, 'chikoirita', 'grass');

create table ability(
	number int,
    height float,
    weight float,
    attack int,
    defense int,
    speed int);
    
insert into ability(number, height, weight, attack, defense, speed)
VALUES (10, 0.3, 2.9, 30, 35, 45), 
(25, 0.4, 6, 55, 40, 90), 
(125, 1.1, 30, 83, 57, 105), 
(133, 0.3, 6.5, 55, 50, 55), 
(137, 0.8, 36.5, 60, 70, 40), 
(152, 0.9, 6.4, 49, 65, 45), 
(153, 1.2, 15.8, 62, 80, 60), 
(172, 0.3, 2, 40, 15, 60), 
(470, 1, 25.5, 110, 130, 95);

#join 함수 inner join, left join, right join, cross join. self join
#inner join
select *
from mypokemon
inner join ability
on mypokemon.number = ability.number;
-- ---------------------------------------------------------------------------
#left join, right join
select *
from mypokemon
left join ability
on mypokemon.number = ability.number;
-- ---------------------------------------------------------------------------
#right join
select *
from mypokemon
right join ability
on mypokemon.number = ability.number;
-- ---------------------------------------------------------------------------
#outer join
select *
from mypokemon
left join ability
on mypokemon.number = ability.number
union
select *
from mypokemon
right join ability
on mypokemon.number = ability.number;
-- ---------------------------------------------------------------------------
#cross join 하나씩 각각 연결됨 
select * 
from mypokemon
cross join ability;
-- ---------------------------------------------------------------------------
#self join
select * from mypokemon as t1
inner join mypokemon as t2
on t1.number = t2.number;
-- ---------------------------------------------------------------------------
#실습
drop database if exists pokemon;

create database pokemon;
use pokemon;

create table mypokemon(
	number int,
    name varchar(20),
    type varchar(20)
    
    );
    
insert into mypokemon(number, name, type)
values (10, 'caterpie', 'bug'),
(25, 'pikachu', 'electric'),
(26, 'raichu', 'electric'),
(133, 'eevee', 'normal'),
(152, 'chikoirita', 'grass');

CREATE TABLE ability (
number INT,
height FLOAT,
weight FLOAT,
attack INT,
defense INT,
speed int
);
INSERT INTO ability (number, height, weight, attack, defense, speed)
VALUES (10, 0.3, 2.9, 30, 35, 45),
(25, 0.4, 6, 55, 40, 90),
(125, 1.1, 30, 83, 57, 105),
(133, 0.3, 6.5, 55, 50, 55),
(137, 0.8, 36.5, 60, 70, 40),
(152, 0.9, 6.4, 49, 65, 45),
(153, 1.2, 15.8, 62, 80, 60),
(172, 0.3, 2, 40, 15, 60),
(470, 1, 25.5, 110, 130, 95);

select * from ability;

-- ---------------------------------------------------------------------------
#미션 0 (inner) join ()생략가능
select *
from mypokemon
join ability
on mypokemon.number = ability.number;

#미션 1 
select name, attack, defense
from mypokemon
left join ability
on mypokemon.number = ability.number;

#미션 2 
#on에서 생성된 컬럼을 불려올려면 어느 테이블에서 가져올건지 입력
select ability.number, name 
from mypokemon
right join ability
on mypokemon.number = ability.number;

#테이블을 합쳐 원하는 값을 가져오자
#mission 1 
select type, AVG(height)
from mypokemon
left join ability
on mypokemon.number = ability.number
group by type;

#mission 2 
select type, AVG(weight)
from mypokemon
left join ability
on mypokemon.number = ability.number
group by type;

#mission 3
select type, AVG(height), AVG(weight)
from mypokemon
left join ability
on mypokemon.number = ability.number
group by type;

#mission 4 **
select mypokemon.number,name,attack,defense
from mypokemon
left join ability
on mypokemon.number = ability.number
where mypokemon.number >= 100;

#mission 5
select name
from mypokemon
left join ability
on mypokemon.number = ability.number
order by attack + defense desc; 

#mission 6 
select name
from mypokemon
left join ability
on mypokemon.number = ability.number
order by ability.speed desc
limit 1;



