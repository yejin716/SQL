#조건에 맞는 데이터 가져오기
#조건 : where

select 1 = 1;
select 1 = 0;
#1 : True 0: False

show databases;
use pokemon;

select * from mypokemon;

#요청 : pikachu의 number
select number from mypokemon
where name = "pikachu";

#요청 : 속도가 50보다 큰 포켓몬 이름 찾아줘
select name from mypokemon
where speed >= 50;

#요청 : 전기타입이 아닌, 포켓몬 이름 찾기 
select name from mypokemon
where (type != 'electric');
-- where not(type = 'electric');

#요청 : 속도가 100이하이고 타입이 전기인 포켓몬 이름 찾기
select name from mypokemon
where (speed <= 100 ) and (type = 'electric');

#요청 : 벌레 타입이거나 노말 타입인 포켓몬 이름 찾기
select name from mypokemon
where (type = 'bug') or (type = 'normal');

#요청 : 속도가 100이하이고 타입이 벌레가 아닌 포켓몬 이름 찾기
select name from mypokemon
where (speed <= 100 ) and (type != 'bug');

#요청: 속도가 50과 100사이인, 포켓몬 이름 찾기
select name from mypokemon
where speed between 50 and 100;

#요청 : 벌레타입이거나 노말타입인 포켓몬의 이름 찾기 
select name from mypokemon
where type in ('bug','normal'); 
#where (type = 'bug') and (type = 'normal')과 같다. 

#요청 : 이름이 'chu'로 끝나는, 포켓몬 이름 찾기
select name from mypokemon
where name like '%chu';

#요청 : 이름에 'a'가 포함되는 포켓몬 이름 찾기
select name from mypokemon
where name like "%a%";

#요청 : 이름에 'a'로 시작되는 포켓몬 이름 찾기
select name from mypokemon
where name like "c%";

#null 데이터 다루기

select * from mypokemon;

insert into mypokemon(name,type)
values('kkobuki',"");

#요청 : number 가 null인 포켓몬 이름을 찾아줘 
#is null
select name from mypokemon
where number is null;

#요청 : type이 null이 아닌, 포켓몬이름 찾기
select name from mypokemon
where type is not null;


#미션 1
select type from mypokemon
where name = 'eevee';

#미션 2
select attack, defense from mypokemon
where name = 'caterpie';

#미션 3
select * from mypokemon
where weight > 6;

#미션 4
select name from mypokemon
where (height > 0.5) and (weight >= 6);

#미션 5
select name as 'weak_pokemon' from mypokemon
where (attack < 50) or (defense < 50);

#미션6
select * from mypokemon
where type != 'normal';

#미션7
select name, type from mypokemon
where type in ('normal','fire','water','grass');

#미션 8
select name, attack from mypokemon
where attack between 40 and 60;

#미션9
select name from mypokemon
where name like '%e%';

#미션 10
select * from mypokemon
where (name like '%i%') and (speed <= 50);

#미션 11
select name, height, weight from mypokemon
where name like '%chu';

#미션12
select name, defense from mypokemon
where (name like '%e') and (defense < 50);

#미션 13
select name, attack, defense from mypokemon
where abs(attack - defense) >= 10;

#미션14
select name, (attack+defense+speed) as total from mypokemon
where (attack+defense+speed) >= 150;

