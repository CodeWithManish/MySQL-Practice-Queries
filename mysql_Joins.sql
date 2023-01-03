
use cqa_106;
create table officers(
 officer_id  int not null auto_increment,
officer_name varchar(20),
address varchar(20),
primary key(officer_id)
);
insert into officers values(1,'Ajeet', 'Mau');
insert into officers values(2,'Deepika', 'Lucknow');
insert into officers values(3,'Vimal', 'Faizabad');
insert into officers values(4,'Rahul', 'Lucknow');

select * from officers;
create table stud(
 student_id  int not null auto_increment,
student_name varchar(20),
course_name varchar(20),
primary key(student_id)
);
insert into stud values(1,'Aryan', 'Java');
insert into stud values(2,'Rohini', 'Hadoop');
insert into stud values(3,'Lallu', 'MongoDB');

select * from stud;

SELECT officers.officer_name, officers.address, stud.course_name  
FROM officers   
INNER JOIN stud  
ON officers.officer_id = stud.student_id; 

/************************* Left Outer Join *************************/
SELECT  officers.officer_name, officers.address, stud.course_name  
FROM officers  
LEFT JOIN stud  
ON officers.officer_id = stud.student_id;  

/*************** Right Outer Join*************************/

SELECT officers.officer_name, officers.address, stud.course_name, stud.student_name  
FROM officers  
RIGHT JOIN stud  
ON officers.officer_id = stud.student_id;  

/************* MySQL Inner Join Example*************************/

create table  student1(
student_id  int not null auto_increment,
stud_fname varchar(20),
stud_lname varchar(20),
city varchar(20),
primary key(student_id)
);
select * from student1;

insert into student1 values(1,'Devin','Putin','France');
insert into student1 values(2,'Michael','Clark','Australiya');
insert into student1 values(3,'Ethon','Miller','England');
insert into student1 values(4,'Mark','Strauss','America');

create table  technologies(
student_id  int not null auto_increment,
tech_id int ,
inst_name varchar(20),
technology varchar(20),
primary key(student_id)
);
insert into technologies values(1,1,'Java Training Inst','Java');
insert into technologies values(2,2,'Chroma campus','Angular');
insert into technologies values(3,3,'CETPA Infotech','Big Data');
insert into technologies values(4,4,'Aptron','IOS');

select * from technologies;

SELECT student1.stud_fname, student1.stud_lname, student1.city, technologies.technology    
FROM student1   
INNER JOIN technologies    
ON student1.student_id = technologies.tech_id; 

/*************** MySQL Inner Join with Group By Clause*************************/

SELECT student1.student_id, technologies.inst_name, student1.city, technologies.technology    
FROM student1 
INNER JOIN technologies    
ON student1.student_id = technologies.tech_id GROUP BY inst_name;

/*************** MySQL Inner Join with USING clause *************************/

SELECT student_id, inst_name, city, technology    
FROM student1 
INNER JOIN technologies    
USING (student_id);  

/****************** Inner Join with WHERE Clause *************************/

SELECT tech_id, inst_name, city, technology    
FROM student1  
INNER JOIN technologies    
USING (student_id) WHERE technology = "Java";  


/************** MySQL Inner Join using Operators *************************/
select * from customer;
select * from employees;

SELECT cust_id, occupation, income 
FROM employees  
INNER JOIN customer  
 WHERE income>20000 and  income<80000; 
 
 /********************* MySQL Inner Join Multiple Tables *************************/
 alter table technologies
add column cellphone int ;

select * from technologies;

update technologies
set  cellphone = '6668'
where  student_id  = 4;

select * from  student1;


create table contact(
college_id int not null auto_increment,
cellphone int,
homephone int(20),
primary key(college_id)
);
insert into contact values(1,'9237','5764');
insert into contact values(2,'1237','5555');
insert into contact values(3,'8238','6666');
insert into contact values(4,'4234','7412');
select * from contact;
update contact
set  cellphone = 6668
where  college_id  = 4;

SELECT student_id, inst_name, city, technology, cellphone  
FROM student1  
INNER JOIN technologies USING (student_id)
INNER JOIN contact ORDER BY student_id;  

/*************** Left Join*************************/
create table customers(
customer_id int not null auto_increment,
cust_name varchar(20),
occupation varchar(20),
income int (20),
qualification varchar(20),
primary key(customer_id)
);
select * from customers;
insert into customers values(1,'Manish','Engineer','40000','Btech');
insert into customers values(2,'Raghu','Clerk','30000','Commerce');
insert into customers values(3,'Divya','Advocate','50000','LLB');
insert into customers values(4,'vijay','Doctor','60000','MBBS');

create table order1(
order_id int  not null auto_increment,
date date,
customer_id int,
price int,
primary key(order_id)
);
insert into order1 values(1001,'2020-03-20','2','3000');
insert into order1 values(1002,'2020-02-15','4','2500');
insert into order1 values(1003,'2020-03-10','2','1500');
insert into order1 values(1004,'2020-02-20','1','4500');
insert into order1 values(1005,'2020-03-15','3','4000');

SELECT customers.customer_id, cust_name, price, date  
FROM customers  
LEFT JOIN order1 ON customers.customer_id = order1.customer_id; 

/************* MySQL LEFT JOIN with USING Clause *************************/

SELECT customer_id, cust_name, occupation, price, date  
FROM customers  
LEFT JOIN order1 USING(customer_id);  


/******************* MySQL LEFT JOIN with Group By Clause *************************/

SELECT customers.customer_id, cust_name, qualification, price, date  
FROM customers  
LEFT JOIN order1 ON customers.customer_id = order1.customer_id  
GROUP BY price;  

/*************** LEFT JOIN with WHERE Clause *************************/

SELECT customer_id, cust_name, occupation, price, date  
FROM customers  
LEFT JOIN order1   
USING(customer_id) WHERE price>2500;  

/*************** MySQL LEFT JOIN Multiple Tables *************************/

SELECT customers.customer_id, cust_name, order_id, price, cellphone  
FROM customers  
LEFT JOIN contact ON customer_id = college_id  
LEFT JOIN order1 ON customers.customer_id = order1.customer_id ORDER BY income;  

/***************** Use of LEFT JOIN clause to get unmatched records*************************/

SELECT customer_id, cust_name, cellphone, homephone  
FROM customers  
LEFT JOIN contact ON customer_id = college_id  
WHERE cellphone IS NULL ; 

/******************* WHERE Clause  in MySQL LEFT JOIN *************************/

SELECT cust_name, occupation, order_id, price, date  
FROM customers  
LEFT JOIN order1   
USING(customer_id) WHERE price=2500;

/******************* On Clause  in MySQL LEFT JOIN *************************/

SELECT cust_name, occupation, order_id, price, date  
FROM customers LEFT JOIN order1 ON price=2500;  


/***************** Right Outer Join *************************/

SELECT cust_name, occupation, order_id, price, date  
FROM customers LEFT JOIN order1 ON price=2500;  

/*************** OR *************************/

SELECT customers.customer_id, cust_name, price, date  
FROM customers  
RIGHT JOIN order1 USING(customer_id)  
ORDER BY  customer_id;  

/************** RIGHT JOIN with WHERE Clause*************************/

SELECT * FROM customers  
RIGHT JOIN order1 USING(customer_id)  
WHERE price>2500 AND price<5000; 


/************ MySQL RIGHT JOIN Multiple Tables *************************/

SELECT customers.customer_id, cust_name, order_id, price, cellphone  
FROM customers  
RIGHT JOIN contact ON customer_id = college_id  
RIGHT JOIN order1 ON customers.customer_id = order1.customer_id ORDER BY order_id;  

/***************** Use of RIGHT JOIN clause to get unmatched records*************************/

SELECT customer_id, cust_name, cellphone, homephone  
FROM customers  
RIGHT JOIN contact ON customer_id = college_id  
WHERE cellphone IS NULL  
ORDER BY cellphone;  

/****************** Cross Join *************************/

SELECT *  
FROM customer  
CROSS JOIN contact;  

/******************* Ambiguous Columns problem in MySQL CROSS JOIN *************************/

SELECT customer_id, cust_name, income, order_id, price  
FROM customers  
CROSS JOIN order1;  


SELECT customers.customer_id, customers.cust_name, customers.income, order1.order_id, order1.price  
FROM customers  
CROSS JOIN order1;  

/************************* LEFT JOIN with WHERE Clause *************************/

SELECT customers.customer_id, customers.cust_name, customers.income, order1.order_id, order1.price  
FROM customers  
CROSS JOIN order1 
USING(customer_id) WHERE price>1500 AND price<5000;  


SELECT * FROM customers  
LEFT JOIN(order1 CROSS JOIN contact)  
ON customers.customer_id=college_id  
ORDER BY income;  