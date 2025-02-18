create table emp02 as select *from emp;

create table emp03 as select empno, ename from emp;

create table emp04 as select *from emp where deptno = 10;

select *from emp02;

desc emp01;

create table emp06 as select empno, ename, sal from emp;

drop table emp06;

alter table emp01 add(JOB number(9));

alter table emp01 modify(JOB number(30));

alter table emp01 drop column job;

drop table emp02;

create table emp02 as select *from emp;

alter table emp02 set unused(JOB);
