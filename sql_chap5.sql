--문제 1
select *from emp where job = (select job from emp where ename = '김사랑');
--문제 2
select ename, sal from emp where sal >= (select sal from emp where ename = '김사랑');
--문제 3
select ename, sal from emp where deptno =(select deptno from dept where loc = '용인');
--문제 4
select ename, sal from emp where mgr = (select empno from emp where ename = '장동건');

select *from emp;

select ename, sal, deptno from emp where deptno in(select distinct deptno from emp where sal >= 400);

select ename, sal from emp where sal > any(select sal from emp where deptno = 30);

--문제 5
select *from emp where (deptno, sal) in(select deptno, max(sal) from emp group by deptno);
select *from emp where sal in(select max(sal) from emp group by deptno);
--문제 6
select *from dept where deptno in(select deptno from emp where job = '과장');
--문제 7
select ename, sal, job from emp where sal > all(select sal from emp where job = '과장');
--문제 8
select ename, sal, job from emp where sal > any(select sal from emp where job = '과장');