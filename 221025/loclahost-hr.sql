--22.10.24
SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS d;

SELECT * from employees;
select * from departments;

SELECT e.FIRST_NAME,
       e.PHONE_NUMBER,
       e.HIRE_DATE,
       e.SALARY
       
FROM EMPLOYEES e;

--����� �̸�(fisrt_name)�� ��ȭ��ȣ, �Ի���, ����(�޿�)�� ����ϼ���.
SELECT e.FIRST_NAME "�̸�",
       e.LAST_NAME "��",
       e.SALARY "�޿�",
       e.PHONE_NUMBER "��ȭ��ȣ",
       e.EMAIL "�̸���",
       e.HIRE_DATE "�Ի���"
FROM EMPLOYEES e;


--���� ������(Concatenation)�� �÷��� ���̱�, �� ��(��������ǥ)�� ����Ͽ� ���ڿ��� �߰��Ͽ� ����� �� �ִ�
select first_name ||'�� �Ի����� '|| last_name "�̸�"
from employees;


--��� ������ ����ϱ� (���ڿ��� ����� �� ���� / �̸�(����) * 12(����)�� �Ұ���)
select first_name, salary, salary*12, (salary+300)*12
from employees;


--��ü������ ������ ������ ���� ����ϼ���. (����, �޿�, ����, ����2, ��ȭ��ȣ)
SELECT e.FIRST_NAME ||' '||e.LAST_NAME "����",
       e.SALARY "�޿�",
       e.SALARY *12 "����",
       (e.SALARY *12) +5000 "����2",
       e.PHONE_NUMBER "��ȭ��ȣ"
FROM EMPLOYEES e;


-- < WHERE �� > ,,��ȸ�ϱ�   ////////////////////////////////////////////////////


--�񱳿�����(�μ���ȣ�� 10�� ����� �̸��� ���Ͻÿ�)
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10;


--�޿���15000 �̻��� ������� �̸��� �޿��� ������ ����ϼ���.
SELECT e.FIRST_NAME,
       e.SALARY,
       e.SALARY *12
FROM EMPLOYEES e
WHERE e.SALARY >= 15000;


--07/01/01 �� ���Ŀ� �Ի��� ������� �̸��� �Ի����� ����ϼ���.
SELECT e.FIRST_NAME||' '||e.LAST_NAME "�̸�",
       e. HIRE_DATE "�Ի���"
FROM EMPLOYEES e
WHERE e.HIRE_DATE >= '07/01/01';

SELECT TO_CHAR(e.HIRE_DATE, 'yy/mm/dd')
FROM EMPLOYEES e;


--���̸��� Lex�� ������ ������ ����ϼ���
SELECT e.SALARY *12
FROM EMPLOYEES e
WHERE e.FIRST_NAME = 'Lex';


--������ 2���̻� �϶� �Ѳ����� ��ȸ�ϱ�
--������ 14000 �����̰ų� 17000 �̻��� ����� �̸��� ������ ����ϼ���
SELECT e.FIRST_NAME, e.SALARY
FROM EMPLOYEES e
WHERE e.SALARY >= 14000 
and e.SALARY <= 17000;


--�Ի����� 04/01/01 ���� 05/12/31 ���̿� �Ի��� ����� �̸��� �Ի����� ����ϼ���
SELECT e.FIRST_NAME||' '||e.LAST_NAME "�̸�",
       e. HIRE_DATE "�Ի���"
FROM EMPLOYEES e
WHERE e.HIRE_DATE >= '04/01/01'
and e. HIRE_DATE <= '05/12/31';


--BETWEEN �����ڷ� Ư������ �� ����ϱ�
--������ 14000 �̻� 17000������ ����� �̸��� ������ ���Ͻÿ�
SELECT e.FIRST_NAME||' '||e.LAST_NAME "�̸�", 
       e.SALARY *12 "����"
FROM EMPLOYEES e
WHERE e.SALARY between 14000 and 17000;


--�μ���ȣ�� ������������ �����ϰ� �μ���ȣ, �޿�, �̸��� ����ϼ���. 
SELECT e.DEPARTMENT_ID "�μ���ȣ",  
       e.SALARY "�޿�",
       e.FIRST_NAME||' '||e.LAST_NAME "�̸�"
FROM EMPLOYEES e
ORDER BY e.DEPARTMENT_ID asc,  e.SALARY desc, e.FIRST_NAME||' '||e.LAST_NAME;


--�μ���ȣ�� ������������ �����ϰ� �μ���ȣ�� ������ �޿��� ���� ������� �μ���ȣ, �޿�, �̸��� ����ϼ���
SELECT e.DEPARTMENT_ID "�μ���ȣ",
       e.SALARY "�޿�",
       e.FIRST_NAME||' '||e.LAST_NAME "�̸�"
FROM EMPLOYEES e
WHERE SALARY >= 5000
ORDER BY e.DEPARTMENT_ID asc, e.SALARY desc;


--�����Լ� ? INITCAP(�÷���) : ������ ù ���ڸ� �빮�ڷ� ����ϰ� �������� ���� �ҹ��ڷ� ����ϴ� �Լ�
SELECT email, INITCAP(email), DEPARTMENT_ID
FROM EMPLOYEES e
WHERE DEPARTMENT_ID = 100;


--�����Լ� ? LOWER(�÷���) / UPPER(�÷���) : �ԷµǴ� ���� ���� �ҹ���/�빮�ڷ� �����ϴ� �Լ�
SELECT FIRST_NAME, lower(FIRST_NAME), upper(FIRST_NAME)
FROM EMPLOYEES e
where DEPARTMENT_ID = 100;


--1��
--��ü ������ ���� ������ ��ȸ�ϼ���.
--������ �Ի���(HIRE_DATE)�� ��������(ASC)���� ���� ���Ӻ��� ��� �ǵ��� �ϼ���.
--�̸�(FIRST_NAME || LAST_NAME), ����(SALARY), ��ȭ��ȣ(PHONE_NUMBER), �Ի���(HIRE_DATE) ���̰�
--"�̸�", "����", "��ȭ��ȣ", "�Ի���"�� �÷� �̸��� ��ü(COLUMN ALIAS)�� ������.
SELECT e.FIRST_NAME ||' '|| e.LAST_NAME "�̸�",
       e.SALARY "����",
       e.PHONE_NUMBER "��ȭ��ȣ",
       e.HIRE_DATE "�Ի���"
FROM EMPLOYEES e
ORDER BY  e.HIRE_DATE ASC;


--5��
--������ 14000�̸� 10000 �̻��� ������ �̸�(FIRST_NAME), ����, Ŀ�̼��ۼ�Ʈ�� ���޼�(�������� DESC)���� ����ϼ���.
--��, Ŀ�̼� �ۼ�Ʈ�� NULL�̸� 0���� ��Ÿ���ÿ�.
SELECT e.FIRST_NAME "�̸�",
       e.SALARY "����",
       nvl(e.COMMISSION_PCT, 0) "Ŀ�̼��ۼ�Ʈ"
FROM EMPLOYEES e 
WHERE e.SALARY < 14000
AND   e.SALARY >= 10000
ORDER BY e.SALARY desc;


--6��
--�μ���ȣ�� 10, 90, 100�� ������ �̸�, ����, �Ի���, �μ���ȣ�� ��Ÿ���ÿ�.
--�Ի����� 1977-12�� ���� ǥ���Ͻÿ�.
SELECT e.FIRST_NAME ||' '|| e.LAST_NAME "�̸�",
       e.SALARY "����",
       TO_CHAR(e.HIRE_DATE, 'YYYY-MM') "�Ի���",
       e.DEPARTMENT_ID "�μ���ȣ"
FROM EMPLOYEES e
WHERE e.DEPARTMENT_ID in(10, 90, 100);


--7��
--�̸�(first_name)�� S �Ǵ� s�� ���� ������ �̸�, ������ ��Ÿ���ÿ�.
SELECT e.FIRST_NAME , e.SALARY 
FROM EMPLOYEES e 
WHERE UPPER(e.FIRST_NAME) LIKE '%S%';


--8��
--��ü �μ��� ����Ϸ��� �մϴ�. ������ �μ��̸��� �� ������� ����� ������.
SELECT *
FROM DEPARTMENTS d
ORDER BY LENGTH(d.DEPARTMENT_NAME) DESC;


--9��
--��Ȯ���� ������, ���簡 ���� ������ ����Ǵ� ������� �����̸��� �빮�ڷ� ����ϰ� ��������(ASC)���� �����غ�����.
SELECT *
FROM DEPARTMENTS d;

SELECT DISTINCT l.COUNTRY_ID 
FROM LOCATIONS l 
WHERE l.LOCATION_ID IN (1800,
2400,
1400,
2500,
1700,
2700,
1500);

SELECT UPPER(c.COUNTRY_NAME)  
FROM COUNTRIES c 
WHERE c.COUNTRY_ID IN ('US',
'CA',
'DE',
'UK')
ORDER BY 1;

--�˻��ϴ� ���
--SELECT  *
--ROM LOCATIONS l
--ORDER BY l.LOCATION_ID DESC;


--10��
--�Ի����� 2003/12/31�� ���� �Ի��� ������ �̸�, ����, ��ȭ ��ȣ, �Ի����� ����ϼ���.
--��ȭ��ȣ�� 545-343-3433 �� ���� ���·� ����Ͻÿ�.
SELECT e.FIRST_NAME ||' '|| e.LAST_NAME "�̸�", 
       e.SALARY "����", 
       REPLACE(PHONE_NUMBER, '.', '-') "��ȭ ��ȣ", 
       e.HIRE_DATE "�Ի���"
FROM EMPLOYEES e
WHERE e.HIRE_DATE <= '2003/12/31';

WHERE e.HIRE_


--------------------------------------------------------------------------------
--22.10.25
SELECT e.DEPARTMENT_ID, avg(e.SALARY)
FROM employees e
GROUP BY e.DEPARTMENT_ID;
order by DEPARTMENT_ID DESC;


select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000;


select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000
AND department_id > 100;


--1��
--���� �߿� �ְ��ӱ�(SALARY)�� �����ӱ��� "�ְ��ӱ�", "�����ӱ�" ������Ʈ Ÿ��Ʋ�� �Բ� ����� ������.
--�� �ӱ��� ���̴� ���ΰ���?
--"�ְ��ӱ� - �����ӱ�"�̶� Ÿ��Ʋ�� ����غ�����.
SELECT max(e.SALARY) "�ְ��ӱ�",
       min(e.SALARY) "�����ӱ�",
       max(e.SALARY) - min(e.SALARY) "�ְ��ӱ� - �����ӱ�"
FROM EMPLOYEES e;


--2��
--���������� ���Ի���� ���� ���� ���� �Դϱ�? ���� �������� ������ּ���.
-- ��) 2014�� 07�� 10��
SELECT to_char(max(e.HIRE_DATE), 'yyyy"��" mm"��" dd"��"')
FROM EMPLOYEES e;


--3��
--�μ����� ����ӱ�, �ְ��ӱ�, �����ӱ��� �μ�(department_id)�� �Բ� ����ϰ� 
--���ļ����� �μ���ȣ(department_id) ���������Դϴ�.
SELECT e.DEPARTMENT_ID "�μ�", 
       avg(nvl(e.SALARY,0)) "����ӱ�",
       max(e.SALARY) "�ְ��ӱ�",
       min(e.SALARY) "�����ӱ�"
FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID
ORDER BY e.DEPARTMENT_ID DESC;


--4��
--����(job_id)���� ����ӱ�, �ְ��ӱ�, �����ӱ��� ����(job_id)�� �Բ� ����ϰ� ���ļ����� 
--����(job_id) ���������Դϴ�.
SELECT e.JOB_ID "����", 
       avg(nvl(e.SALARY,0)) "����ӱ�",
       max(e.SALARY) "�ְ��ӱ�",
       min(e.SALARY) "�����ӱ�"
FROM EMPLOYEES e 
GROUP BY e.JOB_ID 
ORDER BY 1 desc;


--5��
--���� ���� �ټ��� ������ �Ի����� �����ΰ���? ���� �������� ������ּ���.
--��) 2014�� 07�� 10��
SELECT to_char(min(e.HIRE_DATE), 'yyyy"��" mm"��" dd"��"') "�Ի���"
FROM EMPLOYEES e;


--6��
--����ӱݰ� �����ӱ��� ���̰� 2000 �̸��� �μ�(department_id), ����ӱ�, 
--�����ӱ� �׸��� (����ӱ� ? �����ӱ�)�� (����ӱ� ? �����ӱ�)�� ������������ �����ؼ� ����ϼ���.
SELECT e.DEPARTMENT_ID, 
       avg(nvl(e.SALARY,0)) "����ӱ�",
       min(e.SALARY) "�����ӱ�",
       avg(nvl(e.SALARY,0)) - min(e.SALARY) "����ӱ� - �����ӱ�"
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID
having(avg(nvl(e.SALARY,0)) - min(e.SALARY)) < 2000
ORDER BY 4 DESC;


--CASE ~ END ��
SELECT employee_id,
salary,
CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1
WHEN job_id = 'AC_MGR' THEN salary + salary *0.2
ELSE salary
END job_id
FROM employees;


--������ �̸�, �μ�, ���� ����ϼ���
--���� �μ��ڵ�� �����ϸ� �μ��ڵ尡 10~50 �̸� ��A-TEAM��
--60~100�̸� ��B-TEAM�� 110~150�̸� ��C-TEAM�� �������� ���������� ���� ����ϼ���.
SELECT e.FIRST_NAME "�̸�",
       e.DEPARTMENT_ID "�μ�",
       CASE WHEN e.DEPARTMENT_ID >= 10 AND e.DEPARTMENT_ID <= 50 THEN 'A-TEAM'
            WHEN e.DEPARTMENT_ID >= 60 AND e.DEPARTMENT_ID <= 100 THEN 'B-TEAM'
            WHEN e.DEPARTMENT_ID >= 100 AND e.DEPARTMENT_ID <= 150 THEN 'C-TEAM'
          ELSE '������'
	 END "��"
FROM EMPLOYEES e;


-- < JOIN > ////////////////////////////////////////////////////////////////////

--Right outer join
select e.department_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;


--1��
--�� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), 
--�μ���(department_name), �Ŵ���(manager)�� �̸�(first_name)�� ��ȸ�ϼ���.
SELECT emp.EMPLOYEE_ID "���", emp.FIRST_NAME "�̸�", dept.DEPARTMENT_NAME "�μ���" 
FROM EMPLOYEES emp, EMPLOYEES mgr, DEPARTMENTS dept
WHERE emp.MANAGER_ID = mgr.EMPLOYEE_ID
AND   emp.DEPARTMENT_ID = dept.DEPARTMENT_ID;


--3��
--�� �μ�(department)�� ���ؼ� 
--�μ���ȣ(department_id), 
--�μ��̸�(department_name), dept
--�Ŵ���(manager)�� �̸�(first_name), emp
--��ġ(locations)�� ����(city), location
--����(countries)�� �̸�(countries_name) 
--�׸��� ��������(regions)�� �̸�(region_name)���� ���� ����� ������.
SELECT *
FROM DEPARTMENTS d , EMPLOYEES e , LOCATIONS l , COUNTRIES c , REGIONS r 
WHERE d.MANAGER_ID = e.EMPLOYEE_ID 
AND   d.LOCATION_ID = l.LOCATION_ID 
AND   l.COUNTRY_ID = c.COUNTRY_ID 
AND   c.REGION_ID = r.REGION_ID ;


--4��
--��Public Accountant���� ��å(job_title)���� 
--���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����ϼ���. 
--(���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ������� �ʽ��ϴ�.)
--�̸��� first_name�� last_name�� ���� ����մϴ�.
SELECT * FROM JOB_HISTORY jh WHERE JOB_ID = 'AC_ACCOUNT';
SELECT * FROM JOBS j ;
SELECT e.EMPLOYEE_ID , e.FIRST_NAME 
FROM JOB_HISTORY jh , JOBS j , EMPLOYEES e 
WHERE jh.JOB_ID = j.JOB_ID 
AND   jh.EMPLOYEE_ID = e.EMPLOYEE_ID 
AND   j.JOB_TITLE = 'Public Accountant';


--5��
--�������� ���(employee_id), �̸�(first_name), ��(last_name)�� �μ� �̸�(department_name)�� 
--��ȸ�Ͽ� ��(last_name)������ �������� �����ϼ���
--//106 ��  (+ �μ��� ���� ����� ��ȸ �ǵ���.. 107��)
SELECT e.EMPLOYEE_ID , e.FIRST_NAME , e.LAST_NAME , d.DEPARTMENT_NAME 
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID(+) 
ORDER BY 3;


--6��
--�ڽ��� �Ŵ������� ä����(hire_date)�� ���� ����� ���(employee_id), 
--��(last_name)�� ä����(hire_date)�� ��ȸ�ϼ��� //37 ��
select e.employee_id "���", e.last_name "��", e.hire_date "ä����", m.hire_date "�Ŵ���ä����"
from employees e, employees m
where e.manager_id = m.employee_id
and e.hire_date < m.hire_date;

SELECT e.EMPLOYEE_ID , 
       e.LAST_NAME , 
       TO_CHAR(e.HIRE_DATE,'yyyy-mm-dd') , 
       TO_CHAR(m.HIRE_DATE,'yyyy-mm-dd') 
FROM EMPLOYEES e, EMPLOYEES m
WHERE e.MANAGER_ID = m.EMPLOYEE_ID 
AND   e.HIRE_DATE < m.HIRE_DATE ;

