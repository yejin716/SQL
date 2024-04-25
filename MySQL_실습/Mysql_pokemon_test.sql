create database pokemon;

use pokemon;

create table mypokemon(
	number int,
    name varchar(20),
    type varchar(20),
    height float,
    weight float,
    attack float,
    defense float,
    speed float
);

insert into mypokemon(number, name, type, height, weight, attack, defense, speed)
values  (10,"caterpie","bug",0.3,2.9,30,35,45),
		(25,"pikachu","electric",0.4,6,55,40,90),
        (26,"raichu","electric",0.8,30,90,55,110),
        (133,"eevee","normal",0.3,6.5,55,50,55),
        (152,"chikorita","grass",0.9,6.4,49,65,45)
;

#테이블에 전체 값 확인
select * from mypokemon;
 
# table에서 특정 컬럼 내용 가져오기
select name from mypokemon;

#as (별칭) 만들기
select number as national_number from mypokemon;

#number, name 행 다 가져오기
select number, name from mypokemon;

#데이터 일부 가져오기 limit
#limit : 가져올 데이터 row 개수 지정 키워드
select number, name from mypokemon
limit 2;

#중복제거하기 Distinct : 중복데이터 제외/ 같은 값은 한번만
select distinct type from mypokemon;

#미션1
select 123 * 456;
#미션 2
select 2310 / 30;
#미션 3 
#답안
-- select '피카츄' as '포켓몬';
select name as "포켓몬" from mypokemon
where name = "pikachu";

#미션 4
select * from mypokemon;
#미션 5
select name from mypokemon;
#미션 6
select name, height, weight from mypokemon;
#미션 7
select distinct height from mypokemon;
#미션 8
select name, (attack * 2) as attack2 from mypokemon;
#미션 9
select name as "이름" from mypokemon;
#미션 10
select attack as "공격력", defense as "방어력" from mypokemon;
#미션 11
select round((height * 100),2) as "height(cm)" from mypokemon;
#미션 12
select * from mypokemon
limit 1;
#미션 13
select name as "영문명", height as "키(m)", weight as "몸무게(kg)" from mypokemon
limit 2;
#미션 14
select name, (attack+defense+speed) as total from mypokemon;
#미션 15
select name, round(weight / pow(height,2),2) as BMI from mypokemon;

#select power(10,2); pow(10,2);




