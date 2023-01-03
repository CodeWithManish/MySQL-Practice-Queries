create database emp1;
use emp1;
create table department(
deptno integer(30) not null,
deptname varchar(30),
primary key(deptno)
);

desc department;

insert into department (deptno,deptname)  values(10, 'Accounting');
insert into department (deptno,deptname)  values(20, 'Software');
insert into department (deptno,deptname)  values(30, 'Research');
insert into department (deptno,deptname)  values(40, 'Sales');

select * from department;

create table employee(
ename varchar(30) not null,
eid integer(20) not null auto_increment,
job varchar(30) not null,
sal decimal(8,2)not null,
deptno integer(30) not null,
primary key (eid),
 foreign key (deptno) references department (deptno)
);

desc employee;

insert into employee (eid, ename, job, sal, deptno) values(1, "Manish","Software Engg", 400, 20);
insert into employee (ename, job, sal, deptno) values("Ramesh","Manager", 1000, 10);
insert into employee (ename, job, sal, deptno) values("Aradhya","Analyst", 5000, 30);
insert into employee (ename, job, sal, deptno) values("Shivam","Salesman", 900, 40);
insert into employee (ename, job, sal, deptno) values("Nilesh","Software Developer", 1500, 20);
insert into employee (ename, job, sal, deptno) values("Aarti","Analyst", 1500, 30);
insert into employee (ename, job, sal, deptno) values("Rohit","clerk", 1500, 10);

select * from employee;

# Write a query to display ename and increasing in the sal of 1k 
select ename, sal + 1000 from employee;

#Write a query to display ename and decreasing in the sal of 500 
select ename, sal - 500 from employee ;

# Write a query to display ename and daily salary
select ename, sal / 30 from employee;

# Write a query to display ename and Annual salary
select ename, sal * 12 from employee;

#Write a query to display ename, salary modulus by 2 
select ename, mod(sal,2) from employee;  

#------Relational operators:

#write a query to display all the emp details who is earning salary more than 2k
select * from employee where sal > 2000;

#write a query to display all the emp details who is earning salary less than 1500
select * from employee where sal < 1500;

#write a query to display all the emp details apart from (doctor/ manager)
select * from employee where job <> 'Manager';

#write a query to display name in ass order from emp table
select * from employee ORDER BY ename ASC; 

#Logical operators:

#write a query to display all the emp details of software who belongs to 20th dept
select  * from employee where job ='Software Developer ' or deptno = 20;

#write a query to display all the emp details of Analyst who earns salary more
select ename, Max(sal) from employee where job = 'Analyst';

#write a query to display all the emp details who belongs to 10 and 30 dept 
select * from employee where deptno =10 or deptno =30;

#write a query to display all the emp details for clerk  and manager
select * from employee where job = 'clerk' or  job = 'Manager';


