select ename, sal, job, nvl(comm,0), sal*12, sal*12+nvl(comm,0) from emp;

select * from emp, dept;

select ename as name, sal as "salary" from emp;

select ename || 'is a' || job from emp;

select distinct deptno from emp;

select ename from emp, dept where loc = '����';

select ename, sal, hiredate from emp;

select deptno as "�μ���ȣ", dname as "�μ��̸�" from dept order by dname asc;

select distinct job as "����" from emp;

select * from emp where sal = 300 or sal = 500 or sal = 1000;
select *from emp where sal in(300, 500, 1000);

select * from emp where ename like '_��_';

select * from emp where comm is null;

--����1
select empno, ename, sal from emp where sal <= 300;
--����2
select empno, ename, sal from emp where ename = '����ȣ';
--����3
select empno, ename, sal from emp where sal = 250 or sal = 300 or sal = 500;

select empno, ename, sal from emp where sal in(250, 300, 500);
--����4
select empno, ename, sal from emp where not sal = 250 or sal = 300 or sal = 500;

select empno, ename, sal from emp where sal not in(250, 300, 500);
--����5
select empno, ename from emp where ename like '��%' or ename like '%��%';
--����6
select *from emp where mgr is null;
--����7
select empno, ename, job, hiredate from emp order by hiredate desc;
--����8
select *from emp order by deptno asc, hiredate asc;
