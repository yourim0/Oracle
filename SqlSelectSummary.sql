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
