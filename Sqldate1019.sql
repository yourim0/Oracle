--1019

--��¥�Լ�    
--select sysdate -1 : ����, sysdate : ����  sysdate+1 : ����
-- from dual; 

select trunc((sysdate - hiredate)/365,1) as  �ٹ��ϼ� --���� �ϼ��� ��ȯ
from emp;


select sysdate,
    round(sysdate, 'CC') as cc,
    round(sysdate, 'YYYY') as YYYY,
     round(sysdate, 'Q') as Q,
     round(sysdate, 'D') as D,
     round(sysdate, 'DDD') as DDD,
     round(sysdate, 'HH') as HH
from emp;

select sysdate,
    trunc(sysdate, 'CC') as cc,
    trunc(sysdate, 'YYYY') as YYYY,
    trunc(sysdate, 'Q') as Q,
    trunc(sysdate, 'D') as D,
    trunc(sysdate, 'DDD') as DDD,
    trunc(sysdate, 'HH') as HH
    
    from emp;
    
    
    select hiredate,
        to_char(hiredate, 'YYYY-MM-DD DAY HH24:MI:SS') as �Ի糯¥
    from emp;
    
    select to_char(123456,'L999,999')
    from dual;
    
    select sal, to_char(sal,'$99,000') as sal
    from emp;
    
    select '20000' -1000
    from dual;   --�ڵ�����ȯ
    
    select '20,000' - '5,000' -- to_number()����ȯ�ʿ�
    from dual;
    
    select to_number('20,000','999,999') - to_number('5,000','999,999') as to_number
    from dual;
    
    select to_date('20221019','YYYY/MM/DD')
    from dual;
    
    select *
    from emp
    where hiredate < to_date('19820101','YYYY/MM/DD');
    
    -- nvl(comm,0) : comm�� null�� ���� 0���� ��ü
    select ename �����, sal, sal*12 + nvl(comm,0) as ����, comm -- �׳� ������ comm �� ���ϸ� null�� ���� null�� �� 
    from emp;
    
    select * 
    from emp
    where mgr is null;
    
    select ename, job, mgr
    from emp
    where mgr is null;
    
    select ename, job, nvl(to_char(mgr,'9999'),'CEO') as mgr
    from emp
    where mgr is null;  --�̷��� �ٲ�����, ���� �����Ͱ��̹ٲ�°� �ƴ϶� �̷��� ��ȸ�ѰŴ�.
    
    select comm, nvl2(comm,'O','X') as OX
    from emp;
    
    select ename, job, deptno, decode(deptno, 10,'AAA',20,'BBB',30,'CCC','��Ÿ') as�μ���
    from emp;
    
     
    select ename, job, deptno, 
           case when deptno = 10 then 'AAA'
                when deptno = 20 then 'BBB'
                when deptno = 30 then 'CCC'
                     else '��Ÿ'
                     end as �μ���
    from emp;
    
    select ename, job, sal,
        case 
        when sal between 3000 and 5000 then '�ӿ�'
        when sal >= 2000 and  sal <3000 then '������'
        when sal >= 500 and sal < 2000 then '���'
        else '��Ÿ'
        end as ����
        
         from emp;
    
    select *
    from customers;
    
    
--========================

--10/19 oe ���� 
select date_of_birth
from customers;

--select date_of_birth,to_char(date_of_birth,'YYYY/MM/DD')
select to_char(date_of_birth,'YYYY/MM/DD')
from customers;

--�� ���̱��ϱ� �Ҽ��� �ʿ�x
select date_of_birth,to_char(date_of_birth,'YYYY/MM/DD'),
        round((sysdate - date_of_birth) / 365) || '��' as ����
from customers;


--10��~70�� ��Ÿ�� ǥ�� 
select Round((sysdate - date_of_birth) / 365),
        case 
           -- when Round((sysdate - date_of_birth) / 365) >= 10 and Round((sysdate - date_of_birth / 365)) < 19 then '10��'
            when Round((sysdate - date_of_birth) / 365) between 10 and 19 then '10��'
            when Round((sysdate - date_of_birth) / 365) between 20 and 29 then '20��'
            when Round((sysdate - date_of_birth) / 365) between 30 and 39 then '30��'
            when Round((sysdate - date_of_birth) / 365) between 40 and 49 then '40��'
            when Round((sysdate - date_of_birth) / 365) between 50 and 59 then '50��'
            when Round((sysdate - date_of_birth) / 365) between 60 and 69 then '60��' 
            when Round((sysdate - date_of_birth) / 365) between 70 and 79 then '70��'
            else '��Ÿ'
            end as ���̴�
from customers;


-----------------------p174 �������� Ǯ��

---1������ ����:

select empno,rpad(substr(empno,1,2),4,'*'),
        ename, rpad(substr(ename,1,1),5,'*')
from  emp
where length(ename) >= 5
and length(ename) <6;
     
---2������ ����:
select empno,ename,sal,
        trunc(sal/21.5,2) as Day_pay, --�Ҽ��� ��° �ڷ� �ٹ���
        round(sal / 21.5 /8,1) as Time_pay-- �Ҽ��� ù° �ڸ����� �츰��
from emp;


---3������ ����:
select empno,ename,mgr,
        case
                when substr(mgr,1,2) = '75' then '5555'
                when substr(mgr,1,2) = '76' then '5555'
                when substr(mgr,1,2) = '77' then '5555'
                when substr(mgr,1,2) = '78' then '5555'
                when mgr is null then '0000'
                else to_char(mgr)
                end as CHG_MGR
        from emp;
        
--============================================ p177


--�������Լ� : �������� ����� ���ٷ� ������
--�׷� �Լ� :sum(), avg(), count(), max(), min()
--Ư¡ : �Ϲ��÷��� �Բ� ����� �� ����. 
-- ũ�� �񱳰� ������ ��� Ÿ�Կ� ��밡���ϴ�(��¥ ��)

select sal
from emp;

select sum(sal)
from emp;

select avg(sal)
from emp;

select count(*)
from emp;

--�޿��� ���� ���� �޴� ����� ���� �޴� ��� 
select max(sal),min(sal)
from emp; 
        
 --������ �Լ� ���� �Ϲ� �÷��� ��� �Ұ��ϴ� //���� : ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
 --��ȸ�Ǵ� ��� select ���� �÷����� ���ƾ� �Ѵ�
select ename, max(sal)
from emp;


--20�� �μ����� ���� �ֱ�, ���߿� �Ի��ѻ��
select min(hiredate),max(hiredate)
from emp
where deptno = 20;


--================================================ group by
--select �÷���
--from ���̺��
-- where ���ǽ�
-- order by �÷��� ���Ĺ�� ==> �� �������� �ۼ��Ѵ�

--union: Ÿ�԰� ������ ������  ��� ���Ƶ� ������ 
--�� �μ��� �޿��� ��� 
select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno  = 30;


--Ư¡ 1)
--group by���� ����ȭ
--�� ������ ���� �͵��� ���ҵ��� �����ش�

--��ȸ�Ǵ� �÷��� ������ ������ �Ϲ��Լ��� ����Ҽ� �ִ�.
select deptno
from emp
group by deptno; --������ ���� :3

select avg(sal) --avg ���� :3
from emp
group by deptno; --3���� �׷볢�����δ�

--��ġ��
select deptno, avg(sal)
from emp
group by deptno;

--����
select deptno,avg(sal)
from emp
group by deptno
order by deptno;

select avg(sal)
from emp
group by deptno, job; --deptno �� job���� �� ������ �����ּ��� , �� �μ��� job�� ���� ��ŭ ����� ��µȴ�. 

select deptno,job,avg(sal)
from emp
group by deptno,job 
order by deptno,job; --deptno���� ���� �� job �������� �ٽ� ���� (����)

--================================================ having ��

--select �÷���
--from ���̺��
-- where ���ǽ� (�׷��Լ� ���Ұ� , �׷��Լ��� �������� ����ϴ� �� having �� �ۿ� ����) (group by, having ���� ���� ����ȴ�)
--group by ���� �÷���
-- having ���ǽ� ( group  by �ƴϸ� ���Ͼ��� ¦!��!) , �׷��Լ� ����Ѵ�
-- order by �÷��� ���Ĺ�� ==> �� �������� �ۼ��Ѵ�

select deptno, avg(sal)
from emp
group by deptno
having  avg(sal) > 2000; --groupȭ �� ���� ������ ���� �� �ִ� . group by�� ���ؼ� ��ȸ ����� ������ �ش�
                        -- ���ǽ��� �ۼ��� �� �׷��Լ��� ����Ѵ�. 

select deptno,avg(sal)
from emp
where deptno != 10 --10���� �ƴ� �μ����� �׷�ȭ 
group by deptno
having avg(sal) >= 2000;





