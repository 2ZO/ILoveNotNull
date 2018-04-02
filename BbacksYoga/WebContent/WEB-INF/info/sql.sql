create table yoga_member(
id varchar2(50) primary key,
password varchar2(50) not null,
name varchar2(50) not null,
phone_number NUMBER not null,
address varchar2(100) not null,
email varchar2(100) not null,
password_question varchar2(100) not null,
password_answer varchar2(100) not null,
regDate date not null,
member_status varchar2(10) not null,
class_package varchar2(10) not null --3회 or 5회
)

-- 요가 강사 테이블 생성
create table yoga_teacher(
teacherId NUMBER primary key,
teacherName varchar2(50) not null,
teacherNick varchar2(50) not null,
teacherProfile varchar2(600),
imgUrl varchar2(100)
)
-- teacherId 시퀀스 생성
create sequence tchNo_seq;

-- 요가 프로그램 테이블 생성
create table yoga_program(
programNo NUMBER primary key,
programName varchar2(50) not null,
programDetail varchar2(50)
)
-- programNo 시퀀스 생성
create sequence prgNo_seq;

-- 요가 강좌 테이블 생성
create table yoga_class(
classNo NUMBER primary key,
programNo NUMBER not null,
teacherId NUMBER not null,
capacity NUMBER not null,
classTime NUMBER not null,
classDay varchar2(10) not null,
constraint fk_teacherId foreign key(teacherId) references YOGA_TEACHER(teacherId),
constraint fk_programNo foreign key(programNo) references yoga_program(programNo),
constraint uk_class unique(programNo, teacherId, classTime, classDay)            // 추가     
)
-- classNo 시퀀스 생성
create sequence class_seq;

create table registerStatus(
rsNo NUMBER PRIMARY KEY,                      //추가  
classNo NUMBER not null,
id VARCHAR2(100) not null,
regDate date not null,
constraint fk_class foreign key(classNo) references yoga_class(classNo),
constraint fk_yoga_member foreign key(id) references yoga_member(id)
)

create sequence rs_seq;                         //추가 

create sequence post_seq; //postNo 생성
create table POST(
postNo NUMBER primary key,
title varchar2(100) not null,
content clob not null,
id varchar2(50) not null,
regDate date not null,
constraint fk_post2 foreign key(id) references yoga_member(id)
)

select * from post 
insert into post values(post_seq.nextval,'안녕','반가워요 테스트 중이예여','visitor',sysdate);



drop table registerStatus;
drop table yoga_member;
drop table POST;
drop table yoga_class;
drop table yoga_teacher;
drop table yoga_program;

drop sequence post_seq;
drop sequence class_seq;
drop sequence prgNo_seq;
drop sequence tch_seq;

select * from yoga_member;
select * from yoga_class;
select * from yoga_teacher;
select * from yoga_program;
select * from POST;
select * from registerStatus
--멤버추가
insert into yoga_member(
id,
password,
name,
phone_number,
address,
email,
password_question,
password_answer,
regDate,
member_status,
class_package
) values('java','1234','hwang',5152,'판교','naver.com','test','test',sysdate,'true','3');

insert into yoga_member(
id,password,name,phone_number,address,email,password_question,password_answer,regDate,member_status,class_package
) values('python','1234','hwang',2345,'수원','google.com','test','test',sysdate,'true','5');

--관리자
insert into yoga_member(
id,password,name,phone_number,address,email,password_question,password_answer,regDate,member_status,class_package
) values('sys','1234','hwang',3434,'판교','naver.com','test','test',sysdate,'true','3');


--멤버 정보 수정
select id,password,name,phone_number,address,email,password_question,password_answer,regDate,member_status,class_package from yoga_member where id='java' and password='1234';
update UPDATE yoga_member SET  WHERE id='java' and password='1234';

--기본 게시물 추가
insert into POST(
postNo,
title,
content,
id,
regDate
) values(post_seq.nextval, 'hello','shut up','java', sysdate);

--선생님 추가
insert into yoga_teacher(
teacherId,
teacherName,
teacherNick,
teacherProfile,
imgUrl
) values(tchNo_seq.nextval,'김민석','시우민','엑소입니다.','김민석.jpg');

--선생님 추가
insert into yoga_teacher(
teacherId,
teacherName,
teacherNick,
teacherProfile,
imgUrl
) values(tchNo_seq.nextval,'수호','수호','엑소입니다2','수호.jpg');

--프로그램 추가
insert into yoga_program(
programNo,
programName,
programDetail
) values(prgNo_seq.nextval,'Vinyasa','김민석과 함께하는 즐거운요가');

--프로그램 추가
insert into yoga_program(
programNo,
programName,
programDetail
) values(prgNo_seq.nextval,'그냥요가','누군가와 함께하는 즐거운요가');

--클래스 추가
insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,1,1,10,1,'mon');
--클래스 추가
insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,1,2,10,2,'fri');


------------------------------------------------------------
create table registerStatus(
classNo NUMBER not null,
id VARCHAR2(100) not null,
regDate date not null,
constraint fk_class foreign key(classNo) references yoga_class(classNo),
constraint fk_yoga_member foreign key(id) references yoga_member(id),
constraint pk_registerStatus primary key(classNo,id)
)
