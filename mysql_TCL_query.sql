CREATE TABLE t_school(
ID INT, 
School_Name VARCHAR(40),
 Number_Of_Students INT, 
 Number_Of_Teachers INT,
 Number_Of_Classrooms INT, 
 EmailID VARCHAR(40)
 ); 
 START TRANSACTION;
  INSERT INTO t_school(ID, School_Name, Number_Of_Students, Number_Of_Teachers, Number_Of_Classrooms, EmailID)
  VALUES(1, "Boys Town Public School", 1000, 80, 12, "btps15@gmail.com"), 
  (2, "Guru Govind Singh Public School", 800, 35, 15, "ggps25@gmail.com"), 
  (3, "Delhi Public School", 1200, 30, 10, "dps101@gmail.com"), (4, "Ashoka Universal School", 1110, 40, 40, "aus17@gmail.com"),
  (5, "Calibers English Medium School", 9000, 31, 50, "cems@gmail.com");  
  
  SELECT *FROM t_school;  
  
  START TRANSACTION;  
  
   COMMIT;  
SET autocommit = 0;  
SAVEPOINT savepoint_name;
  
ROLLBACK TO savepoint_name; 
 
 INSERT INTO t_school(ID, School_Name, Number_Of_Students, Number_Of_Teachers, Number_Of_Classrooms, EmailID) 
 Values(6,'Children School',1200, 50, 30,' children@gmail.com');
 
 Rollback;
 ROLLBACK TO savepoint_name;  
 
  SELECT *FROM t_school;  
  
 start transaction;
  SAVEPOINT Insertion;
 
 SET SQL_SAFE_UPDATES=0;
 
 update  t_school
set  Number_Of_Students = 9050
where  id  = 6;

SET SQL_SAFE_UPDATES=1;

 SELECT *FROM t_school;  
 
 SAVEPOINT Updation;  
 ROLLBACK TO Insertion; 
 
 SELECT *FROM t_school; 
 
 /************************* for Deletion*************************/
 
 USE cqa_106;  
 CREATE TABLE customer_table(
 Customer_ID INT PRIMARY KEY, 
 Name VARCHAR(20), 
 Age INT, 
 Salary INT, 
 Salary_BankAccount VARCHAR(20)
 ); 
 
  INSERT INTO customer_table(Customer_ID, Name, Age, Salary, Salary_BankAccount) 
  VALUES(1, "Aryan Jain", 51, 56000, "SBI"), 
  (2, "Arohi Dixit", 21, 25000, "Axis"),
  (3, "Vineet Garg", 24, 31000, "ICICI"),
  (4, "Anuja Sharma", 26, 49000, "HDFC"),
  (5, "Deepak Kohli", 28, 65000, "SBI");  
 
 Select * from customer_table;
 
 START TRANSACTION; 
 SAVEPOINT Insertion;  
 
 DELETE FROM customer_table WHERE Customer_ID = 5;  
  
  Select * from customer_table;
  
  SAVEPOINT Deletion;  
  
  ROLLBACK TO Insertion;  
  
  Select * from customer_table;
  
  /************************ Data control Language*************************/
  / ------- Grant ----------
  CREATE USER john@localhost IDENTIFIED BY 'jtp12345';
  
  SHOW GRANTS FOR john@localhost; 
  
  GRANT ALL ON mystudentdb.* TO john@localhost;
  
  /-- GRANT EXECUTE ON FUNCTION calculatesalary TO *@localhost;
  
  / ---------------- Revoke -------
  
  REVOKE ALL, GRANT OPTION FROM john@localhost;  
  
  GRANT SELECT, UPDATE, INSERT ON mystudentdb.* TO john@localhost;
  SHOW GRANTS FOR john@localhost;  
  
  REVOKE UPDATE, INSERT ON mystudentdb.* FROM john@localhost;
  
  GRANT PROXY ON 'peter@javatpoint' TO 'john'@'localhost' WITH GRANT OPTION;
  
  SHOW GRANTS FOR 'john'@'localhost'; 
  
  REVOKE PROXY ON 'peter@javatpoint' FROM 'john'@'localhost';  
  
 