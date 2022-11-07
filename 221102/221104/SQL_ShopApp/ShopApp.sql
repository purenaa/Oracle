-- 고객 테이블 생성
CREATE TABLE CLIENT (
    client_ID                       NUMBER(20),
    client_Name                  VARCHAR2(100)      NOT NULL,
    PhoneNumber                VARCHAR2(100),
    Address                       VARCHAR2(300),
    Email                           VARCHAR2(100),
    PRIMARY KEY(client_Name)
);

DELETE from CLIENT;

DROP TABLE CLIENT;

-- 고객 ID 자동 할당 전체 삭제
DROP SEQUENCE seq_clientitem_c_id ;

-- 고객 ID 1번부터 순차적으로 자동 할당 
CREATE SEQUENCE seq_clientitem_c_id
INCREMENT BY 1 
START WITH 1 ;

-----------------------------------------------------------------

-- 제품 테이블 생성
CREATE TABLE PRODUCT (
    product_ID                        NUMBER(20),
    product_Name                    VARCHAR2(200)      NOT NULL,
    Price                                NUMBER(20),
    InventoryAmount                 NUMBER(30),
    PRIMARY KEY(product_Name)
);

DROP TABLE PRODUCT;

------------------------------------------------------------------

-- 주문 테이블 생성
CREATE TABLE SHOP (
    purchaseDay                     Date,
    order_ID                            NUMBER(20),
    client_Name                       VARCHAR2(200)      NOT NULL,
    product_Name                    VARCHAR2(300),
    PurchaseQuantity                NUMBER(20),
    total_Price                          NUMBER(30),
    PRIMARY KEY(order_ID),
    
    CONSTRAINT c_shop_fk1 FOREIGN KEY (client_Name)
    REFERENCES client(client_Name),
    CONSTRAINT c_shop_fk2 FOREIGN KEY (product_Name)
    REFERENCES product(product_Name)
);

DROP TABLE SHOP;


------------------------------------------------------------------

-- 고객 삽입 프로시저 _INSERT_CLIENT
CREATE OR REPLACE PROCEDURE INSERT_CLIENT (
    c_client_ID IN CLIENT.client_ID%type,
    c_client_Name IN CLIENT.client_Name%type,
    c_PhoneNumber IN CLIENT.PhoneNumber%type,
    c_Address IN CLIENT.Address%type,
    c_Email IN CLIENT.Email%type )
IS
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    INSERT INTO CLIENT
    (client_ID, client_Name, PhoneNumber, Address, Email)
    
    VALUES
    (c_client_ID, c_client_Name, c_PhoneNumber, c_Address, c_Email);

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE( 'client_ID : ' || c_client_ID );
    DBMS_OUTPUT.PUT_LINE( 'client_Name : ' || c_client_Name );
    DBMS_OUTPUT.PUT_LINE( 'PhoneNumber : ' || c_PhoneNumber );
    DBMS_OUTPUT.PUT_LINE( 'Address : ' || c_Address );
    DBMS_OUTPUT.PUT_LINE( 'Email : ' || c_Email );
    DBMS_OUTPUT.PUT_LINE( 'CLIENT DATA INSERT SUCCESS!' );
    
END;    
/

-- 고객 업데이트 프로시저 _UPDATE_CLIENT
CREATE OR REPLACE PROCEDURE UPDATE_CLIENT (
    c_client_ID IN CLIENT.client_ID%type,                        -- 고객 이름, 고객 전화번호, 주소, 이메일을 수정할 고객 ID
    c_client_Name IN CLIENT.client_Name%type,               -- 수정할 고객 이름 
    c_PhoneNumber IN CLIENT.PhoneNumber%type,          -- 수정할 고객 전화 번호
    c_Address IN CLIENT.Address%type,                         -- 수정할 고객 주소
    c_Email IN CLIENT.Email%type )                                -- 수정할 고객 이메일
IS
    c_updqte CLIENT%ROWTYPE;                                   -- 수정한 데이터를 확인하기 위한 변수 선언
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    UPDATE CLIENT
    SET client_Name = c_client_Name
    WHERE client_ID =  c_client_ID;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE( 'CLIENT DATA UPDATE SUCCESS!' );
    
    -- 수정된 데이터를 확인하기 위해 검색
    SELECT client_ID, client_Name, PhoneNumber,Address, Email
    INTO c_updqte.client_ID, c_updqte.client_Name, c_updqte.PhoneNumber, c_updqte.Address, c_updqte.Email
    FROM CLIENT
    WHERE client_ID = c_client_ID;
    DBMS_OUTPUT.PUT_LINE(' **** Confirm Update Data ****'); 
    DBMS_OUTPUT.PUT_LINE( 'client_ID : ' || c_client_ID );
    DBMS_OUTPUT.PUT_LINE( 'client_Name : ' || c_client_Name );
    DBMS_OUTPUT.PUT_LINE( 'PhoneNumber : ' || c_PhoneNumber );
    DBMS_OUTPUT.PUT_LINE( 'Address : ' || c_Address );
    DBMS_OUTPUT.PUT_LINE( 'Email : ' || c_Email );
    
END;  
/





------------------------------------------------------------------

-- 제품 삽입 프로시저 _INSERT_PRODUCT
CREATE OR REPLACE PROCEDURE INSERT_PRODUCT (
    p_product_ID IN PRODUCT.product_ID%type,
    p_product_Name IN PRODUCT.product_Name%type,
    p_Price IN PRODUCT.Price%type,
    p_InventoryAmount IN PRODUCT.InventoryAmount%type )
IS
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    INSERT INTO PRODUCT
    (product_ID, product_Name, Price, InventoryAmount)
    
    VALUES
    (p_product_ID, p_product_Name, p_Price, p_InventoryAmount);

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE( 'product_ID : ' || p_product_ID );
    DBMS_OUTPUT.PUT_LINE( 'product_Name : ' || p_product_Name );
    DBMS_OUTPUT.PUT_LINE( 'Price : ' || p_Price );
    DBMS_OUTPUT.PUT_LINE( 'InventoryAmount : ' || p_InventoryAmount );
    DBMS_OUTPUT.PUT_LINE( 'PRODUCT DATA INSERT SUCCESS!' );
    
END; 
/

------------------------------------------------------------------

-- 주문 삽입 프로시저 _INSERT_CLIENT
CREATE OR REPLACE PROCEDURE INSERT_CLIENT (
    c_client_ID IN CLIENT.client_ID%type,
    c_client_Name IN CLIENT.client_Name%type,
    c_PhoneNumber IN CLIENT.PhoneNumber%type,
    c_Address IN CLIENT.Address%type,
    c_Email IN CLIENT.Email%type )
IS
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    INSERT INTO CLIENT
    (client_ID, client_Name, PhoneNumber, Address, Email)
    
    VALUES
    (c_client_ID, c_client_Name, c_PhoneNumber, c_Address, c_Email);

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE( 'client_ID : ' || c_client_ID );
    DBMS_OUTPUT.PUT_LINE( 'client_Name : ' || c_client_Name );
    DBMS_OUTPUT.PUT_LINE( 'PhoneNumber : ' || c_PhoneNumber );
    DBMS_OUTPUT.PUT_LINE( 'Address : ' || c_Address );
    DBMS_OUTPUT.PUT_LINE( 'Email : ' || c_Email );
    DBMS_OUTPUT.PUT_LINE( 'CLIENT DATA INSERT SUCCESS!' );
    
END;    
/

------------------------------------------------------------------

-- 주문 프로시저 INSERT_SHOP
CREATE OR REPLACE procedure INSERT_SHOP (
    o_purchaseDay IN SHOP.purchaseDay%type,
    o_order_ID IN SHOP.order_ID%type,
    o_client_Name IN SHOP.client_Name%type,
    o_product_Name IN SHOP.product_Name%type,
    o_PurchaseQuantity IN SHOP.PurchaseQuantity%type,
    o_total_Price IN SHOP.total_Price%type )
IS
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    INSERT INTO SHOP
    (purchaseDay, order_ID, client_Name, product_Name, PurchaseQuantity, total_Price)
    
    VALUES
    (o_purchaseDay, o_order_ID, o_client_Name, o_product_Name, o_PurchaseQuantity, o_total_Price);

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE( 'purchaseDay : ' || o_purchaseDay );
    DBMS_OUTPUT.PUT_LINE( 'order_ID : ' || o_order_ID );
    DBMS_OUTPUT.PUT_LINE( 'client_Name : ' || o_client_Name );
    DBMS_OUTPUT.PUT_LINE( 'product_Name : ' || o_product_Name );
    DBMS_OUTPUT.PUT_LINE( 'PurchaseQuantity : ' || o_PurchaseQuantity );
    DBMS_OUTPUT.PUT_LINE( 'total_Price : ' || o_total_Price );
    DBMS_OUTPUT.PUT_LINE( 'SHOP DATA INSERT SUCCESS!' );
    
END; 
/