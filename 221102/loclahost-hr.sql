-- 22.11.02

SELECT e.EMPLOYEE_ID, e.FIRST_NAME,
            d.DEPARTMENT_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID;



select *
from employees
where EMPLOYEE_ID = 178;     --  department_id가 null인 경우



SELECT e.EMPLOYEE_ID, e.FIRST_NAME, d.DEPARTMENT_NAME, l.CITY
FROM EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.LOCATION_ID = l.LOCATION_ID;


select e.employee_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select /*                                    + use_merge (e,d) */
        e.employee_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

