create view vw_emp02
as (select empno, ename, job, deptno
from emp
where deptno =20);

select *
from user_views;

select * from vw_emp02;


create table dept_cop
as
select * from dept;


create table emp_copy
as
select * from emp;


create or replace view emp_view30
as
select empno,ename,sal,deptno from emp_copy
where deptno = 30;

select * 
from emp_view30;

insert into emp_view30
values(1111,'hong',1000,30); 

insert into emp_view30(empno,ename,sal)
values(2222,'hong',1000);  --deptno가 null로 추출된다.

insert into emp_view30(empno,ename,sal,deptno)
values(3333,'hong',1000,50);  --deptno가 null이므로 추출이 안된다.


select * 
from emp_view30;

select * 
from emp_copy;

create or replace view emp_view2(사원번호,사원명,급여,부서번호)
as
select empno, ename, sal,deptno
from emp_copy;

select * from emp_view2;

select * 
from emp_view2
where deptno = 20;

create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select * from emp_dept_view;

create or replace view sal_view(dname,min_sal,max_sal)
as
select dname,min(sal) min_sal, max(sal) max_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;

select * from sal_view;

create or replace view sal_view2
as
select dname, min(sal) min_sal,max(sal) max_sal, round(avg(sal),0)as avg_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;

select * from sal_view2;


create or replace view view_chk30
as 
select empno, ename, sal,comm, deptno
from emp_copy
where deptno = 30 with check option;

select * from view_chk30;

update view_chk30
set deptno=10;


create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only;

update view_read30
set  deptno = 10;

select * from emp;

select * from emp
order by hiredate asc;

select * from emp
where hiredate <= '81/05/01' ; 

DESC emp;

select rownum,empno,ename,hiredate
from emp
where rownum <= 5;

select rownum,empno,ename,hiredate
from emp
order by hiredate asc;

select rm, b.*
from  ( 
            select rownum rm, a.*
            from (select empno,ename,hiredate
                       from emp
                       order by hiredate asc
                       )a
           )b           
where rm >= 2 and rm <= 4;

select rownum, empno, ename, hiredate
    from(
            select empno, ename, hiredate
            from emp
            order by hiredate asc)a
            
    where rownum <= 5;

select rownum, empno, ename, hiredate
from emp
where rownum<=5;

select rownum, empno, ename, hiredate
from emp
order by hiredate asc;

create or replace view view_hiredate2
as
select empno, ename, hiredate
from emp
order by hiredate asc;

select * from view_hiredate2;

select rownum, empno, ename, hiredate
from view_hiredate
where rownum between 1 and 5;

create or replace view view_hiredate_rm
as
select rownum rm, empno, ename, hiredate
from view_hiredate;

select rm, empno, ename, hiredate
from view_hiredate_rm

where rm >= 2 and rm <=4;


select table_name from user_tables;

select * 
from dba_users
where username = 'scott';

select *
from user_indexes;

select *
from user_ind_columns;

select * from user_tables;

select * from emp01;

select * from user_sequences;

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.nextval
from dual;

select dept_deptno_seq.currval
from dual;

create table emp03
as
select empno, ename, hiredate from emp
where 1!=1;

select * from emp03;

insert into emp03
values(emp_seq.nextval,'hong',sysdate);

create sequence emp_seq
increment by 1
start with 1;

drop sequence emp_seq;

