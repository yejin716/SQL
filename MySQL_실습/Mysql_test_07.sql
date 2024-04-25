use pokemon;

select * 
from mypokemon;

drop database if exists pokemon;

create database pokemon;
use pokemon;

create table mypokemon(
	number int,
    name varchar(20),
    type varchar(20),
    attack int,
    defense int
    );
    
show tables;

insert into mypokemon(number, name, type, attack, defense)
values   (10, 'caterpie', 'bug', 30, 35),
			(25, 'pikachu', 'electric', 55, 40),
		    (26, 'raichu', 'electric', 90, 55),
		    (125, 'electabuzz', 'electric', 83, 57),
	        (133, 'eevee', 'normal', 55, 50),
            (137, 'porygon', 'normal', 60, 70),
			(152, 'chikoirita', 'grass', 49, 65),
			(153, 'bayleef', 'grass', 62, 80),
			(172, 'pichu', 'electric', 40, 15),
			(470, 'leafeon', 'grass', 110, 130);
            
select * from mypokemon;

#조건문 IF
select name, 
		if( attack > 60, 'strong','weak') as attack_class
from mypokemon;
-- -----------------------------------------------------------------

#if null
#데이터가 null인지 확인 >> null이라면 새로운 값 반환 
#cf. is null : 데이터가 null인지 확인

select name, ifnull(name, 'unknown') as full_name
from mypokemon;
-- -----------------------------------------------------------------       
#case :조건이 여러 개 있을 때 
#case
# 		when     then
#       else
# end as 
-- -----------------------------------------------------------------
select name,
case
	  when attack >= 100 then 'very strong'
	  when attack >= 80 then 'strong'
	  when attack >= 60 then 'normal'
	  else ' weak'
end as attack_class
from mypokemon;
-- -----------------------------------------------------------------
select name,
case 
	  when defense >=100 then 'very strong'
	  when defense >=60 then 'strong'
	  when defense >=50 then 'normal'
      else 'weak'
end as defense_class
from mypokemon;
-- -----------------------------------------------------------------
select name, type,
case type
	when 'bug' then 'grass'
	when 'electric' then 'water'
	when 'grass' then 'bug'
end as rival_type
from mypokemon;
-- -----------------------------------------------------------------
# 함수 만들기 function
-- CREATE FUNCTION [함수 이름] ( [입력값 이름] [데이터 타입], …) 
-- 				RETURNS [결과값 데이터 타입]
-- BEGIN
-- 				DECLARE [임시값 이름] [데이터 타입];
-- 				SET [임시값 이름] = [입력값 이름];
-- 				쿼리;
-- 				RETURN 결과값
-- END

-- -----------------------------------------------------------------
show global variables like 'log_bin_trust_function_creators';
SET GLOBAL log_bin_trust_function_creators = 1;
#함수 선언
DELIMITER //
create function get_ability(attack int, defense int)
	returns int
BEGIN
	declare a int;
    declare b int;
	declare ability int;
    set a = attack;
    set b = defense;
    select a + b into ability;
    return ability;
END
//
DELIMITER ;

select get_ability(50, 50);
-- -----------------------------------------------------------------
#함수 선언
DELIMITER //
create function get_ability_poke(attack int, defense int)
		returns int
    
BEGIN 
		declare ability int;
        set ability = attack + defense;
        return ability;
END
//
DELIMITER ;

select get_ability_poke(100,100);
-- -----------------------------------------------------------------
#미션 if-elseif-else 이용하여 함수 
DELIMITER //

create function isStrong(attack int, defense int)
	returns varchar(20)
BEGIN
	declare result varchar(20);
    
    if attack + defense > 120 then
		set result = 'very strong';
	elseif attack + defense > 90 then
		set result = 'strong';
	else 
		set result = 'not strong';
	end if;
    
    return result;
END
//
DELIMITER ;

SELECT name, isStrong(attack, defense) AS isStrong
FROM mypokemon;

select isStrong(60,70);
-- -----------------------------------------------------------------
#미션 case문으로 함수만들기 

DELIMITER //
create function isStrong_case(attack int, defense int)
	returns varchar(20)
BEGIN
		return case
			when attack + defense > 120 then 'veay strong'
			when attack + defense > 90 then 'strong'
			else 'not strong'
		end;
END//
DELIMITER ;
#함수 삭제 drop function get_ability_poke;

select isStrong_case(40,55) as result
-- -----------------------------------------------------------------
DELIMITER //
create function isStrong_2(attack int, defense int)
	returns varchar(20)
BEGIN
	declare a int;
	declare b int;
	declare result varchar(20);
	declare ability varchar(20);
    set a = attack;
    set b = defense;
    select a + b into result;
    
     if result > 120 then
		set ability = 'very strong';
	elseif result  > 90 then
		set ability = 'strong';
	else 
		set ability = 'strong';
	end if;
    return ability;
END
//
DELIMITER ;

SELECT name, isStrong(attack, defense) AS isStrong
FROM mypokemon;

-- -----------------------------------------------------------------
#mission 1 
select name, 
		if(number < 150, 'old','new') as age
from mypokemon;
-- -----------------------------------------------------------------
#mission 2 
select name, 
	if(attack + defense < 100, 'weak','strong') as ability
from mypokemon;
-- case
-- 	when attack + defense < 100 then 'weak'
-- 	when attack + defense >= 100 then 'strong'
-- end as ability
-- from mypokemon;
-- -----------------------------------------------------------------
#mission 3
select type,
	if(avg(attack) >= 60, True, False) as  is_Strong_type
from mypokemon
group by type;
-- -----------------------------------------------------------------
#mission 4
select name, 
	if(attack > 100 and defense > 100, True, False) as ace
-- case
-- 	when attack > 100 and defense > 100 then 1
-- 	when attack < 100 or defense < 100 then 0
-- end as ace
from mypokemon;
-- -----------------------------------------------------------------
#mission 5
select name,
case 
		when number < 100 then '<100'
		when number < 200 then '<200'
		when number < 500 then '<500'
end as number_bin
from mypokemon;
-- -----------------------------------------------------------------
#mission 6
select name, 
case 	
		when attack >= 50 and number >= 150 then 'new_strong'
		when attack >= 50 and number < 150 then 'old_strong'
		when attack < 50 and number >= 150 then 'new_weak'
		when attack < 50 and number < 150 then 'old_weak'
end as age_attack
from mypokemon;

-- -----------------------------------------------------------------
#mission 7
-- DELIMITER //
-- create function count_type()
-- 	returns varchar(20)
-- BEGIN
--     declare num_count int;
--     declare ctype int;
-- 	declare result varchar(20);

--     select count(*) into num_count;
--     select count(*) into ctype
--     from ( select distinct type) as type_table ;

--     if num_count = 1 then
-- 		set result ='solo';
-- 	elseif num_count < 3 then 
-- 		set result ='minor';
-- 	else 
-- 		set result = 'major';
-- 	end if;
--     return result;
-- END //

-- DELIMITER ;

-- select type, count_type() as count_by_type
-- from mypokemon;

select type, 
case
	when count(name) = 1 then 'solo'
	when count(name) < 3 then 'minor'
	else 'major'
end as count_by_type
from mypokemon
group by type;
