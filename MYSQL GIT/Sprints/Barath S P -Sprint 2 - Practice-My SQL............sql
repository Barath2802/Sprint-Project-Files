use techmac_db;
drop table techhyve_employees;
drop table techcloud_employees;
drop table techsoft_employees;
-- Task 1:-
create table techhyve_employees(Employee_ID varchar(50) primary key not null ,First_Name varchar(50) ,Last_Name varchar(50) ,Gender varchar(15) ,age int  );
create table techcloud_employees(Employee_ID varchar(50) primary key not null, First_Name varchar(50) ,Last_Name varchar(50) ,Gender varchar(50) ,age int );
create table techsoft_Employees(Employee_ID varchar(50) primary key not null, First_Name varchar(50) ,Last_Name varchar(50) , Gender varchar(50)  ,age int);
desc techhyve_employees;
desc techcloud_employees;
desc techsoft_employees;
insert into techhyve_employees VALUES("TH0001","ELI","EVANS","MALE",26);
insert into techhyve_employees values("TH0002","CARLOS","SIMMONS","MALE",32);
insert into techhyve_employees values("TH0003","KATHIE","BRYANT","FEMALE",25);
insert into techhyve_employees values("TH0004","JOEY","HUGHES","MALE",41);
insert into techhyve_employees values("TH0005","ALICE","MATTHEWS","FEMALE",52);
select * from techhyve_employees;
insert into techcloud_employees VALUES ("TC0001","TERESA","BRYANT","FEMALE",39);
insert into techcloud_employees values("TC0002","ALEXIS","PATTERSON","MALE",48);
insert into techcloud_employees values("TC0003","ROSE","BELL","FEMALE",42);
insert into techcloud_employees values("TC0004","GEMMMA","WATKINS","FEMALE",44);
insert into techcloud_employees values("TC0005","KINGSTON","MARTINEZ","MALE",29);
select * from techcloud_employees;
insert into techsoft_employees values("TS0001","PETER","BURTLER","MALE",44);
insert into techsoft_employees values("TS0002","HAROLD","SIMMONS","MALE",54);
insert into techsoft_employees values("TS0003","JULIANA","SANDERS","FEMALE",36);
insert into techsoft_employees values("TS0004","PAUL","WARD","MALE",29);
insert into techsoft_employees values("TS0005","NICOLE","BRYANT","FEMALE",30);
select * from techsoft_employees;
alter table techhyve_employees modify column First_name varchar(50) not null;
desc techhyve_employees;
alter table techhyve_employees modify column Last_name varchar(50) not null;
alter table techcloud_employees
modify column First_Name varchar(50) not null, 
modify column last_Name varchar(50) not null;
desc techcloud_employees;
alter table  techsoft_employees 
modify column First_Name varchar(50) not null,
modify column Last_Name varchar(50) not null;
desc techcloud_employees;
-- Task 1.(2):-
alter table techhyve_employees modify column  age int default 21;
desc techhyve_employees;
alter table techcloud_employees modify column age int default 21;
desc techcloud_employees;
alter table techsoft_employees modify column age int default 21;
desc techsoft_employees;
-- Task 1.(3):-
alter table techhyve_employees add constraint check (age>=21 and age<=55);
insert into techhyve_employees values("SPU187652","Barath","S P","MALE",22);
select * from techhyve_employees;
delete from techhyve_employees where age=22;
set sql_safe_updates=0;
alter table techcloud_employees add constraint check(age>=21 and age<=55);
desc techcloud_employees;
alter table techsoft_employees add constraint check(age>=21 and age<=55);
desc techsoft_employees;
-- Task 1.(4):-
alter table techhyve_employees add column username varchar(50) not null,
								add column password varchar(50) not null;
desc techhyve_employees;
alter table techhyve_employees add constraint unique_username unique(username); -- does not executed
alter table techcloud_employees add column username varchar(50) not null,
								add column password varchar(50) not null;
desc techcloud_employees;
alter table techsoft_employees add column username varchar(50) not null,add column password varchar(50) not null;
desc techsoft_employees;
-- Task 1.(5):-
alter table techhyve_employees  add constraint check (gender in ("male","Female"));
alter table techhyve_employees add constraint check (Gender="Male" or Gender="Female");
alter table techcloud_employees add constraint check (Gender="Male" or Gender="Female");
alter table techsoft_employees add constraint check (Gender="Male" or Gender ="Female");
alter table techhyve_employees add column Communication_proficiency varchar(50);
desc techhyve_employees;
alter table techcloud_employees add column Communication_proficiency varchar(50);
desc techcloud_employees;
-- Task 2:-
alter table techsoft_employees add column communication_proficieny varchar(50);
desc techsoft_employees;
alter table techhyve_employees modify column communication_proficiency int  Default 1;
alter table techcloud_employees modify column communication_proficiency int default 1;
desc techsoft_employees;
alter table techsoft_employees modify column communication_proficieny int default 1;
desc techsoft_employees;
alter table techhyve_employees add constraint check(communication_proficiency>=1 and communication_proficiency<=5);
alter table techsoft_employees add constraint check(communication_proficieny>=1 and communication_proficieny<=5);
alter table techcloud_employees add constraint check(communication_proficiency>=1 and communication_proficiency<=5);
-- Task 3:-
create table techhyvecloud_employees(select * from techhyve_employees union all select * from techcloud_employees);
select * from techhyvecloud_employees;