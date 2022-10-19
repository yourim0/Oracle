--1019

--날짜함수    
--select sysdate -1 : 어제, sysdate : 오늘  sysdate+1 : 내일
-- from dual; 

select trunc((sysdate - hiredate)/365,1) as  근무일수 --차가 일수로 반환
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
        to_char(hiredate, 'YYYY-MM-DD DAY HH24:MI:SS') as 입사날짜
    from emp;
    
    select to_char(123456,'L999,999')
    from dual;
    
    select sal, to_char(sal,'$99,000') as sal
    from emp;
    
    select '20000' -1000
    from dual;   --자동형변환
    
    select '20,000' - '5,000' -- to_number()형변환필요
    from dual;
    
    select to_number('20,000','999,999') - to_number('5,000','999,999') as to_number
    from dual;
    
    select to_date('20221019','YYYY/MM/DD')
    from dual;
    
    select *
    from emp
    where hiredate < to_date('19820101','YYYY/MM/DD');
    
    -- nvl(comm,0) : comm이 null인 값을 0으로 대체
    select ename 사원명, sal, sal*12 + nvl(comm,0) as 연봉, comm -- 그냥 연봉에 comm 을 더하면 null값 때매 null이 됨 
    from emp;
    
    select * 
    from emp
    where mgr is null;
    
    select ename, job, mgr
    from emp
    where mgr is null;
    
    select ename, job, nvl(to_char(mgr,'9999'),'CEO') as mgr
    from emp
    where mgr is null;  --이렇게 바꿨지만, 실제 데이터값이바뀌는게 아니라 이렇게 조회한거다.
    
    select comm, nvl2(comm,'O','X') as OX
    from emp;
    
    select ename, job, deptno, decode(deptno, 10,'AAA',20,'BBB',30,'CCC','기타') as부서명
    from emp;
    
     
    select ename, job, deptno, 
           case when deptno = 10 then 'AAA'
                when deptno = 20 then 'BBB'
                when deptno = 30 then 'CCC'
                     else '기타'
                     end as 부서명
    from emp;
    
    select ename, job, sal,
        case 
        when sal between 3000 and 5000 then '임원'
        when sal >= 2000 and  sal <3000 then '관리자'
        when sal >= 500 and sal < 2000 then '사원'
        else '기타'
        end as 직무
        
         from emp;
    
    select *
    from customers;
    
    
--========================

--10/19 oe 계정 
select date_of_birth
from customers;

--select date_of_birth,to_char(date_of_birth,'YYYY/MM/DD')
select to_char(date_of_birth,'YYYY/MM/DD')
from customers;

--만 나이구하기 소수점 필요x
select date_of_birth,to_char(date_of_birth,'YYYY/MM/DD'),
        round((sysdate - date_of_birth) / 365) || '살' as 나이
from customers;


--10대~70대 기타로 표현 
select Round((sysdate - date_of_birth) / 365),
        case 
           -- when Round((sysdate - date_of_birth) / 365) >= 10 and Round((sysdate - date_of_birth / 365)) < 19 then '10대'
            when Round((sysdate - date_of_birth) / 365) between 10 and 19 then '10대'
            when Round((sysdate - date_of_birth) / 365) between 20 and 29 then '20대'
            when Round((sysdate - date_of_birth) / 365) between 30 and 39 then '30대'
            when Round((sysdate - date_of_birth) / 365) between 40 and 49 then '40대'
            when Round((sysdate - date_of_birth) / 365) between 50 and 59 then '50대'
            when Round((sysdate - date_of_birth) / 365) between 60 and 69 then '60대' 
            when Round((sysdate - date_of_birth) / 365) between 70 and 79 then '70대'
            else '기타'
            end as 나이대
from customers;


-----------------------p174 연습문제 풀이

---1번문제 정답:

select empno,rpad(substr(empno,1,2),4,'*'),
        ename, rpad(substr(ename,1,1),5,'*')
from  emp
where length(ename) >= 5
and length(ename) <6;
     
---2번문제 정답:
select empno,ename,sal,
        trunc(sal/21.5,2) as Day_pay, --소수점 둘째 뒤로 다버려
        round(sal / 21.5 /8,1) as Time_pay-- 소수점 첫째 자리까지 살린다
from emp;


---3번문제 정답:
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


--단일행함수 : 여러행의 결과를 한줄로 보여줌
--그룹 함수 :sum(), avg(), count(), max(), min()
--특징 : 일반컬럼과 함께 사용할 수 없다. 
-- 크기 비교가 가능한 모든 타입에 사용가능하다(날짜 등)

select sal
from emp;

select sum(sal)
from emp;

select avg(sal)
from emp;

select count(*)
from emp;

--급여를 가장 많이 받는 사람과 적게 받는 사람 
select max(sal),min(sal)
from emp; 
        
 --단일행 함수 사용시 일반 컬럼과 사용 불가하다 //오류 : ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
 --조회되는 모든 select 문의 컬럼수는 같아야 한다
select ename, max(sal)
from emp;


--20번 부서에서 가장 최근, 나중에 입사한사람
select min(hiredate),max(hiredate)
from emp
where deptno = 20;


--================================================ group by
--select 컬럼명
--from 테이블명
-- where 조건식
-- order by 컬럼명 정렬방식 ==> 맨 마지막에 작성한다

--union: 타입과 구조만 같으면  몇개가 같아도 괜차하 
--각 부서의 급여의 평균 
select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno  = 30;


--특징 1)
--group by절로 간결화
--각 기준이 같은 것들의 역할들을 묶어준다

--조회되는 컬럼의 개수가 같으면 일반함수와 사용할수 있다.
select deptno
from emp
group by deptno; --데이터 개수 :3

select avg(sal) --avg 개수 :3
from emp
group by deptno; --3개의 그룸끼리모인다

--합치면
select deptno, avg(sal)
from emp
group by deptno;

--정렬
select deptno,avg(sal)
from emp
group by deptno
order by deptno;

select avg(sal)
from emp
group by deptno, job; --deptno 중 job으로 또 나눠서 묶어주세요 , 각 부서별 job의 개수 만큼 나누어서 출력된다. 

select deptno,job,avg(sal)
from emp
group by deptno,job 
order by deptno,job; --deptno기준 정렬 후 job 기준으로 다시 정렬 (순차)

--================================================ having 절

--select 컬럼명
--from 테이블명
-- where 조건식 (그룹함수 사용불가 , 그룹함수를 조건절로 사용하는 건 having 절 밖에 없다) (group by, having 보다 먼저 실행된다)
--group by 기준 컬럼명
-- having 조건식 ( group  by 아니면 쓸일없음 짝!뀽!) , 그룹함수 사용한다
-- order by 컬럼명 정렬방식 ==> 맨 마지막에 작성한다

select deptno, avg(sal)
from emp
group by deptno
having  avg(sal) > 2000; --group화 된 값의 조건을 만들 수 있다 . group by에 의해서 조회 결과에 조건을 준다
                        -- 조건식을 작성할 때 그룹함수를 사용한다. 

select deptno,avg(sal)
from emp
where deptno != 10 --10번이 아닌 부서들을 그룹화 
group by deptno
having avg(sal) >= 2000;





