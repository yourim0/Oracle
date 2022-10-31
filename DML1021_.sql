-------------------------10/21 
--DML 데이터 조작어 : insert, update, delete
--insert : 테이블에 데이터 삽입
--insert into 테이블명(컬럼명1, 컬럼명2..)
--valuse(값1, 값2..)
-- 컬럼과 값의 타입과 개수가 일치해야 한다(1:1매칭)
--작성순서대로 1:1 매칭 된다.

--테이블 생성 (dept테이블과 동일하게)
create table dept_temp
as
select * from dept;

--테이블 조회
select *
from dept_temp;

--데이터 추가(값의 개수와 타입이 일치해야 한다)
insert into dept_temp(deptno,dname,loc)
values (50, 'DATABASE','SEOUL');

--컬럼 생략 (전체 컬럼에 다 넣을 경우 컬럼명 생략가능하다)
insert into dept_temp
values (70, 'HTNK','SEOUL');


--개수와 티입을 잘 맞췄기 때문에 지정하지 않은 데이터는 자동으로 null이 들어간다
--묵시적 mull데이터 삽입 
--명시적 null데이터 삽입
insert into dept_temp (deptno,dname) 
values(60,'JSP');

insert into dept_temp
values (80,NULL,'SEOUL');

--데이터는 없애고 형식만 가져온다.
create table emp_temp 
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm , deptno)
values (9999,'홍길동','PRESIDENT',null, '2001/01/01',5000,1000,10);

--sysdate함수를 이용한 날짜데이터 삽입
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm , deptno)
values (3111,'유림이','MANAGER',9999,sysdate,4000,null,30);


-- update : 컬럼의 데이터를 변경(수정)
-- update 테이블명
-- set 컬럼명 = 값, 컬럼명 = 값,...
-- where 조건식 
-- 조건절 사용하지 않으면 해당 컬럼이 모두 변경된다. 


create table dept_temp2
as
select *from dept;

select *from dept_temp2;

--where 절이 없어 모든 행이 바뀌어버린다
update dept_temp2
set loc = 'SEOUL';

--삭제
drop table dept_temp2;

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;

--삭제 
--delete from 테이블명
--where 조건식 
--조건절을 사용하지 않으면 모든 데이터가 삭제된다.

create table emp_temp2
as
select * from emp;

select * from emp;

select * from emp_temp2;

delete from emp_temp2;

drop table emp_temp2;

--삭제할 대상 선택하기 
delete from emp_temp2
where ename = 'SCOTT';


----------------------------------------
--TCL (데이터의 영구저장 또는 취소)
--트랜젝션
--commit, rollback, savepoint
--commit : 데이터 영구 저장 (테이블이 데이터 반영)
--          create구문을 사용해서 객체 생성할 때 (자동)
--rollback : 데이터 변경 취소 (테이블이 데이터 미반영) 원상복구
--          천재지변, 전기, 전쟁(자동)



create table dept01
as
select * from dept;

select * from dept01;

--지워진거 아님 (외부접속시 조회가능)
--완전하게 반영하려면 commit; 작업 필요하다
delete from dept01;

commit;
--데이터 복구, 커밋이 완료되면 적용되지 않는다 
--마지막 commit 지점까지만 가능하다
rollback;

drop table dept01;

-------------truncate = delete 같음
--트랜젝션 적용 가능 유무
--delete commit rollback 가능
delete from dept01;
--commit rollback 불가능
truncate table dept01;


--cmd 확인
--sqlplus scott/tiger
--select * from dept01;

-----DDL(데이터 정의어) : table(모든 객체)을 생성, 삭제 변경하는 명령어
--creat(생성), alter(변경), drop(삭제)

--create table 테이블 명( --table(객체)
--        컬럼명1 타입,   --column(속성)
--        컬럼명2 타입,
--        컬럼명3 타입
--      );

create table emp_ddl(
    --사번, 이름, 직책, 관리자, 입사일, 급여, 성과금, 부서번호
    empno number(4),
    ename varchar2(10), --byte 기준
    job varchar2(9),    
    mgr number(4),
    hiredate date,
    sal number(7,2), --전체는 7자리, 중 2자리는 소수자리)
    comm number(7,2),
    deptno number(2)
);

select * from emp_ddl;

insert into emp_ddl
values (9999,'유리미','MANAGER',1111,SYSDATE,4000,NULL,10);

--똑같은 테이블 생성(테이블의 복사) :AS
CREATE TABLE DEPT_DDL 
AS
SELECT * FROM DEPT;

SELECT * FROM DEPT_DDL;

--조건에 맞는 데이터만 가져온다
CREATE TABLE DEPT_30
AS
SELECT * FROM DEPT
WHERE DEPTNO = 30;


--컬럼을 일부만 가져오게
CREATE TABLE DEPT_M
AS
SELECT DNAME, LOC
FROM DEPT;


--테이블 구조만가져오게
CREATE TABLE DEPT_D
AS
SELECT * FROM DEPT
WHERE 1 != 1;


SELECT * FROM DEPT_30;

--테이블 변경(컬럼의 정보수정)
--새로운 컬럼추가, 컬럼의 이름변경, 자료형의 변경, 컬럼을 삭제 
--ALTER 

CREATE TABLE EMP_ALTER
AS
SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

--컬럼추가 
ALTER TABLE EMP_ALTER
ADD ADDRESS VARCHAR2(100);

--이름변경
ALTER TABLE EMP_ALTER
RENAME COLUMN ADDRESS TO ADDR;


--키우는 것만 가능
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(10);

DESC EMP_ALTER;

--삭제
ALTER TABLE EMP_ALTER
DROP COLUMN ADDR;

--테이블 삭제 : DROP
--DROP TABLE 테이블명
DROP TABLE EMP_ALTER;

SELECT * FROM EMP_ALTER;

-------------------------------P324연습문제

CREATE TABLE EMP_HW(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
    );
    
    SELECT * FROM EMP_HW;
    SELECT * FROM EMP;
    
 ALTER TABLE EMP_HW
 ADD BIGO VARCHAR2(20);
 
 ALTER TABLE EMP_HW
 MODIFY BIGO VARCHAR(30);
 
 ALTER TABLE EMP_HW
 RENAME COLUMN BIGO TO REMARK;

INSERT INTO EMP_HW(REMARK)
VALUES(NULL);

INSERT INTO EMP_HW
SELECT * FROM EMP;

INSERT INTO EMP_HW
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL FROM EMP;

INSERT INTO EMP_HW(REMARK)
VALUES(NULL);

SELECT * FROM EMP_HW;

DROP TABLE EMP_HW;

---------------------------------- 데이터 사전
--구조확인
DESC USER_TABLES;

--조회만 가능 
SELECT TABLE_NAME
FROM USER_TABLES;

--다른 유저 테이블 조회 
SELECT OWNER,TABLE_NAME
FROM ALL_TABLES;

---------------------------------- 
--INDEX (검색속도를 향상하기 위해 사용 객체)
--SELECT 구문의 검색속도를 향상시킨다
--전체 레코드의 3% ~ 5% 정도일때
--INDEX 객체를 컬럼에 생성해서 사용한다


CREATE INDEX 인덱스명
ON 테이블명 (컬럼명);

CREATE TABLE EMP02
AS
SELECT * FROM EMP;

SELECT * FROM EMP01;

INSERT INTO EMP01
SELECT * FROM EMP01;

DROP TABLE EMP01;

INSERT INTO EMP01(EMPNO,ENAME)
VALUES (1111,'BTS');

--INDEX 객체 생성 전 :0.027~0.038
SELECT EMPNO,ENAME
FROM EMP01
WHERE ENAME='BTS';

--INDEX 객체 생성 
CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);
--INDEX 객체 생성 후 : 0초
SELECT EMPNO,ENAME
FROM EMP01
WHERE ENAME='BTS';

SELECT * FROM USER_IND_COLUMNS;

--INDEX 삭제
DROP INDEX IDX_EMP01_ENAME;

--INDEX 삭제 후 원상복구
SHOW RECYCLEBIN;

FLASHBACK TABLE EMP02
TO BEFORE DROP;

--휴지통 비우기
PURGE RECYCLEBIN;


--------------------P390
--제약조건(무결성) : 잘못된 값이 데이터로 사용되는 것을 못하게 하는 것 
--(5대 제약조건)
--NOT NULL (NULL값 허용 X)
--UNIQUE (중복 X)
--PRIMARY KEY (= NOTNULL + UNIQUE)
--FOREIGN KEY
--CHECK

--EMP,DEPT
INSERT INTO EMP
VALUES (1111,'aaa','MANAGER',9999,sysdate,1000,null,50);

----p362 not null
--NOT NULL은 NULL데이터를 허용하지 않는 제약 조건
DROP TABLE EMP02;

CREATE TABLE EMP02(
EMPNO NUMBER(4) NOT NULL,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);

SELECT * FROM EMP02;

--오류발생
INSERT INTO EMP02
VALUES (NULL,NULL,'MANAGER',30);

INSERT INTO EMP02
VALUES (1111,'리미','MANAGER',30);

INSERT INTO EMP02
VALUES (2222,'홍길동','MANAGER',30);

INSERT INTO EMP02
VALUES (NULL,'짱짱','MANAGER',20);

INSERT INTO EMP02
VALUES (2222,'멍멍','MANAGER',10);

DELETE FROM EMP02;

--UNIQUI 데이터의 중복을 허용하지 않음(NULL제외)

DROP TABLE EMP02;
 --두개이상의 제약조건도 허용한다. 중복은 제거, NULL은 받지않음
CREATE TABLE EMP02(
EMPNO NUMBER(4) NOT NULL UNIQUE,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);

--PRIMARY KEY 는 NOTNULL과 UNIQUE의 성질을 다 가지고 있다 
--NULL 데이터를 허용하지 않는다.

CREATE TABLE EMP02(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);

--제약조건 명 지정 : CONSTRAINT
CREATE TABLE EMP02(
EMPNO NUMBER(4) CONSTRAINT EMP02_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMP02_ENAME_NN NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);