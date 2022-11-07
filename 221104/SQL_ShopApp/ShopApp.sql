-- �� ���̺� ����
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

-- �� ID �ڵ� �Ҵ� ��ü ����
DROP SEQUENCE seq_clientitem_c_id ;

-- �� ID 1������ ���������� �ڵ� �Ҵ� 
CREATE SEQUENCE seq_clientitem_c_id
INCREMENT BY 1 
START WITH 1 ;

-----------------------------------------------------------------

-- ��ǰ ���̺� ����
CREATE TABLE PRODUCT (
    product_ID                        NUMBER(20),
    product_Name                    VARCHAR2(200)      NOT NULL,
    Price                                NUMBER(20),
    InventoryAmount                 NUMBER(30),
    PRIMARY KEY(product_Name)
);

DROP TABLE PRODUCT;

------------------------------------------------------------------

-- �ֹ� ���̺� ����
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

-- �� ���� ���ν��� _INSERT_CLIENT
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

-- �� ������Ʈ ���ν��� _UPDATE_CLIENT
CREATE OR REPLACE PROCEDURE UPDATE_CLIENT (
    c_client_ID IN CLIENT.client_ID%type,                        -- �� �̸�, �� ��ȭ��ȣ, �ּ�, �̸����� ������ �� ID
    c_client_Name IN CLIENT.client_Name%type,               -- ������ �� �̸� 
    c_PhoneNumber IN CLIENT.PhoneNumber%type,          -- ������ �� ��ȭ ��ȣ
    c_Address IN CLIENT.Address%type,                         -- ������ �� �ּ�
    c_Email IN CLIENT.Email%type )                                -- ������ �� �̸���
IS
    c_updqte CLIENT%ROWTYPE;                                   -- ������ �����͸� Ȯ���ϱ� ���� ���� ����
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    UPDATE CLIENT
    SET client_Name = c_client_Name
    WHERE client_ID =  c_client_ID;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE( 'CLIENT DATA UPDATE SUCCESS!' );
    
    -- ������ �����͸� Ȯ���ϱ� ���� �˻�
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

-- ��ǰ ���� ���ν��� _INSERT_PRODUCT
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

-- �ֹ� ���� ���ν��� _INSERT_CLIENT
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

-- �ֹ� ���ν��� INSERT_SHOP
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