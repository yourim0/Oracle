-------------------------10/21 
--DML ������ ���۾� : insert, update, delete
--insert : ���̺� ������ ����
--insert into ���̺��(�÷���1, �÷���2..)
--valuse(��1, ��2..)
-- �÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�(1:1��Ī)
--�ۼ�������� 1:1 ��Ī �ȴ�.

--���̺� ���� (dept���̺�� �����ϰ�)
create table dept_temp
as
select * from dept;

--���̺� ��ȸ
select *
from dept_temp;

--������ �߰�(���� ������ Ÿ���� ��ġ�ؾ� �Ѵ�)
insert into dept_temp(deptno,dname,loc)
values (50, 'DATABASE','SEOUL');

--�÷� ���� (��ü �÷��� �� ���� ��� �÷��� ���������ϴ�)
insert into dept_temp
values (70, 'HTNK','SEOUL');


--������ Ƽ���� �� ����� ������ �������� ���� �����ʹ� �ڵ����� null�� ����
--������ mull������ ���� 
--����� null������ ����
insert into dept_temp (deptno,dname) 
values(60,'JSP');

insert into dept_temp
values (80,NULL,'SEOUL');

--�����ʹ� ���ְ� ���ĸ� �����´�.
create table emp_temp 
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm , deptno)
values (9999,'ȫ�浿','PRESIDENT',null, '2001/01/01',5000,1000,10);

--sysdate�Լ��� �̿��� ��¥������ ����
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm , deptno)
values (3111,'������','MANAGER',9999,sysdate,4000,null,30);


-- update : �÷��� �����͸� ����(����)
-- update ���̺��
-- set �÷��� = ��, �÷��� = ��,...
-- where ���ǽ� 
-- ������ ������� ������ �ش� �÷��� ��� ����ȴ�. 


create table dept_temp2
as
select *from dept;

select *from dept_temp2;

--where ���� ���� ��� ���� �ٲ�������
update dept_temp2
set loc = 'SEOUL';

--����
drop table dept_temp2;

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;

--���� 
--delete from ���̺��
--where ���ǽ� 
--�������� ������� ������ ��� �����Ͱ� �����ȴ�.

create table emp_temp2
as
select * from emp;

select * from emp;

select * from emp_temp2;

delete from emp_temp2;

drop table emp_temp2;

--������ ��� �����ϱ� 
delete from emp_temp2
where ename = 'SCOTT';


----------------------------------------
--TCL (�������� �������� �Ǵ� ���)
--Ʈ������
--commit, rollback, savepoint
--commit : ������ ���� ���� (���̺��� ������ �ݿ�)
--          create������ ����ؼ� ��ü ������ �� (�ڵ�)
--rollback : ������ ���� ��� (���̺��� ������ �̹ݿ�) ���󺹱�
--          õ������, ����, ����(�ڵ�)



create table dept01
as
select * from dept;

select * from dept01;

--�������� �ƴ� (�ܺ����ӽ� ��ȸ����)
--�����ϰ� �ݿ��Ϸ��� commit; �۾� �ʿ��ϴ�
delete from dept01;

commit;
--������ ����, Ŀ���� �Ϸ�Ǹ� ������� �ʴ´� 
--������ commit ���������� �����ϴ�
rollback;

drop table dept01;

-------------truncate = delete ����
--Ʈ������ ���� ���� ����
--delete commit rollback ����
delete from dept01;
--commit rollback �Ұ���
truncate table dept01;


--cmd Ȯ��
--sqlplus scott/tiger
--select * from dept01;

-----DDL(������ ���Ǿ�) : table(��� ��ü)�� ����, ���� �����ϴ� ��ɾ�
--creat(����), alter(����), drop(����)

--create table ���̺� ��( --table(��ü)
--        �÷���1 Ÿ��,   --column(�Ӽ�)
--        �÷���2 Ÿ��,
--        �÷���3 Ÿ��
--      );

create table emp_ddl(
    --���, �̸�, ��å, ������, �Ի���, �޿�, ������, �μ���ȣ
    empno number(4),
    ename varchar2(10), --byte ����
    job varchar2(9),    
    mgr number(4),
    hiredate date,
    sal number(7,2), --��ü�� 7�ڸ�, �� 2�ڸ��� �Ҽ��ڸ�)
    comm number(7,2),
    deptno number(2)
);

select * from emp_ddl;

insert into emp_ddl
values (9999,'������','MANAGER',1111,SYSDATE,4000,NULL,10);

--�Ȱ��� ���̺� ����(���̺��� ����) :AS
CREATE TABLE DEPT_DDL 
AS
SELECT * FROM DEPT;

SELECT * FROM DEPT_DDL;

--���ǿ� �´� �����͸� �����´�
CREATE TABLE DEPT_30
AS
SELECT * FROM DEPT
WHERE DEPTNO = 30;


--�÷��� �Ϻθ� ��������
CREATE TABLE DEPT_M
AS
SELECT DNAME, LOC
FROM DEPT;


--���̺� ��������������
CREATE TABLE DEPT_D
AS
SELECT * FROM DEPT
WHERE 1 != 1;


SELECT * FROM DEPT_30;

--���̺� ����(�÷��� ��������)
--���ο� �÷��߰�, �÷��� �̸�����, �ڷ����� ����, �÷��� ���� 
--ALTER 

CREATE TABLE EMP_ALTER
AS
SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

--�÷��߰� 
ALTER TABLE EMP_ALTER
ADD ADDRESS VARCHAR2(100);

--�̸�����
ALTER TABLE EMP_ALTER
RENAME COLUMN ADDRESS TO ADDR;


--Ű��� �͸� ����
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(10);

DESC EMP_ALTER;

--����
ALTER TABLE EMP_ALTER
DROP COLUMN ADDR;

--���̺� ���� : DROP
--DROP TABLE ���̺��
DROP TABLE EMP_ALTER;

SELECT * FROM EMP_ALTER;

-------------------------------P324��������

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

---------------------------------- ������ ����
--����Ȯ��
DESC USER_TABLES;

--��ȸ�� ���� 
SELECT TABLE_NAME
FROM USER_TABLES;

--�ٸ� ���� ���̺� ��ȸ 
SELECT OWNER,TABLE_NAME
FROM ALL_TABLES;

---------------------------------- 
--INDEX (�˻��ӵ��� ����ϱ� ���� ��� ��ü)
--SELECT ������ �˻��ӵ��� ����Ų��
--��ü ���ڵ��� 3% ~ 5% �����϶�
--INDEX ��ü�� �÷��� �����ؼ� ����Ѵ�


CREATE INDEX �ε�����
ON ���̺�� (�÷���);

CREATE TABLE EMP02
AS
SELECT * FROM EMP;

SELECT * FROM EMP01;

INSERT INTO EMP01
SELECT * FROM EMP01;

DROP TABLE EMP01;

INSERT INTO EMP01(EMPNO,ENAME)
VALUES (1111,'BTS');

--INDEX ��ü ���� �� :0.027~0.038
SELECT EMPNO,ENAME
FROM EMP01
WHERE ENAME='BTS';

--INDEX ��ü ���� 
CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);
--INDEX ��ü ���� �� : 0��
SELECT EMPNO,ENAME
FROM EMP01
WHERE ENAME='BTS';

SELECT * FROM USER_IND_COLUMNS;

--INDEX ����
DROP INDEX IDX_EMP01_ENAME;

--INDEX ���� �� ���󺹱�
SHOW RECYCLEBIN;

FLASHBACK TABLE EMP02
TO BEFORE DROP;

--������ ����
PURGE RECYCLEBIN;


--------------------P390
--��������(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ� ���� ���ϰ� �ϴ� �� 
--(5�� ��������)
--NOT NULL (NULL�� ��� X)
--UNIQUE (�ߺ� X)
--PRIMARY KEY (= NOTNULL + UNIQUE)
--FOREIGN KEY
--CHECK

--EMP,DEPT
INSERT INTO EMP
VALUES (1111,'aaa','MANAGER',9999,sysdate,1000,null,50);

----p362 not null
--NOT NULL�� NULL�����͸� ������� �ʴ� ���� ����
DROP TABLE EMP02;

CREATE TABLE EMP02(
EMPNO NUMBER(4) NOT NULL,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);

SELECT * FROM EMP02;

--�����߻�
INSERT INTO EMP02
VALUES (NULL,NULL,'MANAGER',30);

INSERT INTO EMP02
VALUES (1111,'����','MANAGER',30);

INSERT INTO EMP02
VALUES (2222,'ȫ�浿','MANAGER',30);

INSERT INTO EMP02
VALUES (NULL,'¯¯','MANAGER',20);

INSERT INTO EMP02
VALUES (2222,'�۸�','MANAGER',10);

DELETE FROM EMP02;

--UNIQUI �������� �ߺ��� ������� ����(NULL����)

DROP TABLE EMP02;
 --�ΰ��̻��� �������ǵ� ����Ѵ�. �ߺ��� ����, NULL�� ��������
CREATE TABLE EMP02(
EMPNO NUMBER(4) NOT NULL UNIQUE,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);

--PRIMARY KEY �� NOTNULL�� UNIQUE�� ������ �� ������ �ִ� 
--NULL �����͸� ������� �ʴ´�.

CREATE TABLE EMP02(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);

--�������� �� ���� : CONSTRAINT
CREATE TABLE EMP02(
EMPNO NUMBER(4) CONSTRAINT EMP02_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMP02_ENAME_NN NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);