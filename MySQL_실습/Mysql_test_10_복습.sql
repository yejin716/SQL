#서브쿼리 복습
select * from ability;
select * from mypokemon;

#미션1 
#내 포켓몬 중에 몸무게가 가장 많이 나가는 포켓몬의 번호를 가져와 주세요.
select number 
from ability
where weight = (select max(weight) from ability);

#미션2  
#속도가 모든 전기 포켓몬의 공격력보다 하나라도 작은 포켓몬의 번호를 가져와 주세요
select number
from ability
where speed < any(select attack from ability where type = 'electric');

#미션3
#공격력이 방어력보다 큰 포켓몬이 있다면 모든 포켓몬의 이름을 가져와 주세요.
select name
from mypokemon
where exists (select * from ability where attack > defense);  

#미션1
#이브이의 번호 133을 활용해서, 이브이의 영문 이름, 키, 몸무게를 가져와 주세요.
#이 때, 키는 height, 몸무게는 weight이라는 별명으로 가져와 주세요.
select (select name from mypokemon where number = 133) as name, height, weight
from ability
where number = 133;

#미션2
#속도가 2번째로 빠른 포켓몬의 번호와 속도를 가져와 주세요.
select number, speed
from (select number,speed, rank()over(order by speed desc) as speed_rank from ability)as a
where a.speed_rank = 2;

#미션3
#방어력이 모든 전기 포켓몬의 방어력보다 큰 포켓몬의 이름을 가져와 주세요.

select name
from mypokemon
where number in 
(select number from ability 
where defense > all(select defense from ability where type = 'electric'));

select name
from mypokemon as a
join ability as b 
on a.number = b.number
where defense > all(select defense from ability where type = 'electric');

#예제
#물 속성의 포켓몬 중에서 키가 가장 큰 포켓몬의 이름을 찾아주세요.
select name
from mypokemon as a
join ability as b
on a.number = b.number
where height = (select max(height) from ability where type = 'grass');

select name
from mypokemon
where number = (select number from ability 
where height = (select max(height) from ability where type = 'grass'));

#예제
#전체 포켓몬 중에서 평균 공격력보다 높은 공격력을 갖는 
#포켓몬의 번호와 이름을 찾아주세요.

select number,name
from mypokemon
where number = (select number from ability 
where attack > (select avg(attack) from ability));

select a.number,name
from mypokemon as a
join ability as b
on a.number = b.number
where attack > (select avg(attack) from ability);


