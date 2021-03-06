CREATE TABLE BOOK_TBL(
	BCODE	NUMBER(5, 0) NOT NULL PRIMARY KEY,
	BTITLE	VARCHAR2(30),
	BWRITER	VARCHAR2(30),
	BPUB	NUMBER(4, 0),
	BPRICE	NUMBER(10, 0),
	BDATE	DATE NOT NULL
);

INSERT INTO BOOK_TBL VALUES(10100, '자바킹', '강길동', 1001, 12000, '20201102');
INSERT INTO BOOK_TBL VALUES(10101, '알고리즘', '남길동', 1002, 18000, '20200505');
INSERT INTO BOOK_TBL VALUES(10102, '스프링두', '서길동', 1003, 23000, '20190803');
INSERT INTO BOOK_TBL VALUES(10103, '파이썬', '홍길동', 1001, 12000, '20191011');

DELETE FROM BOOK_TBL WHERE BCODE = 10104;