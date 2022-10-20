--================================================ 1020 JOIN 

--2개 이상의 테이블에서 데이터를 조회
--FROM 절에서 두개 이상의 테이블을 작성한다
--WHERE 에 조인 조건을 작성한다 
--cross join (where절 없이 조인 잘 안씀)
--equi join (a와 b테이블에서 공통컬럼을 찾는다) (WHERE  등가연산자 : =)
--non equi join (WHERE 범위 연산자 : AND, OR)
--self join(WHERE 하나의 테이블을 사용한다)
--out join (WHERE에 누락되는 데이터를 같이 조회하기위해 : (+)

--equi join
--가져올 컬럼이 여러 테이블로 분산되어있음 
SELECT EMP.ENAME,EMP.JOB,EMP.DEPTNO,DEPT.DNAME,DEPT.LOC
FROM EMP,DEPT --가져올 테이블을 , 로 구분하여 작성
WHERE EMP.DEPTNO = DEPT.DEPTNO; --공통 컬럼을 비교해서 같은 정보만 가져온다 


--SELECT 문에 어느테이블의 컬럼인지 . 으로 명시 해주어야 한다 (양쪽테이블에 모두 존재하는 컬럼)
SELECT ENAME,JOB, EMP.DEPTNO,DNAME,LOC
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

--별칭
SELECT ENAME,JOB, E.DEPTNO,DNAME,LOC
FROM EMP E,DEPT D --테이블에 별칭부여 (SELECT 문의 테이블 명도 별칭으로 바꾸어줘야 한다)
WHERE E.DEPTNO = D.DEPTNO
AND SAL >= 3000; --조건추가 : 논리연산자 사용. JOIN 된 결과를 가지고 추가된 조건이 만족하는

--non equi join(EQUI 반대 개념이X) 비등가 연산
--급여의 등급 조회
--GRADE - SALGRADE 테이블, 나머진 EMP
SELECT ENAME,SAL,GRADE,LOSAL,HISAL --겹치는 테이블 아니기때문에 명시 X
FROM EMP E,SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
--WHERE E.SAL >= S.LOSAL AND E.SAL <= S.HISAL


--사번, 이름, 급여, 부서번호, 부서명, 급여등급 
--emp              dept           salgrade 에 
SELECT EMPNO,ENAME, SAL, D.DEPTNO, DNAME,GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO= D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;





--SELF JOIN( 내가 내 껄 참조해서 비교한다)
--하나의 테이블에 데이터가 있긴 하나 하나의 SELECT 문으로 조회가 불가능할때
SELECT ENAME,MGR
FROM EMP;

--반드시 별칭 부여
SELECT E.EMPNO,E.ENAME,E.MGR,M.ENAME
FROM EMP E, EMP M  --물리적 하나의 테이블을 논리적으로 2개로 나눔
WHERE E.MGR = M.EMPNO; --SELFJOIND

--같은 EMP테이블에서20번에 근무하는 사원 : SELF JOIN 사용
SELECT ENAME,DEPTNO
FROM EMP
WHERE DEPTNO = 20;
--SCOTT과 같은 부서에 근무하는 사원(부서번호 모름)
SELECT WORK.ENAME,FRIEND.ENAME
FROM EMP WORK,EMP FRIEND
WHERE WORK.DEPTNO = FRIEND.DEPTNO
AND WORK.ENAME = 'SCOTT'
AND FRIEND.ENAME != 'SCOTT';




--외부조인 outerjoin
--등가시 누락되는 데이터를 같이 조회하기 위해서 사용 
--EX)NULL 값이 있을 때 동일하게 NULL을 가진 값이 없기 때문에 누락될 수 있음


--사원테이블엔 NULL데이터 있지만 M에는 없음. 비교했을 때 데이터가 없는 테이블이 된다

SELECT E.EMPNO,E.ENAME,E.MGR,M.ENAME
FROM EMP E,EMP M
WHERE E.MGR = M.EMPNO(+); --데이터가 없는 테이블 쪽에 (+)를 붙힌다


select ename,sal,d.deptno,dname
from emp e, dept d
where e.deptno(+) = d.deptno;


-----ANSI-JOIN (표준조인 방식)************* innerjoin outerjoin 
--cross join
--natural join
-- inner join(equi,non equi,self)
--outer join(+) [left,right,full] +outer join(셋 중 하나를 붙혀 써야한다.)

select ename,sal,dname,loc
from emp e inner join dept d  --equijoin
on e.deptno = d.deptno;


select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) -- 양쪽테이블의 컬럼명이 동일한경우 
where ename = 'SCOTT'; --추가 조건을 넣을 수 있다 


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

--(+) 사용과 동일하게 작성(일반 outer join을 표준 ansi join방식으로)
select ename,sal,d.deptno,dname
from emp e right outer join dept d
on e.deptno = d.deptno;

--양쪽모두 null 값이 있는경우 outer join all

-----------------------------------------------p237연습문제
--8-1
--급여가 2000 초과인 사원들의 부서정보, 사원정보를 출력
select e.deptno,dname,empno,ename,sal
from emp e, dept d
where e.deptno = d.deptno 
and sal > 2000;
--order by deptno;

--ANSI 답

SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.SAL
FROM EMP E INNER JOIN DEPT D
--USING(DEPTNO)
ON E.DEPTNO = D.DEPTNO
WHERE E.SAL > 2000;



--8-2
--각 부서별 평균 급여 ,최대급여, 최소급여, 사원수 출력

select e.deptno,dname,avg(e.sal),max(e.sal),min(e.sal)
from emp e inner join dept d
on e.deptno = d.deptno
group by e.deptno,d.dname; ---왜 d.dname꼭 있어야 하지????

--답
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
--모든 부서 정보와 사원저옵를 부서번화, 사원이름순으로 정렬
select d.deptno,dname,empno,ename,job,sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by deptno, ename;

---답
select d.deptno,d.dname,e.empno,ename,e.job,e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno, e.ename;



--4
select d.deptno,dname,empno,ename,mgr,sal,e.deptno,losal,hisal,grade,
from emp e,dept d,salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

--답

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

--using (deptno ) group by 적용시 사용불가 ******

----------------------------------서브쿼리 

select ename, max(sal) --일반컬럼과 그룹함수 함께 사용할 수 없다. 그럼 이름이랑 같이 출력하고싶은데 어떢하지?
from emp;

--서브쿼리
--select 구문을 중첩해서 사용하는 것(where)

select ename,max(sal)
from emp;

---scott사원의 근무지 부서명을 알고시퍼
select deptno
from emp
where ename = 'SCOTT';

select dname
from dept 
where deptno = 20;

--부서번호 자리에 쿼리 자체를 넣어서 출력한다.
--큰 틀이 메인쿼리 ()안에 서브쿼리

select dname
from dept
where deptno = (select deptno
from emp
where ename = 'SCOTT');



--급여를 가장 많이 받는 사원
--where절에는 그룹함수 못쓴다 계속생각
select ename,max(sal)
from emp; 

select ename,sal
from emp
where sal =(
select max(sal)
from emp);

--델라스에 근무하는 사람들의 이름, 부서번호 출력하고 싶어요
select ename, deptno
from emp
where deptno = (
        select deptno 
        from dept 
        where loc='DALLAS'
);

--직속 상관이 king인 사원의 이름과 급여를 조회(서브쿼리문으로 작성)
select ename,sal
from emp
where mgr = (
            select empno
            from emp
            where ename = 'KING'
);

--값을 적는 부분을 서브쿼리로 바꾼것(아래 위 결과가 같음)
SELECT *
FROM EMP
WHERE SAL IN(5000,3000,2850);


--다중행 서브쿼리
--IN : 결과중에 하나만 만족하면 된다
-- > ANY: 결과중에 가장 작은값보다 크면 된다
-- > ALL : 결과중에 가장 큰값보다 크면된다.
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
        SELECT MAX(SAL) --가장 작은값보다 크면 
        FROM EMP
        GROUP BY DEPTNO
        );
  

--ALL 기타는 몰라도된다
  --부서가 30인 사원의 급여       
SELECT ENAME,SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL  --ALL 조회된 데이터를 모두 만족하는? 가장큰값보다 크면 된다ㅗㄱ??????????뭐라고??????
            FROM EMP 
            WHERE DEPTNO = 30)
            
            
--------------------비교할 열이 여러개인 다중열 서브쿼리
SELECT *
FROM EMP
WHERE(DEPTNO,SAL) IN( --WHERE()내의 값을 각 비교한다 / AND 조건 처럼 
                    SELCET DEPTNO,MAX(SAL)
                    FROM EMP 
                    GROUP BY DEPTNO
                    
                    );
