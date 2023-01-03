CREATE TABLE People(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    occupation varchar(35) NOT NULL,  
    age int,  
    PRIMARY KEY (id)  
);  

INSERT INTO People VALUES  
(1, 'Joseph', 'Developer', 30),  
(2, 'Mike', 'Leader', 28),  
(3, 'Stephen', 'Scientist', 45); 
 
select * from People;
INSERT INTO People (name, occupation, age) VALUES ('Raju','Engineer',28);
INSERT INTO People (name, occupation) VALUES ('Laxman','Teacher'),('vijay','Doctor');

/****************** Update Query *************************/

UPDATE  People
SET  occupation = 'Leader'
where id = 7;

UPDATE People  
SET name = 'Manish', occupation = 'Content Writer'  
WHERE id = 3; 

/***************** Delete Query *************************/

DELETE FROM People WHERE id = 6;  

 DELETE FROM People ORDER BY name LIMIT 3;  

/********************* Select Query *************************/

SELECT name  FROM People;
SELECT occupation  FROM People;
SELECT name, occupation FROM People; 
select * from People;

/****************** Where Clause *************************/
SELECT *  
FROM people 
WHERE occupation = 'Leader';  

SELECT *  
FROM people  
WHERE occupation = 'Leader'  
AND id = 2; 

SELECT *  
FROM people  
WHERE occupation = 'Leader'  or occupation = 'Engineer' ;

SELECT *  
FROM people  
WHERE occupation = 'Leader'  and occupation = 'Engineer'
or id < 5 ;

/******************* DISTINCT Clause *************************/

SELECT DISTINCT  occupation 
FROM people;  
SELECT DISTINCT occupation, id  
FROM people;  

/******************** From Clause *************************/

SELECT *  
FROM people 
WHERE id <= 3;  

/****************** ORDER BY Clause *************************/

SELECT *  
FROM people 
WHERE occupation = 'Leader'  
 ORDER BY occupation;  
 
 SELECT *  
FROM people 
WHERE occupation = 'Leader'  
 ORDER BY name asc;  
 
  SELECT *  
FROM people 
WHERE occupation = 'Leader'  
 ORDER BY name Desc;
 
SELECT *  
FROM people 
WHERE  id < 5 
 ORDER BY name  Desc, occupation asc; 
 
 Alter table people
 add column Address varchar(20);
 select * from people;
 
 UPDATE  People
SET  Address = 'Delhi'
where id = 8;
 
/************* Group By Clause*************************/ 

 SELECT Address, COUNT(*)  
FROM   people   
GROUP BY Address;  


/************And Condition *************************/

SELECT *  
FROM people 
WHERE name = 'Raju'  
AND id > 3;  

/*************** OR Condition *************************/
SELECT *  
FROM people  
WHERE name = 'Laxman'  
OR id > 100; 

/************** And  OR Condition*************************/
SELECT *  
FROM people 
WHERE (name = 'Laxman' AND name = 'Mike')  
OR (id < 5);  


 Alter table people
 add column Address varchar(20);
 
 update people
 set Address = 'Bangalore'
 where id = 8;
 
 select * from people;
 desc people;
 
Alter table people
 drop column pass;
 
 /******************* Boolean condition*************************/
 
 CREATE TABLE students (  
    studentid INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(40) NOT NULL,  
    age VARCHAR(3),  
    pass BOOLEAN  
);  

INSERT INTO students(name, pass) VALUES('Manish',2);  
INSERT INTO students(name, pass) VALUES('Raju',3);  
INSERT INTO students(name, pass) VALUES('Nilesh',2);  
INSERT INTO students(name, pass) VALUES('Payal',0);  
select * from students;

SELECT  studentid, name, 
IF(pass, 'true', 'false') completed 
FROM students; 

SELECT studentid, name, pass 
FROM students
 WHERE pass is TRUE;  
 
 
 /******************Like condition *************************/
SELECT napeopleme
FROM people
WHERE Address LIKE 'D%'; 

SELECT name  
FROM people  
WHERE Address LIKE 'Mum_ai';

SELECT name  
FROM people 
WHERE Address NOT LIKE 'Del%'; 

/**************** IN  condition *************************/
SELECT *  
FROM people  
WHERE name IN ('Raju', 'Mike', 'vijay');  

SELECT *  
FROM people  
WHERE name = 'Raju'  
OR name = 'Mike'  
OR name = 'vijay';  

/*************** Between  condition *************************/
SELECT *  
FROM people  
WHERE id BETWEEN 1 AND 3;  

/******************IS Not Null  condition *************************/
SELECT *  
FROM people  
WHERE name IS NOT NULL;  

/*************** IS NULL condition *************************/

SELECT *  
FROM people
WHERE name IS NULL;  

/************** Not  condition *************************/
SELECT *  
FROM people  
WHERE name NOT IN ('Raju', 'Mike', 'vijay');  

SELECT *  
FROM people  
WHERE name IS NOT NULL;  

SELECT *  
FROM people  
WHERE name NOT LIKE 'A%';  

SELECT *  
FROM people  
WHERE id NOT BETWEEN 3 AND 5;  

/******************* Not Equal *************************/
SELECT * FROM people WHERE Address <> "delhi"; 
SELECT * FROM people WHERE Address != "delhi"; 

SELECT * FROM people Where age>25 and occupation<>"Developer";  

/*********** ANY Condition*************************/

CREATE TABLE table1 (  
    num_value INT  
);   
INSERT INTO table1 (num_value)   
VALUES(10), (20), (25); 

CREATE TABLE table2 (  
    num_val int
    );
    INSERT INTO table2 (num_val)  
VALUES(20), (7), (10);  

SELECT num_value FROM table1   
WHERE num_value > ANY (SELECT num_val FROM table2); 

SELECT  num_value FROM table1 WHERE  num_value = ANY (SELECT  num_value FROM table2); 
SELECT  num_value FROM table1 WHERE  num_value IN (SELECT  num_value FROM table2); 
    
SELECT  num_value FROM table1 WHERE  num_value <> ANY (SELECT  num_value FROM table2); 
SELECT  num_value FROM table1 WHERE  num_value <> some (SELECT  num_value FROM table2); 


/***************** Exist *************************/
CREATE TABLE customer(  
  cust_id int NOT NULL,  
  name varchar(35),  
  occupation varchar(25),  
  age int  
);  

INSERT INTO customer(cust_id, name, occupation, age)   
VALUES (101, 'Peter', 'Engineer', 32),  
(102, 'Joseph', 'Developer', 30),  
(103, 'John', 'Leader', 28),  
(104, 'Stephen', 'Scientist', 45),  
(105, 'Suzi', 'Carpenter', 26),  
(106, 'Bob', 'Actor', 25),  
(107, NULL, NULL, NULL);  

CREATE TABLE orders (  
    order_id int NOT NULL,   
    cust_id int,   
    prod_name varchar(45),  
    order_date date  
);  
INSERT INTO orders (order_id, cust_id, prod_name, order_date)   
VALUES (1, '101', 'Laptop', '2020-01-10'),  
(2, '103', 'Desktop', '2020-02-12'),  
(3, '106', 'Iphone', '2020-02-15'),  
(4, '104', 'Mobile', '2020-03-05'),  
(5, '102', 'TV', '2020-03-20');

SELECT * FROM customer;  
SELECT * FROM orders; 

 SELECT name, occupation FROM customer  
WHERE EXISTS (SELECT * FROM Orders   
WHERE customer.cust_id = Orders.cust_id);

SELECT name, occupation FROM customer  
WHERE NOT EXISTS (SELECT * FROM Orders   
WHERE customer.cust_id = Orders.cust_id);

DELETE FROM Orders WHERE EXISTS (  
SELECT * FROM customer   
WHERE order_id = 3); 

SELECT * FROM orders;

SELECT EXISTS(SELECT * from customer WHERE cust_id=104) AS Result;   

/**************** Subquery******************/
select * from employees;

SELECT name, city, income FROM employees   
	WHERE id IN (SELECT id FROM employees);
   
   SELECT * 
   FROM employees   
   WHERE id IN (SELECT id FROM employees   
	 WHERE income > 20000);
         
SELECT name, city, income 
FROM employees   
   WHERE income = (SELECT MAX(income) FROM employees);  
   
   SELECT name, city, income 
FROM employees   
   WHERE income = (SELECT MIN(income) FROM employees);  
   
   SELECT name, city FROM employees  
WHERE city NOT IN (  
SELECT city FROM employees WHERE city='mumbai'); 

/************** MySQL Subquery in the FROM Clause*************************/

SELECT Max(items), MIN(items), FLOOR(AVG(items))  
FROM  
    (SELECT order_id, COUNT(order_id) AS items FROM orders  
    GROUP BY order_date) AS Student_order_detail;  
    
    SELECT name, city, income  
FROM  employees  emp WHERE income > (   
SELECT AVG(income) FROM employees WHERE city = emp.city);  

SELECT name, occupation, age FROM customer C  
WHERE EXISTS (SELECT * FROM Orders O  
WHERE C.cust_id = O.cust_id); 

SELECT name, occupation, age FROM customer C  
WHERE NOT EXISTS (SELECT * FROM Orders O  
WHERE C.cust_id = O.cust_id);    

SELECT * FROM customer C WHERE ROW(cust_id, occupation) = (  
SELECT order_id, order_date FROM Orders O WHERE C.cust_id = O.cust_id);  

SELECT cust_id, name FROM customer WHERE   
cust_id > ANY (SELECT cust_id FROM Orders);  

SELECT cust_id, name FROM customer WHERE   
cust_id > ALL (SELECT cust_id FROM Orders);  