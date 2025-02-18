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
                    
insert into book values (1, '축구의역사', '굿스포츠', 7000);
insert into book values (2, '축구아는여자', '나무수', 13000);
insert into book values (3, '축구의이해', '대한미디어', 22000);
insert into book values (4, '골프바이블', '대한미디어', 35000);
insert into book values (5, '피겨교본', '굿스포츠', 6000);
insert into book values (6, '역도단계별기술', '굿스포츠', 6000);
insert into book values (7, '야구의추억', '이상미디어', 20000);
insert into book values (8, '야구를부탁해', '이상미디어', 13000);
insert into book values (9, '올림픽이야기', '삼성당', 7500);
insert into book values (10, '올림픽챔피언', '피어슨', 13000);

insert into customer values (1, '박지성', '영국 맨체스터', '010-0000-0000');
insert into customer values (2, '김연아', '대한민국 서울', '010-1111-1111');
insert into customer values (3, '장미란', '대한민국 강원도', '010-2222-2222');
insert into customer values (4, '추신수', '미국 텍사스', '010-4444-4444');
insert into customer values (5, '박세리', '대한민국 대전', '010-5555-5555');

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

--4. bookid가 1인 책의 이름을 출력하시오.
SELECT *FROM BOOK WHERE BOOKID = 1;
--5. 가격이 20000원 이상인 책의 이름을 모두 출력하시오.
SELECT *FROM BOOK WHERE PRICE >= 20000;
--6. 출판사 중복을 제거하여 출력하시오.
SELECT DISTINCT PUBLISHER FROM BOOK;
--7. 총 판매된 책의 가격을 구하고, 컬럼명을 '총판매액'으로 출력하시오.
SELECT SUM(SALEPRICE) AS "총판매액" FROM ORDERS;
--8. 박지성의 총 구매액을 구하시오.
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '박지성');
--9. 박지성의 구매한 도서 수를 구하시오.
SELECT COUNT(CUSTOMERID) FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '박지성');
--10. 2014년 7월 4일부터 7월 7일 사이에 주문 받은 주문 정보를 출력하시오. (+@ 기간 제외 정보 출력)
SELECT *FROM ORDERS WHERE SUBSTR(ORDERDATE, -1) >= 4 AND SUBSTR(ORDERDATE, -1) <= 7;
SELECT *FROM ORDERS WHERE SUBSTR(ORDERDATE, -1) < 4 OR SUBSTR(ORDERDATE, -1) > 7;
--11. 주문한 적이 없는 고객의 이름을 출력하시오.
SELECT NAME FROM CUSTOMER WHERE CUSTOMERID NOT IN (SELECT CUSTOMERID FROM ORDERS);
--12. 박지성이 구매한 도서의 출판사 수(중복없이)를 출력하시오.
SELECT COUNT(DISTINCT PUBLISHER) FROM BOOK WHERE BOOKID IN (SELECT BOOKID FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '박지성'));
--13. 고객의 모든 이름과 고객별 총 구매액을 함께 출력하시오.
SELECT NAME, SUM(SALEPRICE) FROM CUSTOMER LEFT JOIN ORDERS ON CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID GROUP BY CUSTOMER.CUSTOMERID, NAME;
--13-1. 구매 내역이 있는 고객의 이름과 고객별 총 구매액을 함께 출력하시오.
SELECT NAME, SUM(SALEPRICE) FROM CUSTOMER JOIN ORDERS ON CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID GROUP BY CUSTOMER.CUSTOMERID, NAME;
--13-2. 고객의 모든 이름과 고객별 총 구매액을 함께 출력하되 구매 내역이 없는 고객의 구매 금액은 0으로 출력하시오.
SELECT NAME, NVL(SUM(SALEPRICE), 0) FROM CUSTOMER LEFT JOIN ORDERS ON CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID GROUP BY CUSTOMER.CUSTOMERID, NAME;