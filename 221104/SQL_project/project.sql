create table book (                                     -- ���̺� ����
        book_id     number(5),                         -- å ��ȣ (ID)      number : int�� ���� ���� �ڷ���
        title           varchar2(50),                      -- å ����            varchar2 : char�� ���� ���� �ڷ���
        author       varchar2(10),                      -- ����
        pub_date    date                                  -- ��¥ + �ð�
);

ALTER TABLE book ADD (pubs VARCHAR2(50));           -- �÷� �߰�

ALTER TABLE book MODIFY (title VARCHAR2(100));       -- �÷� ����

ALTER TABLE book DROP (author);                              -- �÷� ����

ALTER TABLE book ADD (author VARCHAR2(10));


RENAME book TO article;                 -- ���̺�� ����

DROP TABLE article;                       -- ���̺� ����

DROP TABLE BOOK;

-- author ���̺� �����
CREATE TABLE author (
        author_id           NUMBER(10),
        author_name      VARCHAR2(100) NOT NULL,
        author_desc       VARCHAR2(500),
        PRIMARY KEY(author_id)
);

-- book ���̺� �����
CREATE TABLE book (
        book_id                         NUMBER(10),
        title                               VARCHAR2(100)        NOT NULL,
        pubs                             VARCHAR2(100),
        pub_date                       DATE,
        author_id                       NUMBER(10),
        PRIMARY KEY(book_id),
        CONSTRAINT c_book_fk        FOREIGN KEY (author_id)
        REFERENCES author(author_id)
);

-- ������ ���
INSERT INTO author
VALUES (1, '�ڰ渮', '���� �۰� ' );

-- ����� ���
INSERT INTO author( author_id, author_name )
VALUES (2, '�̹���' );


-- ������ �����ϴ� ���ڵ带 ����
UPDATE author           
SET author_name = '���84', author_desc = '�����۰�' 
WHERE author_id = 1 ;

-- WHERE ���� �����Ǹ� ��� ���ڵ忡 ����(����)
UPDATE author
SET author_name = '��Ǯ', 
author_desc = '�α��۰�' ;

-- ������ �����ϴ� ���ڵ带 ����
DELETE FROM author
WHERE author_id = 1 ;

-- ������ ������ ��� ������ ����(����)
DELETE FROM author ;


-- SEQUENCE(������)

-- ������ ����
CREATE SEQUENCE seq_author_id               -- �ڵ� ID �Ҵ� (������)
INCREMENT BY 1                                       -- ������ ��ŭ
START WITH 1 ;                                         -- ���� ��ȣ

-- ������ ���
INSERT INTO author
VALUES (seq_author_id.nextval, '�ڰ渮', '���� �۰� ' );

INSERT INTO author 
VALUES (seq_author_id.nextval, '�̹���', '�ﱹ�� �۰�');

-- ��������ü ����Ʈ ��ȸ
SELECT * FROM USER_SEQUENCES;

-- ���� ������ ��ȸ
SELECT seq_author_id.currval FROM dual;

-- ���� ������ ��ȸ
SELECT seq_author_id.nextval FROM dual;

-- ������ ����
DROP SEQUENCE seq_author_id;
DROP SEQUENCE seq_book_id;

CREATE TABLE board (
        board_id     number(5),                         -- å ��ȣ (ID)      number : int�� ���� ���� �ڷ���
        title            varchar2(50),                      -- å ����            varchar2 : char�� ���� ���� �ڷ���
        story          varchar2(50),                      -- ����
        pub_date     date                                  -- ��¥ + �ð�
);

ALTER TABLE board MODIFY (story varchar2(50)); 

-- SYSDATE : ����ð��� �Է��� ��
INSERT INTO board
VALUES (1, '�Խ�������', '��������', SYSDATE );


-- Q. �ǽ�
DROP TABLE book;
DROP TABLE author;

CREATE TABLE book (
    book_id         number(5),
    title               varchar2(50),
    pubs             varchar2(50),
    pub_date       date,
    author_id        number(5),
    PRIMARY KEY(book_id),
   CONSTRAINT c_book_fk FOREIGN KEY (author_id)
   REFERENCES author(author_id)
);

CREATE TABLE book (
book_id NUMBER(10),
title VARCHAR2(100) NOT NULL,
pubs VARCHAR2(100),
pub_date DATE,
author_id NUMBER(10),
PRIMARY KEY(book_id),

CONSTRAINT c_book_fk FOREIGN KEY (author_id)
REFERENCES author(author_id)
);

ALTER TABLE book MODIFY (pubs varchar2(50)); 

select * from author;

CREATE TABLE author (
    author_id       number(5),
    author_name  varchar2(50),
    author_desc   varchar2(50),
    PRIMARY KEY(author_id)
);

CREATE SEQUENCE seq_book_id               -- �ڵ� ID �Ҵ� (������)
INCREMENT BY 1                                       -- ������ ��ŭ
START WITH 1;                                         -- ���� ��ȣ

-- ������ ����
DROP SEQUENCE seq_book_id;

DELETE FROM book;

INSERT INTO book
VALUES (seq_book_id.nextval, '�츮���� �ϱ׷��� ����', '�ٸ�', '1998-02-22', 1);
INSERT INTO book
VALUES (seq_book_id.nextval, '�ﱹ��', '������', '2002-03-01',  1);
INSERT INTO book
VALUES (seq_book_id.nextval, '����', '���δϿ��Ͻ�', '2012-08-15', 2);
INSERT INTO book
VALUES (seq_book_id.nextval, '���ù��� �۾��� Ư��', '�����Ǳ�', '2015-04-01', 3);
INSERT INTO book
VALUES (seq_book_id.nextval, '�мǿ�', '�߾ӺϽ�(books)', '2012-02-22', 4);
INSERT INTO book
VALUES (seq_book_id.nextval, '������ȭ', '�������', '2011-08-03', 5);
INSERT INTO book
VALUES (seq_book_id.nextval, '�����λ��', '���е���', '2017-05-04', 6);
INSERT INTO book
VALUES (seq_book_id.nextval, '26��', '�������', '2012-02-04', 5);

CREATE SEQUENCE seq_author_id               -- �ڵ� ID �Ҵ� (������)
INCREMENT BY 1                                       -- ������ ��ŭ
START WITH 1;                                         -- ���� ��ȣ

DROP SEQUENCE seq_author_id;

INSERT INTO author
VALUES (seq_author_id.nextval, '�̹���', '��� ����');
INSERT INTO author
VALUES (seq_author_id.nextval, '�ڰ渮', '��󳲵� �뿵');
INSERT INTO author
VALUES (seq_author_id.nextval, '���ù�', '17�� ��ȸ�ǿ�');
INSERT INTO author
VALUES (seq_author_id.nextval, '���84', '��ȵ����� �� 84���');
INSERT INTO author
VALUES (seq_author_id.nextval, '��Ǯ', '�¶��� ��ȭ�� 1����');
INSERT INTO author
VALUES (seq_author_id.nextval, '�迵��', '�˾�����');


select  b.book_id, b.title, b.pubs, to_char( b.pub_date,'yyyy-mm-dd'), b.author_id, a.author_name, a.author_desc
    from author a, book b 
where a.author_id = b.author_id;

select *
from book;

select b.book_id, b.title, b.pubs, b.pub_date, a.author_id, a.author_name, a.author_desc
from book b, author a
where b.author_id = a.author_id;

select seq_book_id.currval from dual;

select *
from address;

select *
from address
where �ñ��� = '�ؿ�뱸';


-- ================== ������Ʈ ���� �ڵ� ====================
CREATE TABLE clientitem (
    c_id            NUMBER(20),
    c_name       VARCHAR2(100)      NOT NULL,
    c_address    VARCHAR2(200),
    c_email        VARCHAR2(100),
    PRIMARY KEY(c_id)
);

DROP TABLE clientitem;

DROP SEQUENCE seq_clientitem_c_id ;

CREATE SEQUENCE seq_clientitem_c_id
INCREMENT BY 1 
START WITH 1 ;

--DELETE FROM author
--WHERE author_id = 7 ;
--DELETE FROM author
--WHERE author_id = 8 ;
--DELETE FROM author
--WHERE author_id = 9 ;

INSERT INTO clientitem
VALUES (seq_clientitem_c_id.nextval, '������', '����Ư���� ������', 'yuna@naver.com');
INSERT INTO clientitem
VALUES (seq_clientitem_c_id.nextval, '���翵', '����Ư���� ������', 'jaeyeong@naver.com');
INSERT INTO clientitem
VALUES (seq_clientitem_c_id.nextval, '���ֿ�', '��õ������', 'juyeon@naver.com');


CREATE TABLE productitem (
    p_id        NUMBER(20),
    p_name   VARCHAR2(200),
    p_price    NUMBER(20),
    p_inventoryAmount   NUMBER(10)
);

ALTER TABLE productitem MODIFY (p_inventoryAmount NUMBER(10)); 

CREATE SEQUENCE seq_productitem_p_id
INCREMENT BY 1 
START WITH 1 ;

DROP SEQUENCE seq_productitem_p_id ;

DELETE FROM clientitem;
DELETE FROM productitem;


INSERT INTO productitem
VALUES (seq_productitem_p_id.nextval, 'ġ��', '2000', 10);
INSERT INTO productitem
VALUES (seq_productitem_p_id.nextval, 'ĩ��', '1000', 10);


-- Oracle ������ Qt���� �ѱ۷� ����ϴ� ���
SELECT 
   (SELECT VALUE FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER='NLS_LANGUAGE')
    || '_' ||
    (SELECT VALUE FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER='NLS_TERRITORY')
    || '.' ||
    (SELECT VALUE FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER='NLS_CHARACTERSET')
FROM DUAL;



