#원하는 데이터 만들기 
#예) 10번이상 구매한, vip고객 리스트 추출 (조건)
#예) 10번이상 구매한, vip고객을 [구매금액 순]으로 리스트 추출 
#조건 + 순서 > 순서를 정해 원하는 데이터 가져오기 
#순서를 정하는 방법 order by 

#order by
use pokemon;

select * from mypokemon;

#내림차순
select number, name from mypokemon
order by number desc;

#오름차순
select number, name from mypokemon
order by number; #ASC : 기본값 

select number, name, attack, defense
from mypokemon
order by attack desc, defense;
#첫번째기준 attack, 두번째 기준 defense

#order by 사용시, 순서를 정하여 인덱싱 기법 사용 가능 
#1,2,3,4 순으로 인덱스가 된다 3 : attack, 4: defense
select number, name, attack, defense
from mypokemon
order by 3 desc, 4;

#순위 RANK() >> RANK() OVER(ORDER BY 컬럼명 (DESC/ASC)) AS 별칭 
#공동 순위가 있으면 다음 순서로 건너뜀  

SELECT name, attack,
	rank() over(order by attack desc) as attack_rank
from mypokemon;

#rank, dense_rank, row_number 

#dense_rank() 공동 순위가 있어도 다음 순위를 뛰어넘지않음
SELECT name, attack,
	rank() over(order by attack desc) as attack_dence_rank
from mypokemon;

#row_number 공동 순위를 무시함
select name, attack,
	row_number() over(order by attack desc) as attack_row_number
from mypokemon;

select name, attack,
	rank() over (order by attack desc) as rank_rank,
    dense_rank() over (order by attack desc) as rank_dense_rank,
    row_number() over (order by attack desc) as rank_row_number
from mypokemon;

#함수

#locate() : 위치 변환
SELECT LOCATE("A","ABC") as LOCATE;

#SUBSTRING() : 문자열 해당 번호번째 부터 문자 추출
SELECT SUBSTRING("ABC",2);

#RIGHT() : 문자열의 오른쪽에서 해당번호문자까지 추출 
SELECT RIGHT("ABC",2); #BC

#LEFT() : 문자열의 왼쪽에서 해당번호문자까지 추출 
SELECT LEFT("ABC",2); #AB

#UPPER() : 문자열을 대문자로 반환
SELECT UPPER("abc");

#LOWER() : 문자열을 소문자로 반환
SELECT LOWER("ABC");

#LENGTH() : 문자열의 글자 수 반환
SELECT LENGTH("ABC");

#CONCAT() : 문자열 합침alter
SELECT CONCAT("ABC","DEF");

#REPLACE() : 문자 바꾸기
SELECT REPLACE("ABC","A","Z");

use bts_music;
SELECT * FROM butter;

#locate()
select part, locate('i',lyric)
from butter;

#substring()
select part, substring(lyric, 3)
from butter;

#right, left
select part, right(lyric, 3), left(lyric, 3)
from butter;

#upper, lower
SELECT part, upper(lyric), LOWER(lyric)
FROM butter; 

#concat
select part, 
	concat(left(lyric,1),right(lyric,1)) as first_last
from butter;

#replace
SELECT part, REPLACE(lyric," ","_")
FROM butter;

use pokemon;
alter table mypokemon add column friendship float;

#한개씩 데이터 넣기
-- update mypokemon 
-- set friendship = -1.455
-- where number = 10

#friendship컬럼에 데이터 한꺼번에 넣기
#case문 쓰기!
-- update mypokemon
-- set friendship = case number
-- 	when 10 then -1.455
--     when 25 then 124.78
--     when 26 then 30.289
--     when 133 then 15.988
--     when 152 then 67.164
-- end
-- where number in (10,25,26,133,152);

select * from mypokemon;

#숫자형 
#abs() : 절대값
select name, friendship, abs(friendship)
from mypokemon;

#ceiling() : 올림 floor() : 내림
select name, friendship, ceiling(friendship), floor(friendship)
from mypokemon;

#round() 반올림 , truncate : 버림
select name, friendship, round(friendship,1), truncate(friendship,1),
round(friendship,0), truncate(friendship,0)
from mypokemon;

#power(): 제곱
select name, number, power(number, 2)
from mypokemon;

#mod() : 나머지
select name, number, mod(number, 2)
from mypokemon;

#날짜형 데이터
#now() : 현재 날짜와 시간 변환 
select now();

#current_data, current_time
#현재 날짜 / 현재 시간 반환 >>매개변수, 입력 값이 필요없음 
select now(),current_date(), current_time();

#year, month, monthname : 날짜의 연도, 날짜의 월, 날짜의 월 영어로
select now(), year(now()),month(now()),monthname(now());

#dayname, dayofmonth, dayofweek, week 
#dayname : 날짜의 요일(영어로)
#dayofmonth : 날짜의 일 변환
#dayofweek : 날짜의 요일 >> 숫자로 변환 일요일1번 
#Week : 날짜가 해당 연도 몇번째 주 인지 반환 
select now(), dayname(now()),dayofweek(now()),dayofweek(now()),week(now());

#hour, minute. second 함수
select now(),hour(now()),minute(now()),second(now());

#date_format 함수
select date_format(now(),'%Y년 %m월 %d일%H시%i분,%s초') as 한국어_날짜_형식;
select date_format('2024-04-03 02:38:58', '%Y년 %m월 %d일%H시%i분,%s초') as 한국어_날짜_형식;

#시간 차이 datediff, timediff
SELECT DATEDIFF('2022-01-01 00:00:00', '2021-12-25 12:00:00') AS DATE_DIFF,
TIMEDIFF('2022-01-01 00:00:00', '2021-12-25 12:00:00') AS TIME_DIFF;

#미션
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
number INT,
name VARCHAR(20),
type VARCHAR(10),
attack INT,
defense INT,
capture_date DATE
);
INSERT INTO mypokemon (number, name, type, attack, defense, capture_date)
VALUES (10, 'caterpie', 'bug', 30, 35, '2019-10-14'),
		(25, 'pikachu', 'electric', 55, 40, '2018-11-04'),
		(26, 'raichu', 'electric', 90, 55, '2019-05-28'),
		(125, 'electabuzz', 'electric', 83, 57, '2020-12-29'),
		(133, 'eevee', 'normal', 55, 50, '2021-10-03'),
		(137, 'porygon', 'normal', 60, 70, '2021-01-16'),
		(152, 'chikoirita', 'grass', 49, 65, '2020-03-05'),
		(153, 'bayleef', 'grass', 62, 80, '2022-01-01');
        
#미션1
select name, length(name) from mypokemon
order by length(name);

#미션2
select name, 
	rank() over(order by defense desc) as defense_rank from mypokemon;
    
#미션3
select name, abs(datediff(capture_date,'2022-02-14')) as days
from mypokemon;
        
#-----------------------------------------------------------------        
#미션1 
select right(name, 3) as last_char from mypokemon;

#미션2
select left(name, 2) as left2 from mypokemon;

#미션3 
select replace(name,'o','O') as bigO from mypokemon
where name like '%o%';

#미션4
select name, upper(concat(left(type,1),right(type,1))) as type_code
from mypokemon;

#미션 4 응용
select distinct upper(concat(left(type,1),right(type,1))) as type_code
from mypokemon;

#미션 5
select * from mypokemon
where length(name) > 8;

#미션 6 
select round(avg(attack),0) as avg_of_attack from mypokemon;

#미션 7 
select truncate(avg(defense),0) as avg_of_defense from mypokemon;

#미션 8
select name, pow(attack,2) as attack2 
from mypokemon
where length(name) < 8;

#미션 9 
select name, mod(attack,2) as div2
from mypokemon;

#미션 10
select name, abs(attack-defense) as diff
from mypokemon
where attack <= 50;

#미션 11
select current_date() as now_date, current_time() as now_time;

#미션12
select month(capture_date) as month_num, monthname(capture_date) as month_eng
from mypokemon;

#미션 13
select dayofmonth(capture_date) as day_num, dayname(capture_date) as day_eng
from mypokemon;

#미션14
select year(capture_date) as year, month(capture_date) as month,
		day(capture_date) as day 
from mypokemon;

