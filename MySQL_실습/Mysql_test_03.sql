  #미션 1 
  
  
  drop database if exists pokemon;
  
  #step1 pokemon 데이터베이스 생성
  create database pokemon;
  use pokemon; #pokemon 사용
  show tables;
  
  #step2 mypokemon 테이블 생성 
  create table mypokemon(
	number int,
    name varchar(20),
    type varchar(20)
    );
    
show tables;

#step3
insert into mypokemon(number, name, type)
values  (10, "caterpie", "bug"),
		(25, "pikachu", "electric"),
        (133, "eevee", "normal");
        
create table mynewpokemon(
	number int,
    name varchar(20),
    type varchar(10)
    );
    
insert into mynewpokemon(number, name, type)
values  (77, "포니타", "불꽃"),
		(132, "메타몽", "노말"),
        (151, "뮤", "에스퍼");
        
show tables;
select * from mynewpokemon;

delete from mynewpokemon 
where name = "포니타";
        

#미션 2. 데이터 변경
#테이블명 변경
alter table mypokemon rename myoldpokemon;
#컬럼명 변경 
alter table myoldpokemon rename column name to eng_name;
alter table mynewpokemon rename column name to kor_name;
-- alter table myoldpokemon
-- change column name eng_name varchar(20);
-- alter table mynewpokemon
-- change column name kor_name varchar(20);

show tables;
select * from myoldpokemon;

#myoldpokemon테이블 값 지우기 
delete from myoldpokemon;
-- truncate table myoldpokemon; 

#mynewpokemon 테이블 지우기
drop table mynewpokemon;
