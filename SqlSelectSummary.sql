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

--------------------------------------오라클 함수

--함수
--문자함수 :upper,lower,substr,instr,replace,lpad,rpad,concat
--숫자함수
--날짜함수 

--대문자 소문자 변경
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

--특정 문자열의 길이 
select ename,length(ename)
from emp;

--글자당 인덱스 1번 부터 붙는다. 0x ('문자열',시작위치,추출개수)2번위치부터 3개 추출
select 'Welcome to Oracle', substr('Welcome to Oracle',2,3)
from dual;

--추출개수 없으면 전부다 
select 'Welcome to Oracle', substr('Welcome to Oracle',2,3),substr('Welcome to Oracle',10)
from dual;

--시작위치를 음수로 설정 (왼쪽에서 오른쪽으로 변경)
select 'Welcome to Oracle', substr('Welcome to Oracle',-3),substr('Welcome to Oracle',-10)
from dual;

--dual은 가상 테이블
--특정 문자의 위치값을 반환
select instr('Welcome to Oracle','o')
from dual;

--o를 6이후부터 찾아라 (시작위치가 6)
select instr('Welcome to Oracle','o',6)
from dual;

--시작은 3부터, 그뒤로부터 두번째 o의 인덱스 
select instr('Welcome to Oracle','o',3,2)
from dual;

--replace함수 
--to 를 of로 바꾼다
select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
from dual;

--대체문자 삽입
--lpad 왼쪽 : 열칸 기준 부족한 칸수 #로 채우기 
--rpad 오른쪽 : 열칸 기준 부족한 칸수 *로 채우기
--대체문자 넣지 않으면 공백
select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),lpad('oracle',10)
from dual;

--주민번호 가리기 
select rpad('990103-',14,'*')
from dual;

--데이터 합침 
select concat(empno,ename), empno || '' || ename
from emp;

--=========== 숫자


--round 반올림
select 
        round(1234.5678),
        round(1234.5678,0), --소수점 표시X
        round(1234.5678,1), --소수점 첫째 자리까지 표현
        round(1234.5678,2),
        round(1234.5678,-1) --음수는 정수부분을 반올림
from dual;


--trunc 값을 그냥 버려버림 (반올림x)
select 
        trunc(1234.5678),
        trunc(1234.5678,0), --소수점 표시X
        trunc(1234.5678,1), --소수점 첫째 자리뒤로 다 벼려라. 0으로 만들어라
        trunc(1234.5678,2),
        trunc(1234.5678,-1)
from dual;

--ceil floor
select 
        ceil(3.14), --자신보다 큰 가장 가까운 정수 4
        foor(3.14),--자신보다 작은 가장 가까운 정수 3
        ceil(-3.14),-- -3
        ceil(-3.14) -- -4
from dual;

--나머지 구하기 (5를2로나눈 나머지, 10을 4로나눈 나머지)
select mod(5,2),mod(10,4)
from dual;

--사번 홀수인 사원수
select *
from emp
where mod(empno,2) = 1;