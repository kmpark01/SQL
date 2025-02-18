DROP TABLE USERTABLE;

CREATE TABLE userTable(userNo NUMBER PRIMARY KEY,
                       userId VARCHAR2(20) NOT NULL UNIQUE,
                       userPw VARCHAR2(20) NOT NULL,
                       userTel VARCHAR2(20) UNIQUE,
                       userMembership VARCHAR2(10) CHECK(userMembership IN('gold', 'silver', 'bronze')),
                       userEmail VARCHAR2(20) UNIQUE,
                       userPoint NUMBER DEFAULT 1000,
                       joinDate DATE DEFAULT SYSDATE);
                       
SELECT *FROM USERTABLE;                       
                       
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (1, 'id01', '1111', '010-1111-1111', 'gold', 'id01@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (2, 'id02', '1112', '010-1111-2222', 'silver', 'id02@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (3, 'id03', '1113', '010-1111-3333', 'bronze', 'id03@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (4, 'id04', '1114', '010-1111-4444', 'gold', 'id04@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (5, 'id05', '1115', '010-1111-5555', 'silver', 'id05@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (6, 'id06', '1116', '010-1111-6666', 'bronze', 'id06@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (7, 'id07', '1117', '010-1111-7777', 'gold', 'id07@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (8, 'id08', '1118', '010-1111-8888', 'silver', 'id08@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (9, 'id09', '1119', '010-1111-9999', 'bronze', 'id09@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (10, 'id10', '1110', '010-1111-0000', 'gold', 'id10@aa.com');
commit;    

--1) userNo 이 5 이상인 회원을 검색하시오.
SELECT *FROM USERTABLE WHERE USERNO >= 5;
--2) userNo 이 3 ~ 7 사이인 회원을 검색하시오.
SELECT *FROM USERTABLE WHERE USERNO BETWEEN 3 AND 7;
--3) userTel 마지막 4자리가 '5555' 인 회원을 검색하시오.
SELECT *FROM USERTABLE WHERE SUBSTR(USERTEL, -4) = '6666';
--4) userMembership 이 'gold' 인 회원의 userPoint 평균을 출력하시오. 
SELECT AVG(USERPOINT) FROM USERTABLE WHERE USERMEMBERSHIP = 'gold';
--5) userId 가 'id03' 인 회원의 joinDate 를 '2019/10/28/'로 수정하시오.
UPDATE USERTABLE SET JOINDATE = '2019/10/28' WHERE USERID = 'id03';
SELECT JOINDATE FROM USERTABLE WHERE USERID = 'id03';
--6) userMembership 이 'gold' 인 회원들의 userPoint 를 모두 3배 증가시키시오.
UPDATE USERTABLE SET USERPOINT = USERPOINT * 3 WHERE USERMEMBERSHIP = 'gold';
SELECT USERPOINT FROM USERTABLE WHERE USERMEMBERSHIP = 'gold';
--7) userId 가 'id08' 인 회원의 userPw 를 '2222'로 수정하시오.
UPDATE USERTABLE SET USERPW = '2222' WHERE USERID = 'id08';
SELECT USERPW FROM USERTABLE WHERE USERID = 'id08';
--8) userMembership 이 'bronze' 인 회원들 중에서 userPoint 가 1000 이상인 회원들의 userMembership 을 'silver'로 수정하시오.
UPDATE USERTABLE SET USERMEMBERSHIP = 'silver' WHERE USERMEMBERSHIP = 'bronze' AND USERPOINT >= 1000;
SELECT USERMEMBERSHIP, USERPOINT FROM USERTABLE WHERE USERPOINT >= 1000;
--9) userNo 가 5 인 회원을 삭제하시오.
DELETE FROM USERTABLE WHERE USERNO = 5;
SELECT *FROM USERTABLE;