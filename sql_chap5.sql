--���� 1
select *from emp where job = (select job from emp where ename = '����');
--���� 2
select ename, sal from emp where sal >= (select sal from emp where ename = '����');
--���� 3
select ename, sal from emp where deptno =(select deptno from dept where loc = '����');
--���� 4
select ename, sal from emp where mgr = (select empno from emp where ename = '�嵿��');

select *from emp;

select ename, sal, deptno from emp where deptno in(select distinct deptno from emp where sal >= 400);

select ename, sal from emp where sal > any(select sal from emp where deptno = 30);

--���� 5
select *from emp where (deptno, sal) in(select deptno, max(sal) from emp group by deptno);
select *from emp where sal in(select max(sal) from emp group by deptno);
--���� 6
select *from dept where deptno in(select deptno from emp where job = '����');
--���� 7
select ename, sal, job from emp where sal > all(select sal from emp where job = '����');
--���� 8
select ename, sal, job from emp where sal > any(select sal from emp where job = '����');