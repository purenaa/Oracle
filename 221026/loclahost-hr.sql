22.10.26

select salary
from employees
where first_name = 'Den';

select employee_id, first_name , salary
from employees
where salary > ( select salary 
                 from employees
                where first_name= 'Den');
                
    
                
--�޿��� ���� ���� �޴� ����� �̸�, �޿�, �����ȣ��?
select first_name, salary,employee_id
from employees
where salary = (select min(salary)
                from employees);
                
                
                
--�� �μ����� �ְ�޿��� �޴� ����� ����ϼ���
select department_id, employee_id, first_name,salary
from employees 
where(department_id,salary)in (select department_id ,max(salary)
                from employees
                group by department_id);
                
                
                
--�� �μ����� �ְ�޿��� �޴� ����� ����ϼ��� ?(���̺��� ����)
select e.department_id, e.employee_id, e.first_name,e.salary
from employees e, (select department_id, max(salary) salary 
                from employees
                group by department_id)s
where e.department_id = s.department_id
and e.salary = s.salary;



--1��
--��� �޿����� ���� �޴� ����� �̸�, �޿��� ����ϼ���          
select first_name, salary 
from employees
where salary < (select avg(nvl(salary,0))
                from employees);
   


--2�� �� �μ����� �ְ��� �޿��� �޴� ����� ������ȣ(employee_id), ��(last_name)�� �޿�(salary), �μ���ȣ(deaprtment_id)��
--��ȸ�ϼ��� ��, ��ȸ����� �޿��� ������������ ���ĵǾ� ��Ÿ���� �մϴ�.
   
           
                
--3��
--�� ����(jpb)���� �޿�(salary)�� ������ ���ϰ��� �մϴ�.
--�޿� ������ ���� ���� �������� ������(job_title)�� �޿� ������ ��ȸ�Ͻÿ�.
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



--���� 4
--�ڽ��� �μ� ��� �޿����� �޿�(salary)�� ���� ������ ������ȣ(employee_id), ��(last_name)�� �޿�(salary)�� ��ȸ�ϼ���.
select e.employee_id , e.last_name, e.salary
from employees e, (select department_id ,avg(nvl(salary,0)) salary
                    from employees 
                    group by department_id) s
where e.department_id = s.department_id
and e.salary > s.salary;



--�޿��� ���� ���� �޴� ������ ���� 11��~20�� �̸��� �޿��� ����Ͻÿ�.
select rn, first_name, salary
from (select rownum rn,  first_name, salary
         from (select first_name,salary
                  from employees
                  order by salary desc)
        )
where rn >= 11
and rn <= 20;



--1��
--���� �ʰ� �Ի��� ������ �̸�(first_name || last_name), ����(salary)�� �ٹ��ϴ� �μ� �̸�(department_name)��?
select max(e.hire_date)
from employees e;

select e.hire_date "�Ի���", d.department_name "�μ��̸�", e.first_name ||' '|| e.last_name "�̸�", e.salary "����"
from employees e, departments d
where e.hire_date = (select max(hire_date)
                             from employees)
and e.department_id = d.department_id;



--2��
--��� �޿�(salary)�� ���� ���� �μ� �������� / ������ȣ(employee_id), �̸�(first_name || last_name), ����(job_title), �޿�(salary)�� ��ȸ�Ͻÿ�.
select e.employee_id,  e.first_name ||' '|| e.last_name, j.job_title, e.salary, s.avg_salary, j.job_title
from employees e, jobs j, (select e.department_id, avg(nvl(e.salary,0)) avg_salary
                                          from employees e
                                          group by e.department_id) s
where e.department_id = s.department_id
and s.avg_salary = (select max(avg(salary))
                            from employees
                            group by department_id)
and e.job_id = j.job_id;



--3��
--��� �޿�(salary)�� ���� ���� �μ���?
select d.department_name, s.avg_salary
from departments d, (select avg(salary) avg_salary, department_id
                            from employees
                            group by department_id) s
where d.department_id = s.department_id
and s.avg_salary = (select max(avg(salary)) max_salary
                            from employees
                            group by department_id);
                            
                            

--4��
--��� �޿�(salary)�� ���� ���� ����(���)��?
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


--5��
--��� �޿�(salary)�� ���� ���� ������?
select job_title
from jobs
where job_id = (select job_id
                      from employees
                      group by job_id
                      having avg(salary) = (select max(avg(salary))
                                                    from employees
                                                    group by job_id));
                                                    
                                                         