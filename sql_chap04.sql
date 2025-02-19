create table dept01(DEPTNO number(2),
                    DNAME varchar2(14));

insert into dept01 values(10, 'ACCOUNTING');
insert into dept01 values(20, 'RESEARCH');

create table dept02(DEPTNO number(2),
                    DNAME varchar(14));
                    
insert into dept02 values(10, 'ACCOUNTING');
insert into dept02 values(30, 'SALES');

select *from dept01;
select *from dept02;

select *from dept01 inner join dept02 on dept01.deptno = dept02.deptno;
select *from dept01 right outer join dept02 using(deptno);
select *from dept01 full outer join dept02 using(deptno);

--巩力 1
select ename, hiredate from dept inner join emp on dept.deptno = emp.deptno where dname = '版府何';
select ename, hiredate from emp, dept where emp.deptno = dept.deptno and dname = '版府何';
--巩力 2
select ename, sal from emp, dept where emp.deptno = dept.deptno and loc = '牢玫';