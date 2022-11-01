< Orcle >

declare : ���� ����


---------------------------------------------------------------------
SET SERVEROUTPUT ON;

DECLARE
vno varchar2(20);
BEGIN
        SELECT TO_CHAR(sysdate, 'YYYY?MM/DD') into vno
        FROM dual;
        DBMS_OUTPUT.put_line(vno);
END;
---------------------------------------------------------------------

DECLARE
    v_empno employees.employee_id%TYPE;
    v_name employees.first_name%TYPE;
    v_sal employees.salary%TYPE;
    v_hire_date employees.hire_date%TYPE;
    BEGIN
    SELECT employee_id, first_name, salary, hire_date
    INTO v_empno, v_name, v_sal, v_hire_date
    FROM employees
    WHERE employee_id = '&empno';
    DBMS_OUTPUT.PUT_LINE(v_empno||' '||v_name||' '||v_sal||' '||v_hire_date);
    END;
---------------------------------------------------------------------

--���ν��� ����
CREATE OR REPLACE PROCEDURE UPDATE_SALARY
/* IN Argument */
( v_empno IN NUMBER )

IS

BEGIN
    UPDATE employees
    SET salary = salary * 1.1
    WHERE employee_id = v_empno;
    commit;
END UPDATE_SALARY;
---------------------------------------------------------------------

--���ν��� ����
CREATE OR REPLACE FUNCTION FC_UPDATE_SALARY
( v_empno IN NUMBER )
RETURN NUMBER

IS

v_salary employees.salary%type;

BEGIN

    UPDATE employees
    SET salary = salary * 1.1
    WHERE employee_id = v_empno;

    COMMIT;
    
    SELECT SALARY
    INTO v_salary
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = v_empno;
    
    RETURN v_salary;
        
END;
---------------------------------------------------------------------

create or replace PROCEDURE PRINT_EMP( v_input employees.EMPLOYEE_ID%TYPE )

IS
	v_row   employees%ROWTYPE;
BEGIN
	SELECT employee_id,  first_name, salary, department_id
	INTO    v_row.employee_id, v_row.first_name, v_row.salary, v_row.department_id
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID = v_input;

	dbms_output.put_line
	( v_row.employee_id||' '||v_row.first_name||' '||v_row.salary||' '||v_row.department_id);
	
END PRINT_EMP;
/
execute PRINT_EMP(114);
---------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE HR.TABLE_TEST
(v_deptno IN employees.DEPARTMENT_ID %TYPE)
IS
	-- ���̺��� ����
	TYPE empno_table IS TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
	TYPE ename_table IS TABLE OF employees.first_name%TYPE INDEX BY BINARY_INTEGER;
	TYPE sal_table      IS TABLE OF employees.salary%TYPE INDEX BY BINARY_INTEGER;

	-- ���̺�Ÿ������ ���� ����
	empno_tab empno_table ; 
	ename_tab ename_table ; 
	sal_tab   sal_table;
	i BINARY_INTEGER := 0;
BEGIN   
	DBMS_OUTPUT.ENABLE;

	-- FOR ���� ���
                 -- ���⼭ emp_list�� ( BINARY_INTEGER�� ������) 1�� ����
	FOR emp_list IN ( SELECT employee_id, first_name, salary
		        FROM employees 
		      WHERE department_id = v_deptno ) LOOP
	      i := i + 1;
	      -- ���̺� ������ �˻��� ����� �ִ´�
		empno_tab(i) := emp_list.employee_id ;
		ename_tab(i) := emp_list.first_name ;
		sal_tab(i) := emp_list.salary ;
	END LOOP;
	
	-- 1���� i���� FOR ���� ����
	FOR cnt IN 1..i LOOP
		-- TABLE������ ���� ���� �ѷ���
		DBMS_OUTPUT.PUT_LINE( '�����ȣ : ' || empno_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '����̸� : ' || ename_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '����޿� : ' || sal_tab(cnt));
	END LOOP; 
END TABLE_TEST;
/
EXECUTE HR.TABLE_TEST (100);
---------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Record_Test
(p_empno IN employees.employee_id%TYPE)
IS
	-- �ϳ��� ���ڵ��� �������� ����Ÿ�� ����
	TYPE emp_record IS RECORD
    (v_empno    NUMBER,                     /*��� ��ȣ*/
     v_ename     VARCHAR2(30),           /*��� �̸�*/
     v_hiredate    DATE);                       /*�Ի���*/
     
     emp_rec emp_record;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    --���ڵ��� ���
    SELECT employee_id, first_name, hire_date
    INTO emp_rec.v_empno, emp_rec.v_ename, emp_rec.v_hiredate
    FROM employees
    WHERE employee_id = p_empno;
    
    DBMS_OUTPUT.PUT_LINE('EMP NO : ' || emp_rec.v_empno) ;               /*��� ��ȣ*/
    DBMS_OUTPUT.PUT_LINE('EMP NAME : ' || emp_rec.v_ename);             /*��� �̸�*/
    DBMS_OUTPUT.PUT_LINE('EMP HIREDATE : ' || emp_rec.v_hiredate);      /*�Ի���*/
END;
/
EXECUTE Record_Test(100);
---------------------------------------------------------------------

--Table of Record
CREATE OR REPLACE PROCEDURE TABLE_OF_RECORD
IS
    i BINARY_INTEGER := 0;
    -- PL/SQL Table of Record�� ����
    TYPE dept_table_type IS TABLE OF departments%ROWTYPE INDEX BY BINARY_INTEGER;
    dept_table dept_table_type;
BEGIN
    FOR dept_list IN (SELECT * FROM departments) LOOP
    i := i + 1;
    

    dept_table(i).department_id := dept_list.department_id;
    dept_table(i).department_name := dept_list.department_name;
    dept_table(i).location_id := dept_list.location_id;
    
    END LOOP;
    FOR cnt IN 1..i LOOP
        DBMS_OUTPUT.PUT_LINE(' DEPT NO : '||dept_table(cnt).department_id ||
                            ' DEPT NAME : '||dept_table(cnt).department_name ||
                            ' DEPT LOC : '||dept_table(cnt).location_id );
    END LOOP;
END;
---------------------------------------------------------------------

--UPDATE
CREATE OR REPLACE PROCEDURE UPDATE_TEST
(v_empno IN employees.employee_id%TYPE,              /*�޿��� ������ ����� ���*/
 v_sal      IN employees.salary%TYPE)                       /*������ �޿�*/
 IS
    /*���� �����͸� Ȯ���ϱ� ���� ���� ����*/
    v_emp employees%ROWTYPE;

BEGIN DBMS_OUTPUT.ENABLE;
    
    /*�޿� ����*/
    UPDATE employees
    SET salary = v_sal
    WHERE employee_id = v_empno;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Data Update Success ');
    
    /*������ ������ Ȯ���ϱ� ���� �˻�*/
    SELECT employee_id, last_name, salary
    INTO v_emp.employee_id, v_emp.last_name, v_emp.salary
    FROM employees
    WHERE employee_id = v_empno;
    DBMS_OUTPUT.PUT_LINE('**** Confirm Update Data ****');
    DBMS_OUTPUT.PUT_LINE('EMP NO : ' || v_emp.employee_id);
    DBMS_OUTPUT.PUT_LINE('EMP NAME : ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('EMP SALARY : ' || v_emp.salary);
END;
/
EXECUTE UPDATE_TEST(100, 5000);
