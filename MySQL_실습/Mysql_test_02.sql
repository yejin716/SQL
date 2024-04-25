#sql 101
#주석 처리

#데이터베이스 생성
create database pokemon;

#사용할 데이터베이스 지정
#지정하지 않으면 힘듬.
#예) pokemon.mypokemon(db.table) / dp_yj.idol
use pokemon;

#현재 있는 데이터베이스 목록 보여줘
show databases; 

#테이블생성(**) 컬럼명과 데이터타입 사이 띄어쓰기(반드시 데이터 타입 지정)
create table idol(
	이름 varchar(20),
    나이 int,
    그룹 varchar(50)
); 

#현재 사용하는 db(pokemon)있는 table 보여줌
show tables; 

#테이블 이름 변경 alter
alter table idol rename 슈퍼스타; 

show tables;

#테이블에 접근, 컬럼(속성)추가
alter table 슈퍼스타 add column 경력년수 int;
alter table 슈퍼스타 add column 키 int;
alter table 슈퍼스타 add column 몸무게 int;

#기존 컬럼에 데이터타입 변경 modify(수정) int >> float
#기존 데이터타입, 값 등 변경
alter table 슈퍼스타 modify column 키 float;

#기존 컬럼에 이름과 데이터타입 변경 change 
alter table 슈퍼스타 change column 몸무게 성별 varchar(50);

show tables;
select * from 슈퍼스타;

#테이블 삭제, db 삭제
drop table 슈퍼스타;

show databases;
#db삭제
drop database db_yj;

#if exists >> 만약 존재한다면(조건) 
#조건이 없을시, 실행하면 에러발생
drop database if exists pokemon;

create database pokemon;

use pokemon;

create table 슈퍼스타 (
	이름 varchar(20),
    나이 int,
    그룹 varchar(50)
    );
    
#테이블 값 삽입 (row 행 단위)
insert into 슈퍼스타(이름, 나이, 그룹) values("제니",27,"블랙핑크");

show tables;

select * from 슈퍼스타;

#테이블 여러데이터 생성 
insert into 슈퍼스타(이름, 나이, 그룹) 
values  ("지수",28,"블랙핑크"),
		("리사",26,"블랙핑크"),
		("로제",26,"블랙핑크"),
		("하니",27,"블랙핑크");
        
#여러 개 데이터 (행 단위) 삽입 

select * from 슈퍼스타;

#테이블의 값 삭제 및 수정
 
delete from 슈퍼스타
where 그룹 = "블랙핑크";

#데이터베이스 생성 >> create database 데이터베이스명; 
#사용할 데이터베이스 지정 >> use 데이터베이스명;
#생성한 데이터베이스안에 테이블 생성 >> create table 테이블명 (컬럼값);
#생성한 테이블안에 값 추가 >> insert into 테이블명(컬럼값) values (값1,값2,...);
#테이블 확인 >> show tables;
#테이블안 값 확인 >> select * from 테이블명;
#테이블의 값 변경 >> update 테이블명 set 바꿀 조건 
#테이블 행 삭제 >> delete from 테이블명; 특정 행 삭제 >> delete from 테이블명 where 조건;
#truncate table  
#테이블 삭제 >> drop table 테이블명;
#테이블 기존 컬럼 이름과 타입 변경 >> alter table 테이블명 change column 변경전컬럼명 변경후컬럼명 변경할 타입;
#테이블 이름 변경 >> alter table 변경전테이블명 rename 변경후테이블명;
#컬럼명 변경 >> alter table 테이블명 rename column 변경전 컬럼명 to 변경후 컬럼명;


