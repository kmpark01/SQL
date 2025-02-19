select sum(sal) from emp;

select count(*), count(comm) from emp;

select count(distinct job) from emp;

select deptno, avg(sal) from emp group by deptno;

select deptno, avg(sal) from emp group by deptno having avg(sal) >= 500;

select deptno, max(sal), min(sal) from emp group by deptno having avg(sal) <= 500;

--문제 1
select max(sal) as "Maximum", min(sal) as "Minumun", sum(sal) as "Sum", round(avg(sal)) as "Average" from emp;
--문제 2
select job, max(sal) as "Maximum", min(sal) as "Minumun", sum(sal) as "Sum", round(avg(sal)) as "Average" from emp group by job;
--문제 3
select job, count(*) as "직원수" from emp group by job;
--문제 4
select count(mgr) from emp;
--문제 5
select max(sal)-min(sal) as "차액" from emp;
--문제 6
select job, min(sal) as "최저급여" from emp group by job having min(sal) >= 500 order by "최저급여" desc;
--문제 7
select deptno, count(*) as "Number Of People", round(avg(sal), 2) as "Sal" from emp group by deptno order by deptno asc;
--문제 8
--10 경리부 서울, 20 인사부 인천, 30 영업부 용인, 40 전산부 수원
select decode(deptno, 
        10, '경리부', 
        20, '인사부', 
        30, '영업부', 
        40, '전산부', 
        'UNKNOWN') as "Dname",
    decode(deptno, 
         10, '서울', 
         20, '인천', 
         30, '용인', 
         40, '수원', 
        '기타') as "Location", count(*) as "Number Of People", round(avg(sal), 2) as "Sal" from emp group by deptno;

