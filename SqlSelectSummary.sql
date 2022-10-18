--DQL(질의어)데이터 조회 교재 ~87페이지 10/17
--SELECT 컬럼명 
--FROM 테이블명 

--전체데이터
SELECT EMPNO,ename,JOB, MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP;

SELECT *
FROM EMP;

--부분컬럼 데이터
SELECT EMPNO,ENAME,SAL
FROM EMP;

SELECT DEPTNO 
FROM EMP;

--중복데이터 제외 
SELECT DISTINCT(DEPTNO)
FROM EMP;

SELECT DISTINCT(JOB)
FROM EMP;

--가능 연산자 : +,-,*,/ 나머지 연산자는 없음
--컬럼을 대상으로 연산한다
-- 가공을 통해 만들어지 데이터 
SELECT ENAME,SAL,SAL * 12
FROM EMP;

--null 값은 연산이 불가능하다 --전부 null로 표시 된다
--연산시 발생할 수 있는 오류 (COMM받지 않는 사람 연봉 정보는 나오지 않음)
SELECT ENAME,SAL,SAL*12 + COMM,COMM --COMMISSION 성과급 
FROM EMP;

--nvl(comm,0) : comm null일경우 연산과정에서 0으로 대체
--as(alias) 별칭: 컬럼에 별칭을 사용 할 수 있다. 
SELECT ENAME as 사원명,SAL,SAL*12 + nvl(comm,0) as 연봉,COMM --COMMISSION 성과급 
FROM EMP;



--데이터 정렬 교재 ~88페이지 10/18
--SELECT 컬럼명 
--FROM 테이블명 
--order by 컬럼명(정렬기준이 되는 값) asc(오름차순)/desc(내림차순)
--기본값은 오름차순으로 생략이 가능하다
--숫자(1~10), 날짜(과거날짜~최근날짜), 문자(사전순서)

select *
from emp
order by hiredate desc; --내림차순 정렬 

--조건검색
--select 컬럼명
--from 테이블명
--where 조건식(컬럼명 = 값); <,>,=,!=,/ <>,<=, >=, and, or

SELECT * FROM emp WHERE sal >= 3000; --급여가 3000이상인 사원

SELECT * FROM emp WHERE deptno = 30;

--and 두가지 이상의 조건이 모두 참인경우;
--테이블 데이터정보는 대소문자를 구별한다
SELECT * FROM emp WHERE deptno = 30 and job = 'SALESMAN' AND empno = 7499;

--문자를 조건절에 사용할 땐
 --대소문자 
 --' ' 주의
SELECT * FROM emp WHERE ename = 'ford';--소문자ford 라는 data 없음 소문자 유의

--날짜를 조건절에 사용할 때
--''
--날짜도 크기가 있다
--80/12/20 -> 1980 12 20 시간 분 초 요일 정보가 축약되어 들어가 있음

SELECT * FROM emp WHERE hiredate < '1982/01/01';

--or 두개 이상의 조건중에 하나이상 참인경우
SELECT * FROM emp WHERE deptno = 10 or sal >=2000;

--not 논리부정 연산자
select *
from emp
where sal != 3000;

--not결과와 !=결과가 같다
select *
from emp
where not sal = 3000;

--and, or
-- 범위 조건을 표현할 때 사용
select *
from emp
where sal >= 1000 and sal <= 3000;

select * 
from emp
where sal <= 1000 or sal >= 3000; --겹치지 않는 범위

--between
select *
from emp
where sal between 1000 and 3000; --결과 동일 

--in
select * 
from emp 
where sal = 800 or sal = 3000 or sal = 5000;


select *
from emp
where sal in (800, 3000, 5000);

--like연산자
--값의 일부만 가지고 데이터를 조회
--와일드 카드를 사용한다(%,_) 
--% 모든 문자를 대체한다
--_ 한 문자를 대체 

--F로 시작하는 모든 ename(뒤에 다른문자가 없어도 상관없다)
select *
from emp
where ename like 'F%';

--D로끝나는사람
select *
from emp
where ename like '%D';

--o가 포함된 문자
select *
from emp
where ename like '%O%';

--반드시 앞에 3글자(-)를 포함하고, D는 4번째 자리에 있어야한다
select *
from emp
where ename like '___D';

--s뒤 3글자는 무조건 와야하고 그 뒤는 있어도 없어도 무관하다.
--혼합해서 쓸 수 있다 
select * 
from emp
where ename like 'S___%';

-- null 연산 성립불가 --in null로 써야 함 
select *
from emp
where comm = null;

select *
from emp
where comm is null;

--null 아닌 데이터만 조회 
select *
from emp
where comm is not null;


--집합연산자
--두개의 select 구문을 사용한다
--컬럼의 갯수가 동일해야한다
--컬럼의 타입이 동일해야한다
--컬럼의 이름은 상관없다
--교집합, 합집합, 차집합

select empno,ename,sal,deptno
from emp
where deptno = 10
union --합집합
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
minus --차집합
select empno,ename,sal,deptno
from emp
where deptno = 10;


select empno,ename,sal,deptno
from emp
intersect--교집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

--where
--비교연산자 : <,>,=,!=, <>,<=, >=,  
--논리연산자 : and, or, not, between, and, in 
--like(%,_)
--is null / is not null
--집합연산자 : union, union all, minus, intersect

-----교재125
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

--- 선생님 답
select empno,ename,sal,deptno
from emp
where deptno in(20,30)
and sal > 2000;
--선생님 답
select empno,ename,sal,deptno
from emp
where deptno = 20 and sal >2000
union
select empno,ename,sal,deptno
from emp
where deptno = 30 and sal >2000; 




-------4 sal 2000이상 3000이하 범위 외 

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
