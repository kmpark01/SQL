select sum(sal) from emp;

select count(*), count(comm) from emp;

select count(distinct job) from emp;

select deptno, avg(sal) from emp group by deptno;

select deptno, avg(sal) from emp group by deptno having avg(sal) >= 500;

select deptno, max(sal), min(sal) from emp group by deptno having avg(sal) <= 500;

--���� 1
select max(sal) as "Maximum", min(sal) as "Minumun", sum(sal) as "Sum", round(avg(sal)) as "Average" from emp;
--���� 2
select job, max(sal) as "Maximum", min(sal) as "Minumun", sum(sal) as "Sum", round(avg(sal)) as "Average" from emp group by job;
--���� 3
select job, count(*) as "������" from emp group by job;
--���� 4
select count(mgr) from emp;
--���� 5
select max(sal)-min(sal) as "����" from emp;
--���� 6
select job, min(sal) as "�����޿�" from emp group by job having min(sal) >= 500 order by "�����޿�" desc;
--���� 7
select deptno, count(*) as "Number Of People", round(avg(sal), 2) as "Sal" from emp group by deptno order by deptno asc;
--���� 8
--10 �渮�� ����, 20 �λ�� ��õ, 30 ������ ����, 40 ����� ����
select decode(deptno, 
        10, '�渮��', 
        20, '�λ��', 
        30, '������', 
        40, '�����', 
        'UNKNOWN') as "Dname",
    decode(deptno, 
         10, '����', 
         20, '��õ', 
         30, '����', 
         40, '����', 
        '��Ÿ') as "Location", count(*) as "Number Of People", round(avg(sal), 2) as "Sal" from emp group by deptno;

