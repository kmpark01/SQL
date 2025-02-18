desc user_tables;

select table_name from user_tables order by table_name desc;

desc all_tables;

create table DEPT_MISSION(DNO NUMBER(2),
                          DNAME VARCHAR(14),
                          LOC VARCHAR(13));
                          
select *from dept_mission;

create table EMP_MISSION(ENO NUMBER(4),
                         ENAME VARCHAR(10),
                         DNO NUMBER(2));

select *from emp_mission;                         

ALTER TABLE EMP_MISSION MODIFY(ENAME VARCHAR2(25));

DESC EMP_MISSION;

DROP TABLE EMP_MISSION;

ALTER TABLE DEPT_MISSION DROP COLUMN DNAME;

DESC DEPT_MISSION;

ALTER TABLE DEPT_MISSION SET UNUSED(LOC);

SELECT *FROM DEPT_MISSION;

ALTER TABLE DEPT_MISSION DROP UNUSED COLUMNS;

SELECT *FROM DEPT_MISSION;