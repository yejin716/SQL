drop database if exists pokemon;
create database pokemon;
use pokemon;

create table mypokemon(
number int,
name varchar(20),
type varchar(20),
attack int,
defense int);

create table friendpokemon(
number int,
name varchar(20),
type varchar(10),
attack int,
defense int);

INSERT INTO mypokemon (number, name, type, attack, defense)
VALUES 	(10, 'caterpie', 'bug', 30, 35),
		(25, 'pikachu', 'electric', 55, 40),
		(26, 'raichu', 'electric', 90, 55),
		(133, 'eevee', 'normal', 55, 50),
		(152, 'chikoirita', 'grass', 49, 65);

INSERT INTO friendpokemon (number, name, type, attack, defense)
VALUES  (26, 'raichu', 'electric', 80, 60),
		(125, 'electabuzz', 'electric', 83, 57),
		(137, 'porygon', 'normal', 60, 70),
		(153, 'bayleef', 'grass', 62, 80),
		(172, 'pichu', 'electric', 40, 15),
		(470, 'leafeon', 'grass', 110, 130);


#union / union all

#union all : 두 테이블 중복 허락 
select name 
from mypokemon
union all
select name 
from friendpokemon;

#union : 두 테이블 중복 제거 
select name 
from mypokemon
union 
select name 
from friendpokemon;

#union - order by
select number, name, attack 
from mypokemon
union
select number, name, attack  
from friendpokemon
order by number;
#order by는 쿼리 가장 마지막에 작성
# 쿼리 A문에 가져온 컬럼으로만 가능 
-- ---------------------------------------------------------------------------
#데이터에서 데이터 빼기 
#교집합, 차집합 >> join으로 사용

#교집합 (intersect) sql X 
select a.name
from mypokemon as a
join friendpokemon as b
on a.name = b.name;

#교집합 (주어진 모든 조건에 일치하는 포켓몬 이름 반환)
select a.name
from mypokemon as a
join friendpokemon as b
on (a.name = b.name)and(a.number = b.number)and
(a.type = b.type)and(a.attack = b.attack)and(a.defense = b.defense);
-- ---------------------------------------------------------------------------
#차집합 (minus) sql x
#b is null >> a의 테이블값만 추출
select a.name
from mypokemon as a 
left join friendpokemon as b
on a.name = b.name
where b.name is null;

#차집합 (조건)
select a.name
from mypokemon as a
left join friendpokemon as b
on (a.name = b.name)and(a.number = b.number)and
(a.type = b.type)and(a.attack = b.attack)and(a.defense = b.defense)
where b.name is null;
-- ---------------------------------------------------------------------------
#미션 1
select type
from mypokemon
union
select type
from friendpokemon;
-- ---------------------------------------------------------------------------
#미션2
select number, name
from mypokemon
where type ='grass'
union all
select number, name
from friendpokemon
where type ='grass';
-- ---------------------------------------------------------------------------
#mission 1 
select a.name
from mypokemon as a
join friendpokemon as b
on a.name = b.name;
-- ---------------------------------------------------------------------------
#mission 2 
select a.name
from mypokemon as a 
left join friendpokemon as b
on a.name = b.name
where b.name is null;
-- ---------------------------------------------------------------------------