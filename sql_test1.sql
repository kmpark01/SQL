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

--1) userNo �� 5 �̻��� ȸ���� �˻��Ͻÿ�.
SELECT *FROM USERTABLE WHERE USERNO >= 5;
--2) userNo �� 3 ~ 7 ������ ȸ���� �˻��Ͻÿ�.
SELECT *FROM USERTABLE WHERE USERNO BETWEEN 3 AND 7;
--3) userTel ������ 4�ڸ��� '5555' �� ȸ���� �˻��Ͻÿ�.
SELECT *FROM USERTABLE WHERE SUBSTR(USERTEL, -4) = '6666';
--4) userMembership �� 'gold' �� ȸ���� userPoint ����� ����Ͻÿ�. 
SELECT AVG(USERPOINT) FROM USERTABLE WHERE USERMEMBERSHIP = 'gold';
--5) userId �� 'id03' �� ȸ���� joinDate �� '2019/10/28/'�� �����Ͻÿ�.
UPDATE USERTABLE SET JOINDATE = '2019/10/28' WHERE USERID = 'id03';
SELECT JOINDATE FROM USERTABLE WHERE USERID = 'id03';
--6) userMembership �� 'gold' �� ȸ������ userPoint �� ��� 3�� ������Ű�ÿ�.
UPDATE USERTABLE SET USERPOINT = USERPOINT * 3 WHERE USERMEMBERSHIP = 'gold';
SELECT USERPOINT FROM USERTABLE WHERE USERMEMBERSHIP = 'gold';
--7) userId �� 'id08' �� ȸ���� userPw �� '2222'�� �����Ͻÿ�.
UPDATE USERTABLE SET USERPW = '2222' WHERE USERID = 'id08';
SELECT USERPW FROM USERTABLE WHERE USERID = 'id08';
--8) userMembership �� 'bronze' �� ȸ���� �߿��� userPoint �� 1000 �̻��� ȸ������ userMembership �� 'silver'�� �����Ͻÿ�.
UPDATE USERTABLE SET USERMEMBERSHIP = 'silver' WHERE USERMEMBERSHIP = 'bronze' AND USERPOINT >= 1000;
SELECT USERMEMBERSHIP, USERPOINT FROM USERTABLE WHERE USERPOINT >= 1000;
--9) userNo �� 5 �� ȸ���� �����Ͻÿ�.
DELETE FROM USERTABLE WHERE USERNO = 5;
SELECT *FROM USERTABLE;