use hr;
-- Task 1:-
use hr;
select * from employees;
select * from departments;
select department_name from departments;
select e.employee_id,e.first_name,e.last_name,
(select D.department_name from departments as D where e.department_id=D.department_id) as Dpt_name 
from employees e;
-- Task 2:-
select avg(salary) from employees;
SELECT department_id, first_name, last_name, salary 
FROM employees 
WHERE salary > (select avg(salary) FROM employees);
-- Task 3:- 
select employee_id,first_name,last_name from employees where department_id=80;
select department_name,department_id from departments where department_name="Sales";
select avg(salary) from employees where department_id=80;
select first_name,last_name from employees
 where department_id in(select department_id from departments where department_name='sales')
 and  salary<(select avg(salary) from employees where department_id in(select department_id from departments where department_name='sales'));
-- Task 4:
select * from employees;
select max(salary) from employees where job_id='IT_PROG';
select first_name,last_name,salary from employees where salary>(select max(salary) from employees where job_id='IT_PROG') 
order by salary asc;
-- Task 5:-
select * from employees;
select min(salary) from employees group by job_id order by min(salary) asc;
select e.job_id,e.salary from employees as e where(select min(salary) from employees group by job_id order by e.salary asc);
-- Task 6:-
select e.first_name,e.last_name,e.department_id from employees as e where salary>
(select(sum(salary)*0.6) as 'percentage' from employees as el where el.department_id=e.department_id);





