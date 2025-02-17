select hiredate from emp;

select substr(hiredate, 1, 2) as "�⵵", substr(hiredate, 4, 2) as "��" from emp;

select hiredate, to_char(hiredate, 'yyyy-mm-dd') from emp;

select ename, deptno, decode(deptno, 10, 'accounting',
                                    20, 'research',
                                    30, 'sales',
                                    40, 'operations')
                                    as dname from emp;
                                    
select *from emp;

--���� 1
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where substr(hiredate, 4, 2) = '10';
--���� 2
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where substr(hiredate, 1, 2) = '03';
--���� 3
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where substr(ename, 3, 3) = '��';
--���� 4
select empno, ename, job, sal, decode(job, '���', sal*1.2,
                                           '�븮', sal*1.15,
                                           '����', sal*1.1,
                                           '����', sal*1.05,
                                            sal)
                                            as upsal from emp;
--���� 5
select hiredate, to_char(hiredate, 'yyyy/mon/dd') as cdate from emp;