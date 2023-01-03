/************* Not null *************************/

 CREATE TABLE Student(Id INTEGER,
 LastName TEXT NOT NULL,
 FirstName TEXT NOT NULL, 
 City VARCHAR(35)); 
 INSERT INTO Student VALUES(1, 'Kumar', 'Manish', 'Lucknow'); 
 INSERT INTO Student VALUES(2, 'Gupta', 'Raju', 'Delhi'); 
 INSERT INTO Student VALUES(3, 'null', 'Pappu', 'Mumbai'); 
 select * from Student;
 
 /************** UNIQUE Constraint *************************/
 
 CREATE TABLE ShirtBrands(Id INTEGER, BrandName VARCHAR(40) UNIQUE, Size VARCHAR(30));  
INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, 'Pantaloons', 38), (2, 'Cantabil', 40);
INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, 'Raymond', 38), (2, 'Cantabil', 40);
 
 /**************** Check Constraint *************************/
 
CREATE TABLE Persons (  
    ID int NOT NULL,  
    Name varchar(45) NOT NULL,  
    Age int CHECK (Age>=18)  
); 

INSERT INTO Persons(Id, Name,  Age) VALUES(1, 'Rohit' ,19),(2, 'Raghu' ,35),(3, 'Radha' ,19);
INSERT INTO Persons(Id, Name, Age) VALUES (1,'Rohit', 16);  

/**************** DEFAULT *************************/
CREATE TABLE Emp(  
    ID int NOT NULL,  
    Name varchar(45) NOT NULL,  
    Age int,  
    City varchar(25) DEFAULT 'Lucknow'  
);  
 INSERT INTO Emp(Id, Name, Age, City)   
VALUES (1,'Robert', 15, 'Florida'),   
(2, 'Joseph', 35, 'California'),   
(3, 'Peter', 40, 'Alaska');  
INSERT INTO Emp(Id, Name, Age) VALUES (1,'Ram', 15);  
select * from Emp;

/*****************PRIMARY KEY*************************/

CREATE TABLE Persn (  
    ID int NOT NULL PRIMARY KEY,   
    Name varchar(45) NOT NULL,   
    Age int,   
    City varchar(25));  
    
    INSERT INTO Persn(Id, Name, Age, City)   
VALUES (1,'Ramu', 15, 'Gujrat') ,   
(2, 'Laxman', 35, 'Varanasi'),   
(3, 'Satish', 40, 'Mumbai');
INSERT INTO Persn(Id, Name, Age, City)   
VALUES (1,'Raghu', 15, 'Gujrat') ;

/*************** AUTO_INCREMENT *************************/

CREATE TABLE Animals(  
id int NOT NULL AUTO_INCREMENT,   
name CHAR(30) NOT NULL,   
PRIMARY KEY (id));  

INSERT INTO Animals (name) VALUES   
('Tiger'),('Dog'),('Penguin'),   
('Camel'),('Cat'),('Ostrich');

SELECT * FROM Animals;

/***************** ENUM *************************/

 CREATE TABLE Shirts (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    name VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')    
);  

INSERT INTO Shirts(id, name, size)     
VALUES (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large');

SELECT * FROM Shirts;

/*************** INDEX *************************/

 CREATE TABLE Shirts (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    name VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')    
);  

INSERT INTO Shirts(id, name, size)     
VALUES (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large');

CREATE INDEX idx_name ON Shirts(name);
SELECT * FROM Shirts USE INDEX(idx_name); 

/******************** FOREIGN KEY*************************/

CREATE TABLE Person_table (  
    Person_ID  int NOT NULL PRIMARY KEY,   
    Name varchar(45) NOT NULL,   
    Age int,   
    City varchar(25)); 
    
     INSERT INTO  Person_table(Person_ID, Name, Age, City)   
VALUES (1,'Ramu', 15, 'Gujrat') ,   
(2, 'Laxman', 35, 'Varanasi'),   
(3, 'Satish', 40, 'Mumbai');


CREATE TABLE Orders (  
    Order_ID int NOT NULL PRIMARY KEY,  
    Order_Num int NOT NULL,  
    Person_ID int,  
    FOREIGN KEY (Person_ID) REFERENCES Person_table(Person_ID)  
);
select * from Person_table; 

select * from Orders;
