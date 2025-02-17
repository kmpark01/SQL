select hiredate from emp;

select substr(hiredate, 1, 2) as "년도", substr(hiredate, 4, 2) as "달" from emp;

select hiredate, to_char(hiredate, 'yyyy-mm-dd') from emp;

select ename, deptno, decode(deptno, 10, 'accounting',
                                    20, 'research',
                                    30, 'sales',
                                    40, 'operations')
                                    as dname from emp;
                                    
select *from emp;

--문제 1
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where substr(hiredate, 4, 2) = '10';
--문제 2
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where substr(hiredate, 1, 2) = '03';
--문제 3
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where substr(ename, 3, 3) = '기';
--문제 4
select empno, ename, job, sal, decode(job, '사원', sal*1.2,
                                           '대리', sal*1.15,
                                           '과장', sal*1.1,
                                           '부장', sal*1.05,
                                            sal)
                                            as upsal from emp;
--문제 5
select hiredate, to_char(hiredate, 'yyyy/mon/dd') as cdate from emp;