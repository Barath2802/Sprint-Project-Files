-- Task 1:-
select * FROM employees;
SELECT * FROM DEPARTMENTS;
select employee_id,first_name,last_name 
from employees E
join departments D on E.department_id = D.department_id where D.department_name="IT";
 -- Task 2:-
select max(E.salary), D.department_name
from employees E
INNER join departments D ON  E.department_id = D.department_id GROUP BY D.department_name;
select min(E.salary), D.department_name
from employees E
INNER join departments D ON  E.department_id = D.department_id GROUP BY D.department_name;
 -- Task 3:-
 select * from employees;
 select * from departments;
 select * from locations;
select l.city,
count(e.employee_id) as no_of_employees 
from locations  l  join 
departments  d  join 
employees  e on 
l.location_id=d.location_id 
and d.department_id=e.department_id 
group by l.city order by count(e.employee_id) desc limit 10;
-- Task 4:-
select *  from employees;
select * from job_history;
select E.employee_id,E.first_name,E.last_name
from employees E 
join job_history JH on E.employee_id = JH.employee_id where JH.end_date="1999-12-31" ;
-- Task 5:-  
select E.employee_id,E.first_name,E.last_name,year(current_date())-year(E.hire_date) as 
experience from employees E inner join departments D on E.department_id = D.department_id where year(current_date())-year(E.hire_date)>25;