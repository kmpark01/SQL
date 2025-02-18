DROP TABLE BOOK;
DROP TABLE ORDERS;
DROP TABLE CUSTOMER;
CREATE TABLE BOOK(BOOKID NUMBER PRIMARY KEY,
                  BOOKNAME VARCHAR2(50),
                  PUBLISHER VARCHAR2(50),
                  PRICE NUMBER);
                  
CREATE TABLE CUSTOMER(CUSTOMERID NUMBER PRIMARY KEY,
                      NAME VARCHAR2(20),
                      ADDRESS VARCHAR2(50),
                      PHONE VARCHAR2(20));
                      
CREATE TABLE ORDERS(ORDERID NUMBER PRIMARY KEY,
                    CUSTOMERID NUMBER REFERENCES CUSTOMER(CUSTOMERID),
                    BOOKID NUMBER REFERENCES BOOK(BOOKID),
                    SALEPRICE NUMBER,
                    ORDERDATE DATE);
                    
insert into book values (1, '�౸�ǿ���', '�½�����', 7000);
insert into book values (2, '�౸�ƴ¿���', '������', 13000);
insert into book values (3, '�౸������', '���ѹ̵��', 22000);
insert into book values (4, '�������̺�', '���ѹ̵��', 35000);
insert into book values (5, '�ǰܱ���', '�½�����', 6000);
insert into book values (6, '�����ܰ躰���', '�½�����', 6000);
insert into book values (7, '�߱����߾�', '�̻�̵��', 20000);
insert into book values (8, '�߱�����Ź��', '�̻�̵��', 13000);
insert into book values (9, '�ø����̾߱�', '�Ｚ��', 7500);
insert into book values (10, '�ø���è�Ǿ�', '�Ǿ', 13000);

insert into customer values (1, '������', '���� ��ü����', '010-0000-0000');
insert into customer values (2, '�迬��', '���ѹα� ����', '010-1111-1111');
insert into customer values (3, '��̶�', '���ѹα� ������', '010-2222-2222');
insert into customer values (4, '�߽ż�', '�̱� �ػ罺', '010-4444-4444');
insert into customer values (5, '�ڼ���', '���ѹα� ����', '010-5555-5555');

insert into orders values (1, 1, 1, 6000, '2014-07-01');
insert into orders values (2, 1, 3, 21000, '2014-07-03');
insert into orders values (3, 2, 5, 8000, '2014-07-03');
insert into orders values (4, 3, 6, 6000, '2014-07-04');
insert into orders values (5, 4, 7, 20000, '2014-07-07');
insert into orders values (6, 1, 2, 12000, '2014-07-07');
insert into orders values (7, 4, 8, 13000, '2014-07-07');
insert into orders values (8, 3, 10, 12000, '2014-07-08');
insert into orders values (9, 2, 10, 7000, '2014-07-09');
insert into orders values (10, 3, 8, 13000, '2014-07-10');

commit;             

SELECT *FROM BOOK;
SELECT *FROM CUSTOMER;
SELECT *FROM ORDERS;

--4. bookid�� 1�� å�� �̸��� ����Ͻÿ�.
SELECT *FROM BOOK WHERE BOOKID = 1;
--5. ������ 20000�� �̻��� å�� �̸��� ��� ����Ͻÿ�.
SELECT *FROM BOOK WHERE PRICE >= 20000;
--6. ���ǻ� �ߺ��� �����Ͽ� ����Ͻÿ�.
SELECT DISTINCT PUBLISHER FROM BOOK;
--7. �� �Ǹŵ� å�� ������ ���ϰ�, �÷����� '���Ǹž�'���� ����Ͻÿ�.
SELECT SUM(SALEPRICE) AS "���Ǹž�" FROM ORDERS;
--8. �������� �� ���ž��� ���Ͻÿ�.
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '������');
--9. �������� ������ ���� ���� ���Ͻÿ�.
SELECT COUNT(CUSTOMERID) FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '������');
--10. 2014�� 7�� 4�Ϻ��� 7�� 7�� ���̿� �ֹ� ���� �ֹ� ������ ����Ͻÿ�. (+@ �Ⱓ ���� ���� ���)
SELECT *FROM ORDERS WHERE SUBSTR(ORDERDATE, -1) >= 4 AND SUBSTR(ORDERDATE, -1) <= 7;
SELECT *FROM ORDERS WHERE SUBSTR(ORDERDATE, -1) < 4 OR SUBSTR(ORDERDATE, -1) > 7;
--11. �ֹ��� ���� ���� ���� �̸��� ����Ͻÿ�.
SELECT NAME FROM CUSTOMER WHERE CUSTOMERID NOT IN (SELECT CUSTOMERID FROM ORDERS);
--12. �������� ������ ������ ���ǻ� ��(�ߺ�����)�� ����Ͻÿ�.
SELECT COUNT(DISTINCT PUBLISHER) FROM BOOK WHERE BOOKID IN (SELECT BOOKID FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '������'));
--13. ���� ��� �̸��� ���� �� ���ž��� �Բ� ����Ͻÿ�.
SELECT NAME, SUM(SALEPRICE) FROM CUSTOMER LEFT JOIN ORDERS ON CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID GROUP BY CUSTOMER.CUSTOMERID, NAME;
--13-1. ���� ������ �ִ� ���� �̸��� ���� �� ���ž��� �Բ� ����Ͻÿ�.
SELECT NAME, SUM(SALEPRICE) FROM CUSTOMER JOIN ORDERS ON CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID GROUP BY CUSTOMER.CUSTOMERID, NAME;
--13-2. ���� ��� �̸��� ���� �� ���ž��� �Բ� ����ϵ� ���� ������ ���� ���� ���� �ݾ��� 0���� ����Ͻÿ�.
SELECT NAME, NVL(SUM(SALEPRICE), 0) FROM CUSTOMER LEFT JOIN ORDERS ON CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID GROUP BY CUSTOMER.CUSTOMERID, NAME;