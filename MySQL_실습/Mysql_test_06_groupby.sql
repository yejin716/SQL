#데이터 그룹화하기

#반드시 암기
#셀프웨 그룹해 정렬
#select / from/ where / group by / having / order by 

use pokemon;
select * from mypokemon;

drop database if exists pokemon;

-- crud의 delete (DML) / drop (DDL)

-- 새로운 DB. TABLE 생성 
CREATE DATABASE pokemon;
USE pokemon;

CREATE TABLE mypokemon(
		number int,
        name varchar(20),
        type varchar(10),
        height float,
        weight float
);

insert into mypokemon(number, name, type, height, weight)
values   (10, 'caterpie', 'bug', 0.3, 2.9),
			(25, 'pikachu', 'electric', 0.4, 6),
			(26, 'raichu', 'electric', 0.8, 30),
			(125, 'electabuzz', 'electric', 1.1, 30),
			(133, 'eevee', 'normal', 0.3, 6.5),
			(137, 'porygon', 'normal', 0.8, 36.5),
			(152, 'chikoirita', 'grass', 0.9, 6.4),
			(153, 'bayleef', 'grass', 1.2, 15.8),
			(172, 'pichu', 'electric', 0.3, 2),
			(470, 'leafeon', 'grass', 1, 25.5);
            
select * from mypokemon;

-- 타입 확인
select type from mypokemon;

-- type별로 그룹화해서 type 확인 
select type from mypokemon
group by type;

-- 그룹에 조건 걸어 데이터 추출하기 
select type, count(*), count(1), avg(height), max(weight)
from mypokemon
group by type;

-- having 은 그룹함수 (그룹에 조건 걸기)
select type, count(*), count(1), avg(height), max(weight)
from mypokemon
group by type
having count(1) = 2;

-- 반드시 암기 
-- select, from, where, group by, having, order by 
-- 셀, 프, 웨, 그룹, 해, 오 (정렬)
-- having 그룹함수에 쓸수 있는 count(), max(), min(), sum(), avg()

select type, count(1), count(*), max(weight)
from mypokemon; -- count(1), max() 그룹함수 존재해야함. 



select min(name) , type, count(1), max(weight)
from mypokemon
where name like '%a%' -- 조건 
group by type -- 그룹화
having max(height) > 1 -- 그룹 조건
order by 4; -- 정렬 

-- mission : 데이터 그룹화 통계를 내보자 
-- 미션 1
select type, avg(weight)
from mypokemon
where length(name) > 5
group by type
having avg(weight) >= 20
order by 2 desc;

-- 미션 2
select type, min(height), max(height)
from mypokemon
where number < 200
group by type
having (max(weight) >= 10) and (min(weight) >= 2)
order by 2 desc, 3 desc;

#실습 2 
#mission 1 
select type, round(avg(height),2)
from mypokemon
group by type;

#mission 2
select type, round(avg(weight), 2)
from mypokemon
group by type;

#mission 3
select type, avg(height), avg(weight)
from mypokemon
group by type;

#mission 4
select type
from mypokemon
group by type 
having avg(height) >= 0.5;

#mission 5
select type
from mypokemon
group by type
having avg(weight) >= 20;

#mission 6
select type, sum(number)
from mypokemon
group by type;

#mission 7 **
select type, count(1)
from mypokemon
where height >= 0.5
group by type;

#mission 8 
select type, min(height)
from mypokemon
group by type;

#mission 9 
select type, max(weight)
from mypokemon
group by type;

#mission 10
select type
from mypokemon
group by type
having min(height) > 0.5 and max(weight) < 30;