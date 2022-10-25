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

--사원의 이름(fisrt_name)과 전화번호, 입사일, 연봉(급여)을 출력하세요.
SELECT e.FIRST_NAME "이름",
       e.LAST_NAME "성",
       e.SALARY "급여",
       e.PHONE_NUMBER "전화번호",
       e.EMAIL "이메일",
       e.HIRE_DATE "입사일"
FROM EMPLOYEES e;


--연결 연산자(Concatenation)로 컬럼들 붙이기, ‘ ‘(작은따옴표)를 사용하여 문자열을 추가하여 출력할 수 있다
select first_name ||'의 입사일은 '|| last_name "이름"
from employees;


--산술 연산자 사용하기 (숫자에만 사용할 수 있음 / 이름(문자) * 12(숫자)는 불가능)
select first_name, salary, salary*12, (salary+300)*12
from employees;


--전체직원의 정보를 다음과 같이 출력하세요. (성명, 급여, 연봉, 연봉2, 전화번호)
SELECT e.FIRST_NAME ||' '||e.LAST_NAME "성명",
       e.SALARY "급여",
       e.SALARY *12 "연봉",
       (e.SALARY *12) +5000 "연봉2",
       e.PHONE_NUMBER "전화번호"
FROM EMPLOYEES e;


-- < WHERE 절 > ,,조회하기   ////////////////////////////////////////////////////


--비교연산자(부서번호가 10인 사원의 이름을 구하시오)
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10;


--급여가15000 이상인 사원들의 이름과 급여와 연봉을 출력하세요.
SELECT e.FIRST_NAME,
       e.SALARY,
       e.SALARY *12
FROM EMPLOYEES e
WHERE e.SALARY >= 15000;


--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요.
SELECT e.FIRST_NAME||' '||e.LAST_NAME "이름",
       e. HIRE_DATE "입사일"
FROM EMPLOYEES e
WHERE e.HIRE_DATE >= '07/01/01';

SELECT TO_CHAR(e.HIRE_DATE, 'yy/mm/dd')
FROM EMPLOYEES e;


--§이름이 Lex인 직원의 연봉을 출력하세요
SELECT e.SALARY *12
FROM EMPLOYEES e
WHERE e.FIRST_NAME = 'Lex';


--조건이 2개이상 일때 한꺼번에 조회하기
--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
SELECT e.FIRST_NAME, e.SALARY
FROM EMPLOYEES e
WHERE e.SALARY >= 14000 
and e.SALARY <= 17000;


--입사일이 04/01/01 에서 05/12/31 사이에 입사한 사원의 이름과 입사일을 출력하세요
SELECT e.FIRST_NAME||' '||e.LAST_NAME "이름",
       e. HIRE_DATE "입사일"
FROM EMPLOYEES e
WHERE e.HIRE_DATE >= '04/01/01'
and e. HIRE_DATE <= '05/12/31';


--BETWEEN 연산자로 특정구간 값 출력하기
--연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오
SELECT e.FIRST_NAME||' '||e.LAST_NAME "이름", 
       e.SALARY *12 "연봉"
FROM EMPLOYEES e
WHERE e.SALARY between 14000 and 17000;


--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요. 
SELECT e.DEPARTMENT_ID "부서번호",  
       e.SALARY "급여",
       e.FIRST_NAME||' '||e.LAST_NAME "이름"
FROM EMPLOYEES e
ORDER BY e.DEPARTMENT_ID asc,  e.SALARY desc, e.FIRST_NAME||' '||e.LAST_NAME;


--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호, 급여, 이름을 출력하세요
SELECT e.DEPARTMENT_ID "부서번호",
       e.SALARY "급여",
       e.FIRST_NAME||' '||e.LAST_NAME "이름"
FROM EMPLOYEES e
WHERE SALARY >= 5000
ORDER BY e.DEPARTMENT_ID asc, e.SALARY desc;


--문자함수 ? INITCAP(컬럼명) : 영어의 첫 글자만 대문자로 출력하고 나머지는 전부 소문자로 출력하는 함수
SELECT email, INITCAP(email), DEPARTMENT_ID
FROM EMPLOYEES e
WHERE DEPARTMENT_ID = 100;


--문자함수 ? LOWER(컬럼명) / UPPER(컬럼명) : 입력되는 값을 전부 소문자/대문자로 변경하는 함수
SELECT FIRST_NAME, lower(FIRST_NAME), upper(FIRST_NAME)
FROM EMPLOYEES e
where DEPARTMENT_ID = 100;


--1번
--전체 직원의 다음 정보를 조회하세요.
--정렬은 입사일(HIRE_DATE)의 오름차순(ASC)으로 가장 선임부터 출력 되도록 하세요.
--이름(FIRST_NAME || LAST_NAME), 월급(SALARY), 전화번호(PHONE_NUMBER), 입사일(HIRE_DATE) 순이고
--"이름", "월급", "전화번호", "입사일"로 컬럼 이름을 대체(COLUMN ALIAS)해 보세요.
SELECT e.FIRST_NAME ||' '|| e.LAST_NAME "이름",
       e.SALARY "월급",
       e.PHONE_NUMBER "전화번호",
       e.HIRE_DATE "입사일"
FROM EMPLOYEES e
ORDER BY  e.HIRE_DATE ASC;


--5번
--월급이 14000미만 10000 이상인 직원의 이름(FIRST_NAME), 월급, 커미션퍼센트를 월급순(내림차순 DESC)으로 출력하세요.
--단, 커미션 퍼센트가 NULL이면 0으로 나타내시오.
SELECT e.FIRST_NAME "이름",
       e.SALARY "월급",
       nvl(e.COMMISSION_PCT, 0) "커미션퍼센트"
FROM EMPLOYEES e 
WHERE e.SALARY < 14000
AND   e.SALARY >= 10000
ORDER BY e.SALARY desc;


--6번
--부서번호가 10, 90, 100인 직원의 이름, 월급, 입사일, 부서번호를 나타내시오.
--입사일은 1977-12와 같이 표시하시오.
SELECT e.FIRST_NAME ||' '|| e.LAST_NAME "이름",
       e.SALARY "월급",
       TO_CHAR(e.HIRE_DATE, 'YYYY-MM') "입사일",
       e.DEPARTMENT_ID "부서번호"
FROM EMPLOYEES e
WHERE e.DEPARTMENT_ID in(10, 90, 100);


--7번
--이름(first_name)에 S 또는 s가 들어가는 직원의 이름, 월급을 나타내시오.
SELECT e.FIRST_NAME , e.SALARY 
FROM EMPLOYEES e 
WHERE UPPER(e.FIRST_NAME) LIKE '%S%';


--8번
--전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요.
SELECT *
FROM DEPARTMENTS d
ORDER BY LENGTH(d.DEPARTMENT_NAME) DESC;


--9번
--정확하지 않지만, 지사가 있을 것으로 예상되는 나라들을 나라이름을 대문자로 출력하고 오름차순(ASC)으로 정렬해보세요.
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

--검색하는 방법
--SELECT  *
--ROM LOCATIONS l
--ORDER BY l.LOCATION_ID DESC;


--10번
--입사일이 2003/12/31일 이전 입사한 직원의 이름, 월급, 전화 번호, 입사일을 출력하세요.
--전화번호는 545-343-3433 과 같은 형태로 출력하시오.
SELECT e.FIRST_NAME ||' '|| e.LAST_NAME "이름", 
       e.SALARY "월급", 
       REPLACE(PHONE_NUMBER, '.', '-') "전화 번호", 
       e.HIRE_DATE "입사일"
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


--1번
--직원 중에 최고임금(SALARY)과 최저임금을 "최고임금", "최저임금" 프로젝트 타이틀로 함께 출력해 보세요.
--두 임금의 차이는 얼마인가요?
--"최고임금 - 최저임금"이란 타이틀로 출력해보세요.
SELECT max(e.SALARY) "최고임금",
       min(e.SALARY) "최저임금",
       max(e.SALARY) - min(e.SALARY) "최고임금 - 최저임금"
FROM EMPLOYEES e;


--2번
--마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
SELECT to_char(max(e.HIRE_DATE), 'yyyy"년" mm"월" dd"일"')
FROM EMPLOYEES e;


--3번
--부서별로 평균임금, 최고임금, 최저임금을 부서(department_id)와 함께 출력하고 
--정렬순서는 부서번호(department_id) 내림차순입니다.
SELECT e.DEPARTMENT_ID "부서", 
       avg(nvl(e.SALARY,0)) "평균임금",
       max(e.SALARY) "최고임금",
       min(e.SALARY) "최저임금"
FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID
ORDER BY e.DEPARTMENT_ID DESC;


--4번
--업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무(job_id)와 함께 출력하고 정렬순서는 
--업무(job_id) 내림차순입니다.
SELECT e.JOB_ID "업무", 
       avg(nvl(e.SALARY,0)) "평균임금",
       max(e.SALARY) "최고임금",
       min(e.SALARY) "최저임금"
FROM EMPLOYEES e 
GROUP BY e.JOB_ID 
ORDER BY 1 desc;


--5번
--가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
--예) 2014년 07월 10일
SELECT to_char(min(e.HIRE_DATE), 'yyyy"년" mm"월" dd"일"') "입사일"
FROM EMPLOYEES e;


--6번
--평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 평균임금, 
--최저임금 그리고 (평균임금 ? 최저임금)를 (평균임금 ? 최저임금)의 내림차순으로 정렬해서 출력하세요.
SELECT e.DEPARTMENT_ID, 
       avg(nvl(e.SALARY,0)) "평균임금",
       min(e.SALARY) "최저임금",
       avg(nvl(e.SALARY,0)) - min(e.SALARY) "평균임금 - 최저임금"
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID
having(avg(nvl(e.SALARY,0)) - min(e.SALARY)) < 2000
ORDER BY 4 DESC;


--CASE ~ END 문
SELECT employee_id,
salary,
CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1
WHEN job_id = 'AC_MGR' THEN salary + salary *0.2
ELSE salary
END job_id
FROM employees;


--직원의 이름, 부서, 팀을 출력하세요
--팀은 부서코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
--60~100이면 ‘B-TEAM’ 110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.
SELECT e.FIRST_NAME "이름",
       e.DEPARTMENT_ID "부서",
       CASE WHEN e.DEPARTMENT_ID >= 10 AND e.DEPARTMENT_ID <= 50 THEN 'A-TEAM'
            WHEN e.DEPARTMENT_ID >= 60 AND e.DEPARTMENT_ID <= 100 THEN 'B-TEAM'
            WHEN e.DEPARTMENT_ID >= 100 AND e.DEPARTMENT_ID <= 150 THEN 'C-TEAM'
          ELSE '팀없음'
	 END "팀"
FROM EMPLOYEES e;


-- < JOIN > ////////////////////////////////////////////////////////////////////

--Right outer join
select e.department_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;


--1번
--각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 
--부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
SELECT emp.EMPLOYEE_ID "사번", emp.FIRST_NAME "이름", dept.DEPARTMENT_NAME "부서명" 
FROM EMPLOYEES emp, EMPLOYEES mgr, DEPARTMENTS dept
WHERE emp.MANAGER_ID = mgr.EMPLOYEE_ID
AND   emp.DEPARTMENT_ID = dept.DEPARTMENT_ID;


--3번
--각 부서(department)에 대해서 
--부서번호(department_id), 
--부서이름(department_name), dept
--매니저(manager)의 이름(first_name), emp
--위치(locations)한 도시(city), location
--나라(countries)의 이름(countries_name) 
--그리고 지역구분(regions)의 이름(region_name)까지 전부 출력해 보세요.
SELECT *
FROM DEPARTMENTS d , EMPLOYEES e , LOCATIONS l , COUNTRIES c , REGIONS r 
WHERE d.MANAGER_ID = e.EMPLOYEE_ID 
AND   d.LOCATION_ID = l.LOCATION_ID 
AND   l.COUNTRY_ID = c.COUNTRY_ID 
AND   c.REGION_ID = r.REGION_ID ;


--4번
--‘Public Accountant’의 직책(job_title)으로 
--과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. 
--(현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려하지 않습니다.)
--이름은 first_name과 last_name을 합쳐 출력합니다.
SELECT * FROM JOB_HISTORY jh WHERE JOB_ID = 'AC_ACCOUNT';
SELECT * FROM JOBS j ;
SELECT e.EMPLOYEE_ID , e.FIRST_NAME 
FROM JOB_HISTORY jh , JOBS j , EMPLOYEES e 
WHERE jh.JOB_ID = j.JOB_ID 
AND   jh.EMPLOYEE_ID = e.EMPLOYEE_ID 
AND   j.JOB_TITLE = 'Public Accountant';


--5번
--직원들의 사번(employee_id), 이름(first_name), 성(last_name)과 부서 이름(department_name)을 
--조회하여 성(last_name)순서로 오름차순 정렬하세요
--//106 명  (+ 부서가 없는 사람도 조회 되도록.. 107명)
SELECT e.EMPLOYEE_ID , e.FIRST_NAME , e.LAST_NAME , d.DEPARTMENT_NAME 
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID(+) 
ORDER BY 3;


--6번
--자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 
--성(last_name)과 채용일(hire_date)을 조회하세요 //37 명
select e.employee_id "사번", e.last_name "성", e.hire_date "채용일", m.hire_date "매니저채용일"
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

