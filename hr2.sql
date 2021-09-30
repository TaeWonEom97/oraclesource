select * from HR.employees e1 
join HR.employees e2 on e1.employee_id = e2.manager_id
where e1.hire_date>e2.hire_date;

select last_name,employee_id,d.department_id 
from 
HR.employees e join hr.departments d on e.department_id=d.department_id
               join hr.locations l on l.location_id =d.location_id 
               where l.city like 'T%';

select last_name,d.department_id, salary from
HR.departments d join hr.employees e on d.department_id=e.department_id
where d.location_id=1700;

select d.department_id,last_name,job_id from
HR.employees e join HR.departments d on e.department_id=d.department_id 
where d.department_name='Executive';

select employee_id, last_name from hr.employees  
where department_id in
(select distinct department_id from hr.employees where last_name like  '%u%');
