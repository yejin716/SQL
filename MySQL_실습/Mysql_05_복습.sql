create database bts_music;

use bts_music;

create table butter(
	part int, 
    lyric varchar(50)
    );
    
insert into butter(part,lyric)
values  (1,"Smooth like butter"),
		(2,"Like a criminal undercover"),
		(3,"Gon' pop like trouble"),
		(4,"Breakin' into your heart like that"),
		(5,"Cool shade stunner");
select * from butter;

#Lacate(위치찾을문자, 컬럼명) : 해당 문자의 위치
select part, locate('i',lyric)
from butter;

#substring(컬럼명, 위치번호) : 해당 번째부터 문자 반환
select part, substring(lyric,3)
from butter;

#right(컬럼명, 위치번호), left(컬럼명, 위치번호) 해당 위치번호까지 문자 반환
select part, right(lyric,3),left(lyric,3)
from butter;

#upper(컬럼명),lower(컬럼명) 대문자 소문자
select part, upper(lyric),lower(lyric)
from butter;

#concat(이을문자1, 이을문자2) 문자열을 합하여 반환
select part, concat(right(lyric,1),left(lyric,1))
from butter;

#replace(컬럼명,바꾸고싶은문자, 바꿀문자) 
select part, replace(lyric,' ','_')
from butter;

create table number(
	n int
);


alter table number modify column 번호 float;
insert into number(n,번호)
values  (1, -1.455),
		(2, 124.78),
        (3, 30.289),
        (4, -10.67),
        (5, 15.988);
        
select * from number;

#ceiling(숫자) 숫자를 정수로 올림
select n, 번호, ceiling(번호) from number;

#floor(숫자) 숫자를 정수로 내림
select n, 번호, floor(번호) from number;

#round(숫자,자릿수) 숫자를 소수점 자릿수까지 반올림
#truncate(숫자,자릿수) 숫자를 소수점 자릿수까지 버림
select n, 번호, round(번호,1), truncate(번호, 1) from number;

#power(숫자1,숫자2) 숫자1의 숫자2 제곱 반환
select n, 번호, power(n,2) from number;

#mod(숫자1,숫자2) 숫자1을 숫자2로 나눈 나머지 
select n, 번호, mod(n,2) from number;

drop table number;

#날짜형
#now() 현재 날짜와 시간 반환
select now();

#current_date() 현재 날짜 반환
select current_date();

#current_time() 현재 시간 반환
select current_time();

# year , month, monthname 년 , 월, 월을영어로
select year(now()), month(now()), monthname(now());

#dayname 요일을 영어로
select dayname(now());

#dayofmonth 일 변환
select dayofmonth(now());

#dayofweek 요일을 숫자로 반환 일요일 1 
select dayofweek(now());

#week 해당 연도에 몇번째 주인지 반환
select week(now());