SELECT * FROM STUDENT_DATA;
SELECT * FROM DEPARTMENT;
SELECT * FROM ACADEMIC;
--Part – A: 
--1. Display details of students who are from computer department.
SELECT * 
FROM STUDENT_DATA S 
WHERE DID = 
(SELECT DID FROM DEPARTMENT 
WHERE Dname = 'computer');
--2. Displays name of students whose SPI is more than 8. 
SELECT Name
FROM STUDENT_DATA D
WHERE Rno IN 
(SELECT RNO FROM ACADEMIC 
WHERE SPI>8);
--3. Display details of students of computer department who belongs to Rajkot city. 
SELECT *
FROM STUDENT_DATA
WHERE City = 'Rajkot' AND DID=
(SELECT DID FROM DEPARTMENT 
WHERE DName='computer');
--4. Find total number of students of electrical department. 
SELECT COUNT(Rno) AS TOTAL_STU
FROM STUDENT_DATA
WHERE DID = 
(SELECT DID FROM DEPARTMENT 
WHERE Dname='electrical');
--5. Display name of student who is having maximum SPI. 
SELECT Name
FROM STUDENT_DATA
WHERE Rno = 
(SELECT RNO 
FROM ACADEMIC
WHERE SPI = 
(SELECT MAX(SPI) 
FROM ACADEMIC));
--6. Display details of students having more than 1 backlog. 
SELECT *
FROM STUDENT_DATA
WHERE Rno IN 
(SELECT RNO 
FROM ACADEMIC
WHERE BKLOG>1);
--Part – B: 
--1. Display name of students who are either from computer department or from mechanical department. 
SELECT *
FROM STUDENT_DATA
WHERE DID IN 
(SELECT DID 
FROM DEPARTMENT 
WHERE Dname='mechanical' OR Dname='computer');
--2. Display name of students who are in same department as 102 studying in. 
SELECT Name
FROM STUDENT_DATA
WHERE DID = 
(SELECT DID FROM STUDENT_DATA
WHERE Rno = 102) AND Rno<>102;
--Part – C: 
--1. Display name of students whose SPI is more than 9 and who is from electrical department. 
SELECT Name
FROM STUDENT_DATA
WHERE Rno = 
(SELECT RNO 
FROM ACADEMIC
WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC))
AND 
DID = 
(SELECT DID 
FROM DEPARTMENT
WHERE DName = 'electrical'
)
--2. Display name of student who is having second highest SPI. 
SELECT Name
FROM STUDENT_DATA
WHERE Rno
=
(SELECT Rno FROM ACADEMIC WHERE SPI = 
(SELECT MAX(SPI) 
FROM ACADEMIC 
WHERE SPI<
(SELECT MAX(SPI)
FROM ACADEMIC)
));
--3. Display city names whose students SPI is 9.2 
SELECT City
FROM STUDENT_DATA
WHERE Rno = 
(SELECT RNO
FROM ACADEMIC
WHERE SPI=9.2);
--4. Find the names of students who have more than the average number of backlogs across all students. 
SELECT Name
FROM STUDENT_DATA
WHERE Rno IN
(SELECT RNO 
FROM ACADEMIC
WHERE BKLOG > 
(SELECT AVG(BKLOG) FROM ACADEMIC));
--5. Display the names of students who are in the same department as the student with the highest SPI. 
SELECT Name
FROM STUDENT_DATA
WHERE DID =
(SELECT DID FROM STUDENT_DATA
WHERE RNO = 
(SELECT RNO FROM ACADEMIC 
WHERE SPI =
(SELECT MAX(SPI) FROM ACADEMIC)));

--SET Operators 
--Part – A: 
CREATE TABLE COMPUTER
(
RollNo INT,
Name VARCHAR(50)
);
CREATE TABLE ELECTRICAL
(
RollNo INT,
Name VARCHAR(50)
);
INSERT INTO COMPUTER VALUES
(101,'Ajay'),
(102,'Haresh'),
(103,'Manish');

INSERT INTO ELECTRICAL VALUES
(105,'Ajay'),
(107,'Mahesh'),
(115,'Manish');
--1. Display name of students who is either in Computer or in Electrical. 
SELECT NAME FROM COMPUTER 
UNION
SELECT NAME FROM ELECTRICAL;
--2. Display name of students who is either in Computer or in Electrical including duplicate data. 
SELECT NAME FROM COMPUTER 
UNION ALL
SELECT NAME FROM ELECTRICAL;
--3. Display name of students who is in both Computer and Electrical. 
SELECT NAME FROM COMPUTER 
INTERSECT
SELECT NAME FROM ELECTRICAL;
--4. Display name of students who are in Computer but not in Electrical. 
SELECT NAME FROM COMPUTER 
EXCEPT
SELECT NAME FROM ELECTRICAL;
--5. Display name of students who are in Electrical but not in Computer. 
SELECT NAME FROM ELECTRICAL 
EXCEPT
SELECT NAME FROM COMPUTER;
--6. Display all the details of students who are either in Computer or in Electrical. 
SELECT * FROM COMPUTER 
UNION
SELECT * FROM ELECTRICAL;
--7. Display all the details of students who are in both Computer and Electrical. 
SELECT * FROM COMPUTER 
INTERSECT
SELECT * FROM ELECTRICAL;
--Part – B:
CREATE TABLE EMP_DATA(
EID INT,
NAME VARCHAR(10)
);
CREATE TABLE CUSTOMER(
CID INT,
NAME VARCHAR(10)
);
INSERT INTO EMP_DATA VALUES
(1,'Ajay'),
(9,'Haresh'),
(5,'Manish');
INSERT INTO CUSTOMER VALUES
(5,'Ajay'),
(7,'Mahesh'),
(5,'Manish');
--1. Display name of persons who is either Employee or Customer. 
SELECT NAME FROM EMP_DATA
UNION
SELECT NAME FROM CUSTOMER;
--2. Display name of persons who is either Employee or Customer including duplicate data. 
SELECT NAME FROM EMP_DATA
UNION ALL
SELECT NAME FROM CUSTOMER;
--3. Display name of persons who is both Employee as well as Customer. 
SELECT NAME FROM EMP_DATA
INTERSECT
SELECT NAME FROM CUSTOMER;
--4. Display name of persons who are Employee but not Customer. 
SELECT NAME FROM EMP_DATA
EXCEPT
SELECT NAME FROM CUSTOMER;
--5. Display name of persons who are Customer but not Employee. 
SELECT NAME FROM CUSTOMER
EXCEPT
SELECT NAME FROM EMP_DATA;
--Part – C:  
--1.0. Perform all the queries of Part-B but display ID and Name columns instead of Name only. 
--1.5. Display ALL of persons who is either Employee or Customer. 
SELECT * FROM EMP_DATA
UNION
SELECT * FROM CUSTOMER;
--2. Display ALL of persons who is either Employee or Customer including duplicate data. 
SELECT * FROM EMP_DATA
UNION ALL
SELECT * FROM CUSTOMER;
--3. Display ALL of persons who is both Employee as well as Customer. 
SELECT * FROM EMP_DATA
INTERSECT
SELECT * FROM CUSTOMER;
--4. Display ALL of persons who are Employee but not Customer. 
SELECT * FROM EMP_DATA
EXCEPT
SELECT * FROM CUSTOMER;
--5. Display ALL of persons who are Customer but not Employee. 
SELECT * FROM CUSTOMER
EXCEPT
SELECT * FROM EMP_DATA;