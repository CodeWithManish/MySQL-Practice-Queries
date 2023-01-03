create database  CQA_106;
show  create database CQA_106;
use CQA_106;
create database Demo;
show databases;
drop database Demo;
CREATE TABLE employee_table(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    occupation varchar(35) NOT NULL,  
    age int NOT NULL,  
    PRIMARY KEY (id)  
); 
SHOW TABLES;
describe  employee_table;
ALTER TABLE employee_table 
add Phone_Number varchar(10) not null;
ALTER TABLE employee_table 
drop column contactNo;
ALTER TABLE employee_table 
rename column Phone_Num to contactNo;
insert into employee_table(id, name, occupation, age, Phone_Number)
VALUES (3, "Raghu", " Software engineer", 25, "9874561234");
select * from employee_table;

CREATE TABLE customer (    
    Id int PRIMARY KEY NOT NULL,     
    Name varchar(45) NOT NULL,     
    Product varchar(45) DEFAULT NULL,     
    Country varchar(25) DEFAULT NULL,     
    Year int NOT NULL    
);    
INSERT INTO customer ( Id, Name, Product, Country, Year)     
VALUES (1, 'Stephen', 'Computer', 'USA', 2015),     
(2, 'Joseph', 'Laptop', 'India', 2016),     
(3, 'John', 'TV', 'USA', 2016),    
(4, 'Donald', 'Laptop', 'England', 2015),    
(5, 'Joseph', 'Mobile', 'India', 2015),    
(6, 'Peter', 'Mouse', 'England', 2016);
select * from customer;
TRUNCATE TABLE customer;
describe customer;
drop table customer;

