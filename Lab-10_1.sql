CREATE TABLE STUDENT_INFO(
RNO INT,
Name VARCHAR(10),
Branch VARCHAR(5),
SPI DECIMAL(3,2),
Bklog INT
);
INSERT INTO STUDENT_INFO VALUES
(101,'Raju','CE',8.80,0),
(102,'Amit','CE',2.20,3),
(103, 'Sanjay', 'ME' ,1.50 ,6),
(104, 'Neha', 'EC' ,7.65 ,1), 
(105, 'Meera' ,'EE' ,5.52 ,2),
(106, 'Mahesh', 'EC' ,4.50 ,3);
--Part-A:
--1. Create a view Personal with all columns. 
CREATE VIEW Personal 
AS 
SELECT * FROM STUDENT_INFO;
--2. Create a view Student_Details having columns Name, Branch & SPI.  
CREATE VIEW Student_Details
AS 
SELECT Name,Branch,SPI FROM STUDENT_INFO; 
--3. Create a view AcademicData having columns RNo, Name, Branch. 
CREATE VIEW AcademicData
AS 
SELECT RNo,Name,Branch FROM STUDENT_INFO; 
--4. Create a view Student_ bklog having all columns but students whose bklog more than 2. 
CREATE VIEW Student_bklog
AS 
SELECT RNo,Name,Branch FROM STUDENT_INFO
WHERE Bklog>2;
--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four 
--letters. 
CREATE VIEW Student_Pattern
AS 
SELECT RNo,Name,Branch FROM STUDENT_INFO
WHERE Name LIKE '____';
--6. Insert a new record to AcademicData view. (107, Meet, ME) 
INSERT INTO AcademicData VALUES
(107,'Meet','ME');
--7. Update the branch of Amit from CE to ME in Student_Details view. 
UPDATE Student_Details
SET Branch = 'ME'
WHERE Name='Amit';
--8. Delete a student whose roll number is 104 from AcademicData view. 
DELETE FROM AcademicData
WHERE RNO=104;
--9. Create view for the student whose name starts with M and ends with a, having SPI more than 6 and 
--backlog less than 2. 
CREATE VIEW Another_View
AS 
SELECT RNo,Name,Branch FROM STUDENT_INFO
WHERE Name LIKE 'M%a' AND SPI>6 AND Bklog<2;
--10. Create the view for the students whose name contains vowel.
CREATE VIEW Another_View2
AS 
SELECT RNo,Name,Branch FROM STUDENT_INFO
WHERE Name LIKE '%[AaEeIiOoUu]%';