CREATE SEQUENCE DEPT_DEPTNO_SEQ INCREMENT BY 10 START WITH 10;

SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;

SELECT DEPT_DEPTNO_SEQ.CURRVAL FROM DUAL;

CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000;

DROP TABLE EMP01;

CREATE TABLE EMP01(EMPNO NUMBER(4) PRIMARY KEY,
                   ENAME VARCHAR2(10),
                   HIREDATE DATE);

CREATE TABLE DEPT_EXAMPLE(
DEPTNO NUMBER(4) PRIMARY KEY,
DNAME VARCHAR2(15),
LOC VARCHAR2(15)
); 

CREATE SEQUENCE DEPT_EXAMPLE_SEQ START WITH 10 INCREMENT BY 10;

INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '경리부', '서울');
INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '인사부', '인천');
INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '영업부', '용인');
INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '전산부', '수원');