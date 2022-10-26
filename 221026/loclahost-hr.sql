22.10.26

select salary
from employees
where first_name = 'Den';

select employee_id, first_name , salary
from employees
where salary > ( select salary 
                 from employees
                where first_name= 'Den');
                
    
                
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select first_name, salary,employee_id
from employees
where salary = (select min(salary)
                from employees);
                
                
                
--각 부서별로 최고급여를 받는 사원을 출력하세요
select department_id, employee_id, first_name,salary
from employees 
where(department_id,salary)in (select department_id ,max(salary)
                from employees
                group by department_id);
                
                
                
--각 부서별로 최고급여를 받는 사원을 출력하세요 ?(테이블에서 조인)
select e.department_id, e.employee_id, e.first_name,e.salary
from employees e, (select department_id, max(salary) salary 
                from employees
                group by department_id)s
where e.department_id = s.department_id
and e.salary = s.salary;



--1번
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요          
select first_name, salary 
from employees
where salary < (select avg(nvl(salary,0))
                from employees);
   


--2번 각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 성(last_name)과 급여(salary), 부서번호(deaprtment_id)를
--조회하세요 단, 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다.
   
           
                
--3번
--각 업무(jpb)별로 급여(salary)의 총합을 구하고자 합니다.
--급여 총합이 가장 높은 업무부터 업무명(job_title)과 급여 총합을 조회하시오.
select j.job_title , s.sal
from jobs j ,(select e.job_id , sum(salary ) sal
                    from employees e
                    group by e.job_id) s
where j.job_id = s.job_id
order by 2 desc;


select j.job_title, sum(salary)
from employees e , jobs j
where e.job_id = j.job_id
group by j.job_title
order by 2 desc;



--문제 4
--자신의 부서 평균 급여보다 급여(salary)가 많은 직원의 직원번호(employee_id), 성(last_name)과 급여(salary)를 조회하세요.
select e.employee_id , e.last_name, e.salary
from employees e, (select department_id ,avg(nvl(salary,0)) salary
                    from employees 
                    group by department_id) s
where e.department_id = s.department_id
and e.salary > s.salary;



--급여를 가장 많이 받는 직원의 순위 11위~20위 이름과 급여를 출력하시오.
select rn, first_name, salary
from (select rownum rn,  first_name, salary
         from (select first_name,salary
                  from employees
                  order by salary desc)
        )
where rn >= 11
and rn <= 20;



--1번
--가장 늦게 입사한 직원의 이름(first_name || last_name), 월급(salary)과 근무하는 부서 이름(department_name)은?
select max(e.hire_date)
from employees e;

select e.hire_date "입사일", d.department_name "부서이름", e.first_name ||' '|| e.last_name "이름", e.salary "월급"
from employees e, departments d
where e.hire_date = (select max(hire_date)
                             from employees)
and e.department_id = d.department_id;



--2번
--평균 급여(salary)가 가장 높은 부서 직원들의 / 직원번호(employee_id), 이름(first_name || last_name), 업무(job_title), 급여(salary)을 조회하시오.
select e.employee_id,  e.first_name ||' '|| e.last_name, j.job_title, e.salary, s.avg_salary, j.job_title
from employees e, jobs j, (select e.department_id, avg(nvl(e.salary,0)) avg_salary
                                          from employees e
                                          group by e.department_id) s
where e.department_id = s.department_id
and s.avg_salary = (select max(avg(salary))
                            from employees
                            group by department_id)
and e.job_id = j.job_id;



--3번
--평균 급여(salary)가 가장 높은 부서는?
select d.department_name, s.avg_salary
from departments d, (select avg(salary) avg_salary, department_id
                            from employees
                            group by department_id) s
where d.department_id = s.department_id
and s.avg_salary = (select max(avg(salary)) max_salary
                            from employees
                            group by department_id);
                            
                            

--4번
--평균 급여(salary)가 가장 높은 지역(대륙)은?
select region_name
from regions 
where region_id = (select r.region_id
                          from employees e, departments d, countries c, locations l, regions r
                          where e.department_id = d.department_id
                          and d.location_id = l.location_id
                          and l.country_id = c.country_id
                          and c.region_id = r.region_id
                          group by r.region_id
                          having avg(salary) = (select max(avg(salary))
                                                        from employees e, departments d, locations l, countries c, regions r
                                                         where e.department_id = d.department_id
                                                         and d.location_id = l.location_id
                                                         and l.country_id = c.country_id
                                                         and c.region_id = r.region_id
                                                         group by r.region_id));


--5번
--평균 급여(salary)가 가장 높은 업무는?
select job_title
from jobs
where job_id = (select job_id
                      from employees
                      group by job_id
                      having avg(salary) = (select max(avg(salary))
                                                    from employees
                                                    group by job_id));
                                                    
                                                         