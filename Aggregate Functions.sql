CREATE TABLE employee(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours varchar(10)  
);  
INSERT INTO employee VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  

select * from employee;

/**************  count *************************/

 SELECT COUNT(name) FROM employee; 
 
 SELECT COUNT(*) FROM employee WHERE working_hours >12; 
 
SELECT COUNT(DISTINCT working_hours) FROM employee;  
  
SELECT name, working_hours, COUNT(*) FROM employee GROUP BY working_hours; 
   
SELECT name, working_date, COUNT(*) FROM employee 
GROUP BY working_date   
HAVING COUNT(*)>=2   
ORDER BY COUNT(*); 

SELECT COUNT(DISTINCT occupation) FROM employee;

SELECT name, occupation, working_date, COUNT(*) FROM employee  
GROUP BY working_date 
HAVING COUNT(*)>=2   
ORDER BY COUNT(*);  

/**************** SUM*************************/
SELECT SUM(working_hours) AS "Total working hours" FROM employee; 
SELECT SUM(working_hours) AS "Total working hours" FROM employee WHERE working_hours>=12;  
SELECT  name, occupation, SUM(working_hours) AS "Total working hours" FROM employee GROUP BY occupation;

/*****************HAVING Clause with SUM function********************/

SELECT name, occupation,   
SUM(working_hours) Total_working_hours   
FROM employee   
GROUP BY occupation   
HAVING SUM(working_hours)>12;

 SELECT name, occupation,   
SUM(DISTINCT working_hours) Total_working_hours  
FROM employee   
GROUP BY occupation;

/************** AVG *************************/
SELECT AVG(working_hours) Avg_working_hours FROM employee;
SELECT AVG(working_hours) Avg_working_hours FROM employee WHERE working_hours>=12;
SELECT name, occupation, AVG(working_hours) Avg_working_hours FROM employee GROUP BY occupation;
 
 SELECT name, occupation,   
AVG(working_hours) Avg_working_hours   
FROM employee   
GROUP BY occupation   
HAVING AVG(working_hours)>9;

SELECT name, occupation,   
AVG(DISTINCT working_hours) Avg_working_hours  
FROM employee  
GROUP BY occupation;

/********************* MIN()*************************/
SELECT MIN(working_hours) AS working_hours 
FROM employee;

SELECT MIN(working_hours) AS working_hours 
FROM employee  
WHERE  working_hours >= 6 AND working_hours  <= 12;

SELECT name, MIN(working_hours) AS working_hours 
FROM employee   
GROUP BY name;

SELECT occupation, MIN(working_hours) AS working_hours   
FROM employee   
GROUP BY occupation  
HAVING MIN(working_hours) > 12; 

 SELECT name, occupation, MIN(DISTINCT working_hours) AS working_hours   
FROM employee   
GROUP BY occupation;

/******************* MAX *************************/

CREATE TABLE employees(  
    id int NOT NULL AUTO_INCREMENT,
    name varchar(45) NOT NULL,    
    city varchar(35) NOT NULL,    
    age int ,  
    income varchar(10),  
    primary key(id)
); 

INSERT INTO employees VALUES    
(1,'Robin', 'mumbai', 25, '23000'),
(2,'Nilesh', 'Punjab', 20, '10000'),
(3,'Rahul', 'Delhi', 29, '21000'),
(4,'Divya', 'bengaluru', 20, '15000');
select * from employees;

SELECT MAX(income) AS "Maximum Income" FROM employees;  

SELECT MAX(income) AS "Maximum_Income"   
FROM employees   
WHERE age > 25;

SELECT age, MAX(income) AS "Maximum Income"   
FROM employees   
GROUP BY age;

SELECT city, MAX(income) AS "Maximum Income"   
FROM employees   
GROUP BY city  
HAVING MAX(income) >= 20000;

 SELECT city, MAX(DISTINCT income) AS "Maximum Income"   
FROM employees   
GROUP BY city; 

 SELECT * FROM employees WHERE   
age = (SELECT MAX(age) FROM employees); 

/**************** GROUP CONCAT *************************/

SELECT name, id,   
GROUP_CONCAT(DISTINCT city) as "city" 
FROM employees
 group by name;
 
 SELECT name,   
GROUP_CONCAT(DISTINCT city SEPARATOR '; ') as "city" FROM employees group by id; 

SELECT GROUP_CONCAT(CONCAT_WS(', ', name, city) SEPARATOR ';') as employeename FROM employees; 

/*******************First() *************************/

SELECT name   
FROM employees
LIMIT 1;  

SELECT name   
FROM employees
LIMIT 2;

SELECT name   
FROM employees
LIMIT 3;    

/*************** last() *************************/

SELECT name   
FROM employees 
ORDER BY id DESC  
LIMIT 1;

SELECT name   
FROM employees 
ORDER BY name DESC  
LIMIT 1; 







