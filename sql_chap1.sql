select ename, sal, job, nvl(comm,0), sal*12, sal*12+nvl(comm,0) from emp;

select * from emp, dept;

select ename as name, sal as "salary" from emp;

select ename || 'is a' || job from emp;

select distinct deptno from emp;

select ename from emp, dept where loc = '서울';

select ename, sal, hiredate from emp;

select deptno as "부서번호", dname as "부서이름" from dept order by dname asc;

select distinct job as "직급" from emp;

select * from emp where sal = 300 or sal = 500 or sal = 1000;
select *from emp where sal in(300, 500, 1000);

select * from emp where ename like '_동_';

select * from emp where comm is null;

--문제1
select empno, ename, sal from emp where sal <= 300;
--문제2
select empno, ename, sal from emp where ename = '오지호';
--문제3
select empno, ename, sal from emp where sal = 250 or sal = 300 or sal = 500;

select empno, ename, sal from emp where sal in(250, 300, 500);
--문제4
select empno, ename, sal from emp where not sal = 250 or sal = 300 or sal = 500;

select empno, ename, sal from emp where sal not in(250, 300, 500);
--문제5
select empno, ename from emp where ename like '김%' or ename like '%기%';
--문제6
select *from emp where mgr is null;
--문제7
select empno, ename, job, hiredate from emp order by hiredate desc;
--문제8
select *from emp order by deptno asc, hiredate asc;
