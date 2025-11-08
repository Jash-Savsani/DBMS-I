CREATE TABLE STU_MASTER(
Rno INT PRIMARY KEY,
Name VARCHAR(10),
Branch VARCHAR(5) DEFAULT 'General',
SPI DECIMAL(4,2) CHECK (SPI<10.00),
Bklog INT CHECK (Bklog>=0)
);
INSERT INTO STU_MASTER VALUES
(101, 'Raju' ,'CE',8.80, 0), 
(102, 'Amit' ,'CE' ,2.20, 3), 
(103, 'Sanjay' ,'ME' ,1.50 ,6), 
(104, 'Neha' ,'EC' ,7.65, 0), 
(105, 'Meera', 'EE' ,5.52 ,2), 
(106, 'Mahesh',NULL,4.50 ,3); 
--Part – A: 
--Create Above table with following constraints 
--1. Do not allow SPI more than 10 
--2. Do not allow Bklog less than 0. 
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified. 
--4. Try to update SPI of Raju from 8.80 to 12.
UPDATE STU_MASTER
SET SPI = 12
WHERE Name='Raju';
--5. Try to update Bklog of Neha from 0 to -1
UPDATE STU_MASTER
SET Bklog = -1
WHERE Name='Neha';
--Part – B: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_details(Did, Dname)
--City_details(Cid, Cname)
CREATE TABLE City_details(
Cid INT PRIMARY KEY,
Cname VARCHAR(50)
);
CREATE TABLE Dept_details(
Did INT PRIMARY KEY,
Dname VARCHAR(50)
);
CREATE TABLE Emp_details(
Eid INT PRIMARY KEY,
Ename VARCHAR(50),
Did INT FOREIGN KEY REFERENCES Dept_details(Did),
Cid INT FOREIGN KEY REFERENCES City_details(Cid),
Salary DECIMAL(8,2),
Experience VARCHAR(50)
);
--Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Empl_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Deptm_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 
CREATE TABLE Country(
Cid INT PRIMARY KEY,
Cname VARCHAR(50)
);
CREATE TABLE State(
Sid INT PRIMARY KEY,
Sname VARCHAR(50),
Cid INT FOREIGN KEY REFERENCES Country(Cid)
);
CREATE TABLE District(
Did INT PRIMARY KEY,
Dname VARCHAR(50),
Sid INT FOREIGN KEY REFERENCES State(Sid)
);
CREATE TABLE City_info(
Cid INT PRIMARY KEY,
Cname VARCHAR(50),
Did INT FOREIGN KEY REFERENCES District(Did)
);
CREATE TABLE Deptm_info(
Did INT PRIMARY KEY,
Dname VARCHAR(50)
);
CREATE TABLE Empl_info
(
Eid INT PRIMARY KEY,
Ename VARCHAR(50),
Did INT FOREIGN KEY REFERENCES Deptm_info(Did),
Cid INT FOREIGN KEY REFERENCES City_info(Cid),
Salary DECIMAL(8,2),
Experience VARCHAR(50)
);
--2. Insert 5 records in each table. 

INSERT INTO Country VALUES 
(1,'India'),
(2,'Japan'),
(3,'America'),
(4,'Nepal'),
(5,'France');

INSERT INTO State VALUES 
(1,'Gujarat',1),
(2,'B',2),
(3,'C',3),
(4,'D',4),
(5,'E',5);

INSERT INTO District VALUES 
(1,'Junagadh',1),
(2,'B2',2),
(3,'C3',3),
(4,'D4',4),
(5,'E5',5);

INSERT INTO City_info VALUES 
(1,'JunagadhCity',1),
(2,'B22',2),
(3,'C33',3),
(4,'D44',4),
(5,'E55',5);

INSERT INTO Deptm_info VALUES 
(1,'Bsc.(Hons).C.S'),
(2,'BCA'),
(3,'MCA'),
(4,'BCom'),
(5,'Btech');

INSERT INTO Empl_info VALUES
(1,'Jash',1,1,1000,'Much'),
(2,'Yash',2,2,500,'Much'),
(3,'Vardhana',3,3,4000,'Much'),
(4,'Karna',4,4,2000,'Much'),
(5,'Arjuna',5,5,100,'Much');
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees.
SELECT Empl_info.Ename,Deptm_info.Dname,Empl_info.Salary,Empl_info.Experience,City_info.Cname,District.Dname,State.Sname,Country.Cname
FROM Empl_info
JOIN Deptm_info
ON Empl_info.Eid=Deptm_info.Did
JOIN City_info
ON City_info.Cid=Deptm_info.Did
JOIN District
ON District.Did=City_info.Cid
JOIN State
ON State.Sid=District.Did
JOIN Country
ON Country.Cid=District.Did;





