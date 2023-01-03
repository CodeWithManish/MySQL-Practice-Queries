create database crud_operation;
use crud_operation;
create table students(
sid integer(20) not null auto_increment,
sname varchar(30) not null,
deptname varchar(30) not null,
college varchar(30) not null,
primary key(sid)
);

use crud_operation;
show tables;

-- create
create procedure getStudentData()
select * from students;

-- insert 
create procedure insertStudentData()
insert into students (sname,deptname, college)values('Ram','CE','SRM');


-- update
create procedure updateStudentData()
update students  set deptname ='IT' where sid = 2;


-- read 
#execute getStudentData;
call getStudentData;

-- delete
create procedure deleteStudentData()
delete from students where sid = 2;

call deleteStudentData;



