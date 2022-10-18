--DQL(���Ǿ�)������ ��ȸ ���� ~87������ 10/17
--SELECT �÷��� 
--FROM ���̺�� 

--��ü������
SELECT EMPNO,ename,JOB, MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP;

SELECT *
FROM EMP;

--�κ��÷� ������
SELECT EMPNO,ENAME,SAL
FROM EMP;

SELECT DEPTNO 
FROM EMP;

--�ߺ������� ���� 
SELECT DISTINCT(DEPTNO)
FROM EMP;

SELECT DISTINCT(JOB)
FROM EMP;

--���� ������ : +,-,*,/ ������ �����ڴ� ����
--�÷��� ������� �����Ѵ�
-- ������ ���� ������� ������ 
SELECT ENAME,SAL,SAL * 12
FROM EMP;

--null ���� ������ �Ұ����ϴ� --���� null�� ǥ�� �ȴ�
--����� �߻��� �� �ִ� ���� (COMM���� �ʴ� ��� ���� ������ ������ ����)
SELECT ENAME,SAL,SAL*12 + COMM,COMM --COMMISSION ������ 
FROM EMP;

--nvl(comm,0) : comm null�ϰ�� ����������� 0���� ��ü
--as(alias) ��Ī: �÷��� ��Ī�� ��� �� �� �ִ�. 
SELECT ENAME as �����,SAL,SAL*12 + nvl(comm,0) as ����,COMM --COMMISSION ������ 
FROM EMP;



--������ ���� ���� ~88������ 10/18
--SELECT �÷��� 
--FROM ���̺�� 
--order by �÷���(���ı����� �Ǵ� ��) asc(��������)/desc(��������)
--�⺻���� ������������ ������ �����ϴ�
--����(1~10), ��¥(���ų�¥~�ֱٳ�¥), ����(��������)

select *
from emp
order by hiredate desc; --�������� ���� 

--���ǰ˻�
--select �÷���
--from ���̺��
--where ���ǽ�(�÷��� = ��); <,>,=,!=,/ <>,<=, >=, and, or

SELECT * FROM emp WHERE sal >= 3000; --�޿��� 3000�̻��� ���

SELECT * FROM emp WHERE deptno = 30;

--and �ΰ��� �̻��� ������ ��� ���ΰ��;
--���̺� ������������ ��ҹ��ڸ� �����Ѵ�
SELECT * FROM emp WHERE deptno = 30 and job = 'SALESMAN' AND empno = 7499;

--���ڸ� �������� ����� ��
 --��ҹ��� 
 --' ' ����
SELECT * FROM emp WHERE ename = 'ford';--�ҹ���ford ��� data ���� �ҹ��� ����

--��¥�� �������� ����� ��
--''
--��¥�� ũ�Ⱑ �ִ�
--80/12/20 -> 1980 12 20 �ð� �� �� ���� ������ ���Ǿ� �� ����

SELECT * FROM emp WHERE hiredate < '1982/01/01';

--or �ΰ� �̻��� �����߿� �ϳ��̻� ���ΰ��
SELECT * FROM emp WHERE deptno = 10 or sal >=2000;

--not ������ ������
select *
from emp
where sal != 3000;

--not����� !=����� ����
select *
from emp
where not sal = 3000;

--and, or
-- ���� ������ ǥ���� �� ���
select *
from emp
where sal >= 1000 and sal <= 3000;

select * 
from emp
where sal <= 1000 or sal >= 3000; --��ġ�� �ʴ� ����

--between
select *
from emp
where sal between 1000 and 3000; --��� ���� 

--in
select * 
from emp 
where sal = 800 or sal = 3000 or sal = 5000;


select *
from emp
where sal in (800, 3000, 5000);

--like������
--���� �Ϻθ� ������ �����͸� ��ȸ
--���ϵ� ī�带 ����Ѵ�(%,_) 
--% ��� ���ڸ� ��ü�Ѵ�
--_ �� ���ڸ� ��ü 

--F�� �����ϴ� ��� ename(�ڿ� �ٸ����ڰ� ��� �������)
select *
from emp
where ename like 'F%';

--D�γ����»��
select *
from emp
where ename like '%D';

--o�� ���Ե� ����
select *
from emp
where ename like '%O%';

--�ݵ�� �տ� 3����(-)�� �����ϰ�, D�� 4��° �ڸ��� �־���Ѵ�
select *
from emp
where ename like '___D';

--s�� 3���ڴ� ������ �;��ϰ� �� �ڴ� �־ ��� �����ϴ�.
--ȥ���ؼ� �� �� �ִ� 
select * 
from emp
where ename like 'S___%';

-- null ���� �����Ұ� --in null�� ��� �� 
select *
from emp
where comm = null;

select *
from emp
where comm is null;

--null �ƴ� �����͸� ��ȸ 
select *
from emp
where comm is not null;


--���տ�����
--�ΰ��� select ������ ����Ѵ�
--�÷��� ������ �����ؾ��Ѵ�
--�÷��� Ÿ���� �����ؾ��Ѵ�
--�÷��� �̸��� �������
--������, ������, ������

select empno,ename,sal,deptno
from emp
where deptno = 10
union --������
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
minus --������
select empno,ename,sal,deptno
from emp
where deptno = 10;


select empno,ename,sal,deptno
from emp
intersect--������
select empno,ename,sal,deptno
from emp
where deptno = 10;

--where
--�񱳿����� : <,>,=,!=, <>,<=, >=,  
--�������� : and, or, not, between, and, in 
--like(%,_)
--is null / is not null
--���տ����� : union, union all, minus, intersect

-----����125
-------1
select *
from emp 
where ename like '%S';

-------2
select empno,ename,sal,deptno
from emp
where job = 'SALESMAN'
and deptno =30;

-------3-1
select empno,ename,sal,deptno
from emp
where deptno = 20 or deptno =30
intersect
select empno,ename,sal,deptno
from emp
where sal > 2000; 

-------3-2
select empno,ename,sal,deptno
from emp
where deptno = 20  and sal > 2000 or deptno =30 and sal > 2000; 

--- ������ ��
select empno,ename,sal,deptno
from emp
where deptno in(20,30)
and sal > 2000;
--������ ��
select empno,ename,sal,deptno
from emp
where deptno = 20 and sal >2000
union
select empno,ename,sal,deptno
from emp
where deptno = 30 and sal >2000; 




-------4 sal 2000�̻� 3000���� ���� �� 

select *
from emp
where not sal >2000 and sal < 3000;

-------5
select ename,empno,sal,deptno
from emp
where deptno = 30 and ename like '%E%'
minus
select ename,empno,sal,deptno
from emp
where sal between 1000 and 2000;

-------6
select *
from emp
where COMM is null and MGR is not null
and ename not like '_L%'
intersect
select *
from emp
where JOB in('CLERK','MANAGER');

--------------------------------------����Ŭ �Լ�

--�Լ�
--�����Լ� :upper,lower,substr,instr,replace,lpad,rpad,concat
--�����Լ�
--��¥�Լ� 

--�빮�� �ҹ��� ����
select 'Welcome',upper('Welcome')
from dual;

select lower(ename),upper(ename)
from emp;

select *
from emp 
where ename = 'FORD';

select *
from emp
where lower(ename) = 'scott';

--Ư�� ���ڿ��� ���� 
select ename,length(ename)
from emp;

--���ڴ� �ε��� 1�� ���� �ٴ´�. 0x ('���ڿ�',������ġ,���ⰳ��)2����ġ���� 3�� ����
select 'Welcome to Oracle', substr('Welcome to Oracle',2,3)
from dual;

--���ⰳ�� ������ ���δ� 
select 'Welcome to Oracle', substr('Welcome to Oracle',2,3),substr('Welcome to Oracle',10)
from dual;

--������ġ�� ������ ���� (���ʿ��� ���������� ����)
select 'Welcome to Oracle', substr('Welcome to Oracle',-3),substr('Welcome to Oracle',-10)
from dual;

--dual�� ���� ���̺�
--Ư�� ������ ��ġ���� ��ȯ
select instr('Welcome to Oracle','o')
from dual;

--o�� 6���ĺ��� ã�ƶ� (������ġ�� 6)
select instr('Welcome to Oracle','o',6)
from dual;

--������ 3����, �׵ڷκ��� �ι�° o�� �ε��� 
select instr('Welcome to Oracle','o',3,2)
from dual;

--replace�Լ� 
--to �� of�� �ٲ۴�
select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
from dual;

--��ü���� ����
--lpad ���� : ��ĭ ���� ������ ĭ�� #�� ä��� 
--rpad ������ : ��ĭ ���� ������ ĭ�� *�� ä���
--��ü���� ���� ������ ����
select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),lpad('oracle',10)
from dual;

--�ֹι�ȣ ������ 
select rpad('990103-',14,'*')
from dual;

--������ ��ħ 
select concat(empno,ename), empno || '' || ename
from emp;

--=========== ����


--round �ݿø�
select 
        round(1234.5678),
        round(1234.5678,0), --�Ҽ��� ǥ��X
        round(1234.5678,1), --�Ҽ��� ù° �ڸ����� ǥ��
        round(1234.5678,2),
        round(1234.5678,-1) --������ �����κ��� �ݿø�
from dual;


--trunc ���� �׳� �������� (�ݿø�x)
select 
        trunc(1234.5678),
        trunc(1234.5678,0), --�Ҽ��� ǥ��X
        trunc(1234.5678,1), --�Ҽ��� ù° �ڸ��ڷ� �� ������. 0���� ������
        trunc(1234.5678,2),
        trunc(1234.5678,-1)
from dual;

--ceil floor
select 
        ceil(3.14), --�ڽź��� ū ���� ����� ���� 4
        foor(3.14),--�ڽź��� ���� ���� ����� ���� 3
        ceil(-3.14),-- -3
        ceil(-3.14) -- -4
from dual;

--������ ���ϱ� (5��2�γ��� ������, 10�� 4�γ��� ������)
select mod(5,2),mod(10,4)
from dual;

--��� Ȧ���� �����
select *
from emp
where mod(empno,2) = 1;