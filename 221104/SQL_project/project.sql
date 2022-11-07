create table book (                                     -- 테이블 생성
        book_id     number(5),                         -- 책 번호 (ID)      number : int와 같은 정수 자료형
        title           varchar2(50),                      -- 책 제목            varchar2 : char와 같은 문자 자료형
        author       varchar2(10),                      -- 저자
        pub_date    date                                  -- 날짜 + 시간
);

ALTER TABLE book ADD (pubs VARCHAR2(50));           -- 컬럼 추가

ALTER TABLE book MODIFY (title VARCHAR2(100));       -- 컬럼 수정

ALTER TABLE book DROP (author);                              -- 컬럼 삭제

ALTER TABLE book ADD (author VARCHAR2(10));


RENAME book TO article;                 -- 테이블명 수정

DROP TABLE article;                       -- 테이블 삭제

DROP TABLE BOOK;

-- author 테이블 만들기
CREATE TABLE author (
        author_id           NUMBER(10),
        author_name      VARCHAR2(100) NOT NULL,
        author_desc       VARCHAR2(500),
        PRIMARY KEY(author_id)
);

-- book 테이블 만들기
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

-- 묵시적 방법
INSERT INTO author
VALUES (1, '박경리', '토지 작가 ' );

-- 명시적 방법
INSERT INTO author( author_id, author_name )
VALUES (2, '이문열' );


-- 조건을 만족하는 레코드를 변경
UPDATE author           
SET author_name = '기안84', author_desc = '웹툰작가' 
WHERE author_id = 1 ;

-- WHERE 절이 생략되면 모든 레코드에 적용(주의)
UPDATE author
SET author_name = '강풀', 
author_desc = '인기작가' ;

-- 조건을 만족하는 레코드를 삭제
DELETE FROM author
WHERE author_id = 1 ;

-- 조건이 없으면 모든 데이터 삭제(주의)
DELETE FROM author ;


-- SEQUENCE(시퀀스)

-- 시퀀스 생성
CREATE SEQUENCE seq_author_id               -- 자동 ID 할당 (시퀀스)
INCREMENT BY 1                                       -- 증가할 만큼
START WITH 1 ;                                         -- 시작 번호

-- 시퀀스 사용
INSERT INTO author
VALUES (seq_author_id.nextval, '박경리', '토지 작가 ' );

INSERT INTO author 
VALUES (seq_author_id.nextval, '이문열', '삼국지 작가');

-- 시퀀스객체 리스트 조회
SELECT * FROM USER_SEQUENCES;

-- 현재 시퀀스 조회
SELECT seq_author_id.currval FROM dual;

-- 다음 시퀀스 조회
SELECT seq_author_id.nextval FROM dual;

-- 시퀀스 삭제
DROP SEQUENCE seq_author_id;
DROP SEQUENCE seq_book_id;

CREATE TABLE board (
        board_id     number(5),                         -- 책 번호 (ID)      number : int와 같은 정수 자료형
        title            varchar2(50),                      -- 책 제목            varchar2 : char와 같은 문자 자료형
        story          varchar2(50),                      -- 저자
        pub_date     date                                  -- 날짜 + 시간
);

ALTER TABLE board MODIFY (story varchar2(50)); 

-- SYSDATE : 현재시간이 입력이 됨
INSERT INTO board
VALUES (1, '게시판제목', '본문내용', SYSDATE );


-- Q. 실습
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

CREATE SEQUENCE seq_book_id               -- 자동 ID 할당 (시퀀스)
INCREMENT BY 1                                       -- 증가할 만큼
START WITH 1;                                         -- 시작 번호

-- 시퀀스 삭제
DROP SEQUENCE seq_book_id;

DELETE FROM book;

INSERT INTO book
VALUES (seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
INSERT INTO book
VALUES (seq_book_id.nextval, '삼국지', '민음사', '2002-03-01',  1);
INSERT INTO book
VALUES (seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);
INSERT INTO book
VALUES (seq_book_id.nextval, '유시미의 글쓰기 특강', '생각의길', '2015-04-01', 3);
INSERT INTO book
VALUES (seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);
INSERT INTO book
VALUES (seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);
INSERT INTO book
VALUES (seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);
INSERT INTO book
VALUES (seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5);

CREATE SEQUENCE seq_author_id               -- 자동 ID 할당 (시퀀스)
INCREMENT BY 1                                       -- 증가할 만큼
START WITH 1;                                         -- 시작 번호

DROP SEQUENCE seq_author_id;

INSERT INTO author
VALUES (seq_author_id.nextval, '이문열', '경북 영양');
INSERT INTO author
VALUES (seq_author_id.nextval, '박경리', '경상남도 통영');
INSERT INTO author
VALUES (seq_author_id.nextval, '유시민', '17대 국회의원');
INSERT INTO author
VALUES (seq_author_id.nextval, '기안84', '기안동에서 산 84년생');
INSERT INTO author
VALUES (seq_author_id.nextval, '강풀', '온라인 만화가 1세대');
INSERT INTO author
VALUES (seq_author_id.nextval, '김영하', '알쓰신잡');


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
where 시군구 = '해운대구';


-- ================== 프로젝트 예제 코드 ====================
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
VALUES (seq_clientitem_c_id.nextval, '정유나', '서울특별시 도봉구', 'yuna@naver.com');
INSERT INTO clientitem
VALUES (seq_clientitem_c_id.nextval, '조재영', '서울특별시 강서구', 'jaeyeong@naver.com');
INSERT INTO clientitem
VALUES (seq_clientitem_c_id.nextval, '원주연', '인천광역시', 'juyeon@naver.com');


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
VALUES (seq_productitem_p_id.nextval, '치약', '2000', 10);
INSERT INTO productitem
VALUES (seq_productitem_p_id.nextval, '칫솔', '1000', 10);


-- Oracle 내용을 Qt에서 한글로 출력하는 방법
SELECT 
   (SELECT VALUE FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER='NLS_LANGUAGE')
    || '_' ||
    (SELECT VALUE FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER='NLS_TERRITORY')
    || '.' ||
    (SELECT VALUE FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER='NLS_CHARACTERSET')
FROM DUAL;



