< Orcle >

declare : 변수 선언


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

--프로시저 예제
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

--프로시저 예제
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
	-- 테이블의 선언
	TYPE empno_table IS TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
	TYPE ename_table IS TABLE OF employees.first_name%TYPE INDEX BY BINARY_INTEGER;
	TYPE sal_table      IS TABLE OF employees.salary%TYPE INDEX BY BINARY_INTEGER;

	-- 테이블타입으로 변수 선언
	empno_tab empno_table ; 
	ename_tab ename_table ; 
	sal_tab   sal_table;
	i BINARY_INTEGER := 0;
BEGIN   
	DBMS_OUTPUT.ENABLE;

	-- FOR 루프 사용
                 -- 여기서 emp_list는 ( BINARY_INTEGER형 변수로) 1씩 증가
	FOR emp_list IN ( SELECT employee_id, first_name, salary
		        FROM employees 
		      WHERE department_id = v_deptno ) LOOP
	      i := i + 1;
	      -- 테이블 변수에 검색된 결과를 넣는다
		empno_tab(i) := emp_list.employee_id ;
		ename_tab(i) := emp_list.first_name ;
		sal_tab(i) := emp_list.salary ;
	END LOOP;
	
	-- 1부터 i까지 FOR 문을 실행
	FOR cnt IN 1..i LOOP
		-- TABLE변수에 넣은 값을 뿌려줌
		DBMS_OUTPUT.PUT_LINE( '사원번호 : ' || empno_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '사원이름 : ' || ename_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '사원급여 : ' || sal_tab(cnt));
	END LOOP; 
END TABLE_TEST;
/
EXECUTE HR.TABLE_TEST (100);
---------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Record_Test
(p_empno IN employees.employee_id%TYPE)
IS
	-- 하나의 레코드의 세가지의 변수타입 선언
	TYPE emp_record IS RECORD
    (v_empno    NUMBER,                     /*사원 번호*/
     v_ename     VARCHAR2(30),           /*사원 이름*/
     v_hiredate    DATE);                       /*입사일*/
     
     emp_rec emp_record;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    --레코드의 사용
    SELECT employee_id, first_name, hire_date
    INTO emp_rec.v_empno, emp_rec.v_ename, emp_rec.v_hiredate
    FROM employees
    WHERE employee_id = p_empno;
    
    DBMS_OUTPUT.PUT_LINE('EMP NO : ' || emp_rec.v_empno) ;               /*사원 번호*/
    DBMS_OUTPUT.PUT_LINE('EMP NAME : ' || emp_rec.v_ename);             /*사원 이름*/
    DBMS_OUTPUT.PUT_LINE('EMP HIREDATE : ' || emp_rec.v_hiredate);      /*입사일*/
END;
/
EXECUTE Record_Test(100);
---------------------------------------------------------------------

--Table of Record
CREATE OR REPLACE PROCEDURE TABLE_OF_RECORD
IS
    i BINARY_INTEGER := 0;
    -- PL/SQL Table of Record의 선언
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
(v_empno IN employees.employee_id%TYPE,              /*급여를 수정한 사원의 사번*/
 v_sal      IN employees.salary%TYPE)                       /*수정할 급여*/
 IS
    /*수정 데이터를 확인하기 위한 변수 선언*/
    v_emp employees%ROWTYPE;

BEGIN DBMS_OUTPUT.ENABLE;
    
    /*급여 수정*/
    UPDATE employees
    SET salary = v_sal
    WHERE employee_id = v_empno;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Data Update Success ');
    
    /*수정된 데이터 확인하기 위해 검색*/
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
