--================================================ 1020 JOIN 

--2�� �̻��� ���̺��� �����͸� ��ȸ
--FROM ������ �ΰ� �̻��� ���̺��� �ۼ��Ѵ�
--WHERE �� ���� ������ �ۼ��Ѵ� 
--cross join (where�� ���� ���� �� �Ⱦ�)
--equi join (a�� b���̺��� �����÷��� ã�´�) (WHERE  ������� : =)
--non equi join (WHERE ���� ������ : AND, OR)
--self join(WHERE �ϳ��� ���̺��� ����Ѵ�)
--out join (WHERE�� �����Ǵ� �����͸� ���� ��ȸ�ϱ����� : (+)

--equi join
--������ �÷��� ���� ���̺�� �л�Ǿ����� 
SELECT EMP.ENAME,EMP.JOB,EMP.DEPTNO,DEPT.DNAME,DEPT.LOC
FROM EMP,DEPT --������ ���̺��� , �� �����Ͽ� �ۼ�
WHERE EMP.DEPTNO = DEPT.DEPTNO; --���� �÷��� ���ؼ� ���� ������ �����´� 


--SELECT ���� ������̺��� �÷����� . ���� ��� ���־�� �Ѵ� (�������̺� ��� �����ϴ� �÷�)
SELECT ENAME,JOB, EMP.DEPTNO,DNAME,LOC
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

--��Ī
SELECT ENAME,JOB, E.DEPTNO,DNAME,LOC
FROM EMP E,DEPT D --���̺� ��Ī�ο� (SELECT ���� ���̺� �� ��Ī���� �ٲپ���� �Ѵ�)
WHERE E.DEPTNO = D.DEPTNO
AND SAL >= 3000; --�����߰� : �������� ���. JOIN �� ����� ������ �߰��� ������ �����ϴ�

--non equi join(EQUI �ݴ� ������X) �� ����
--�޿��� ��� ��ȸ
--GRADE - SALGRADE ���̺�, ������ EMP
SELECT ENAME,SAL,GRADE,LOSAL,HISAL --��ġ�� ���̺� �ƴϱ⶧���� ��� X
FROM EMP E,SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
--WHERE E.SAL >= S.LOSAL AND E.SAL <= S.HISAL


--���, �̸�, �޿�, �μ���ȣ, �μ���, �޿���� 
--emp              dept           salgrade �� 
SELECT EMPNO,ENAME, SAL, D.DEPTNO, DNAME,GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO= D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;





--SELF JOIN( ���� �� �� �����ؼ� ���Ѵ�)
--�ϳ��� ���̺� �����Ͱ� �ֱ� �ϳ� �ϳ��� SELECT ������ ��ȸ�� �Ұ����Ҷ�
SELECT ENAME,MGR
FROM EMP;

--�ݵ�� ��Ī �ο�
SELECT E.EMPNO,E.ENAME,E.MGR,M.ENAME
FROM EMP E, EMP M  --������ �ϳ��� ���̺��� �������� 2���� ����
WHERE E.MGR = M.EMPNO; --SELFJOIND

--���� EMP���̺���20���� �ٹ��ϴ� ��� : SELF JOIN ���
SELECT ENAME,DEPTNO
FROM EMP
WHERE DEPTNO = 20;
--SCOTT�� ���� �μ��� �ٹ��ϴ� ���(�μ���ȣ ��)
SELECT WORK.ENAME,FRIEND.ENAME
FROM EMP WORK,EMP FRIEND
WHERE WORK.DEPTNO = FRIEND.DEPTNO
AND WORK.ENAME = 'SCOTT'
AND FRIEND.ENAME != 'SCOTT';




--�ܺ����� outerjoin
--��� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���ؼ� ��� 
--EX)NULL ���� ���� �� �����ϰ� NULL�� ���� ���� ���� ������ ������ �� ����


--������̺� NULL������ ������ M���� ����. ������ �� �����Ͱ� ���� ���̺��� �ȴ�

SELECT E.EMPNO,E.ENAME,E.MGR,M.ENAME
FROM EMP E,EMP M
WHERE E.MGR = M.EMPNO(+); --�����Ͱ� ���� ���̺� �ʿ� (+)�� ������


select ename,sal,d.deptno,dname
from emp e, dept d
where e.deptno(+) = d.deptno;


-----ANSI-JOIN (ǥ������ ���)************* innerjoin outerjoin 
--cross join
--natural join
-- inner join(equi,non equi,self)
--outer join(+) [left,right,full] +outer join(�� �� �ϳ��� ���� ����Ѵ�.)

select ename,sal,dname,loc
from emp e inner join dept d  --equijoin
on e.deptno = d.deptno;


select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) -- �������̺��� �÷����� �����Ѱ�� 
where ename = 'SCOTT'; --�߰� ������ ���� �� �ִ� 


select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

------------------------outer join 

select empno,emname, sal,grade
from emp e inner join salgrade s
 on e.sal between s.losal and hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m 
on e.mgr = m.empno;


select empno,enmae,sal,d.deptono,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrades s
on e.sal between s.losal and s.hisal;

--(+) ���� �����ϰ� �ۼ�(�Ϲ� outer join�� ǥ�� ansi join�������)
select ename,sal,d.deptno,dname
from emp e right outer join dept d
on e.deptno = d.deptno;

--���ʸ�� null ���� �ִ°�� outer join all

-----------------------------------------------p237��������
--8-1
--�޿��� 2000 �ʰ��� ������� �μ�����, ��������� ���
select e.deptno,dname,empno,ename,sal
from emp e, dept d
where e.deptno = d.deptno 
and sal > 2000;
--order by deptno;

--ANSI ��

SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.SAL
FROM EMP E INNER JOIN DEPT D
--USING(DEPTNO)
ON E.DEPTNO = D.DEPTNO
WHERE E.SAL > 2000;



--8-2
--�� �μ��� ��� �޿� ,�ִ�޿�, �ּұ޿�, ����� ���

select e.deptno,dname,avg(e.sal),max(e.sal),min(e.sal)
from emp e inner join dept d
on e.deptno = d.deptno
group by e.deptno,d.dname; ---�� d.dname�� �־�� ����????

--��
SELECT E.DEPTNO,
        D.DNAME,
        TRUNC(AVG(SAL)),
        MAX(SAL),
        MIN(SAL),
        COUNT(*)
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO,D.DNAME;




--8-3
--��� �μ� ������ ������ɸ� �μ���ȭ, ����̸������� ����
select d.deptno,dname,empno,ename,job,sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by deptno, ename;

---��
select d.deptno,d.dname,e.empno,ename,e.job,e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno, e.ename;



--4
select d.deptno,dname,empno,ename,mgr,sal,e.deptno,losal,hisal,grade,
from emp e,dept d,salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

--��

select d.deptno,dname,
        e.empno,e.ename,e.mgr,e.sal,e.deptno,
        s.losal,s.hisal,s.grade,
        m.empno, m.ename    
from emp e right outer join dept d
on e.deptno = d.deptno
full outer join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m 
on e.mgr = m.empno
order by d.deptno, e.empno;

--using (deptno ) group by ����� ���Ұ� ******

----------------------------------�������� 

select ename, max(sal) --�Ϲ��÷��� �׷��Լ� �Բ� ����� �� ����. �׷� �̸��̶� ���� ����ϰ������ �����?
from emp;

--��������
--select ������ ��ø�ؼ� ����ϴ� ��(where)

select ename,max(sal)
from emp;

---scott����� �ٹ��� �μ����� �˰����
select deptno
from emp
where ename = 'SCOTT';

select dname
from dept 
where deptno = 20;

--�μ���ȣ �ڸ��� ���� ��ü�� �־ ����Ѵ�.
--ū Ʋ�� �������� ()�ȿ� ��������

select dname
from dept
where deptno = (select deptno
from emp
where ename = 'SCOTT');



--�޿��� ���� ���� �޴� ���
--where������ �׷��Լ� ������ ��ӻ���
select ename,max(sal)
from emp; 

select ename,sal
from emp
where sal =(
select max(sal)
from emp);

--���󽺿� �ٹ��ϴ� ������� �̸�, �μ���ȣ ����ϰ� �;��
select ename, deptno
from emp
where deptno = (
        select deptno 
        from dept 
        where loc='DALLAS'
);

--���� ����� king�� ����� �̸��� �޿��� ��ȸ(�������������� �ۼ�)
select ename,sal
from emp
where mgr = (
            select empno
            from emp
            where ename = 'KING'
);

--���� ���� �κ��� ���������� �ٲ۰�(�Ʒ� �� ����� ����)
SELECT *
FROM EMP
WHERE SAL IN(5000,3000,2850);


--������ ��������
--IN : ����߿� �ϳ��� �����ϸ� �ȴ�
-- > ANY: ����߿� ���� ���������� ũ�� �ȴ�
-- > ALL : ����߿� ���� ū������ ũ��ȴ�.
SELECT *
FROM EMP
WHERE SAL IN (
        SELECT MAX(SAL)
        FROM EMP
        GROUP BY DEPTNO
        );

--ANY
SELECT *
FROM EMP
WHERE SAL > ANY (
        SELECT MAX(SAL) --���� ���������� ũ�� 
        FROM EMP
        GROUP BY DEPTNO
        );
  

--ALL ��Ÿ�� ���󵵵ȴ�
  --�μ��� 30�� ����� �޿�       
SELECT ENAME,SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL  --ALL ��ȸ�� �����͸� ��� �����ϴ�? ����ū������ ũ�� �ȴ٤Ǥ�??????????�����??????
            FROM EMP 
            WHERE DEPTNO = 30)
            
            
--------------------���� ���� �������� ���߿� ��������
SELECT *
FROM EMP
WHERE(DEPTNO,SAL) IN( --WHERE()���� ���� �� ���Ѵ� / AND ���� ó�� 
                    SELCET DEPTNO,MAX(SAL)
                    FROM EMP 
                    GROUP BY DEPTNO
                    
                    );
