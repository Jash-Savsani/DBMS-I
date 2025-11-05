select * from personn;
select * from dept;
--Part – A: 
--1. Combine information from Person and Department table using cross join or Cartesian product. 
SELECT * 
FROM DEPT 
CROSS JOIN PERSONN;
--2. Find all persons with their department name 
SELECT PERSONN.PersonName , DEPT.DepartmentName
FROM Personn
INNER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId;
--3. Find all persons with their department name & code. 
SELECT PERSONN.PersonName , DEPT.DepartmentName
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId;
--4. Find all persons with their department code and location. 
SELECT PERSONN.PersonName , DEPT.DepartmentCode,DEPT.Location
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId;
--5. Find the detail of the person who belongs to Mechanical department. 
SELECT PERSONN.PersonName , DEPT.DepartmentName
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
WHERE DEPT.DepartmentName='Mechanical';
--6. Final person’s name, department code and salary who lives in Ahmedabad city.  
SELECT PERSONN.PersonName , DEPT.DepartmentCode,Personn.Salary
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
WHERE Personn.City='Ahmedabad';
--7. Find the person's name whose department is in C-Block. 
SELECT PERSONN.PersonName
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
WHERE DEPT.Location='C-Block';
--8. Retrieve person name, salary & department name who belongs to Jamnagar city. 
SELECT PERSONN.PersonName,Personn.Salary,DEPT.DepartmentName
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
WHERE Personn.City='Jamnagar';
--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 
SELECT *
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
WHERE Personn.JoiningDate>'2001-08-01';
--10. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 
SELECT PERSONN.PersonName,DEPT.DepartmentName
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
WHERE DATEDIFF(DAY,PERSONN.Joiningdate,GETDATE()) > 365;
--11. Find department wise person counts. 
SELECT DEPT.DepartmentName,COUNT(PERSONN.PersonID) AS COUNT
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
GROUP BY DEPT.DepartmentName;
--12. Give department wise maximum & minimum salary with department name. 
SELECT DEPT.DepartmentName,MAX(PERSONN.Salary) AS MAX_SALARY , MIN(PERSONN.Salary) AS MIN_SALARY
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
GROUP BY DEPT.DepartmentName;
--13. Find city wise total, average, maximum and minimum salary. 
SELECT Personn.City,MAX(PERSONN.Salary) AS MAX_SALARY , MIN(PERSONN.Salary) AS MIN_SALARY,AVG(PERSONN.Salary) AS AVG_SALARY 
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
GROUP BY Personn.City;
--14. Find the average salary of a person who belongs to Ahmedabad city. 
SELECT Personn.PersonName,AVG(PERSONN.Salary) AS AVG_SALARY 
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
WHERE Personn.City='Ahmedabad'
GROUP BY Personn.PersonName;
--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column) 
SELECT Personn.PersonName + ' lives in '+Personn.City+' and works in '+DEPT.DepartmentName+' Department.' 
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId;
--Part – B: 
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 
SELECT Personn.PersonName +' earns '+ CAST(Personn.Salary AS VARCHAR) + ' from '+DEPT.DepartmentName+' department monthly.'
FROM Personn
JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId;
--2. Find city & department wise total, average & maximum salaries.
SELECT Personn.City,DEPT.DepartmentName,SUM(Personn.Salary) AS TOTAL_SAL, AVG(Personn.Salary) AS AVG_SAL, MAX(Personn.Salary) AS MAX_SAL
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
GROUP BY Personn.City,DEPT.DepartmentName; 
--3. Find all persons who do not belong to any department. 
SELECT Personn.PersonName
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
WHERE DEPT.DepartmentName IS NULL; 
--4. Find all departments whose total salary is exceeding 100000. 
SELECT DEPT.DepartmentName , SUM(Personn.Salary) AS TOTAL_SAL
FROM Personn
INNER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
GROUP BY DEPT.DepartmentName
HAVING SUM(Personn.Salary)>100000; 
--Part – C: 
--1. List all departments who have no person. 
SELECT DEPT.DepartmentId,COUNT(Personn.PersonID) AS COUNT_STU
FROM Personn
FULL OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
GROUP BY DEPT.DepartmentId
HAVING COUNT(Personn.PersonID)=0;
--2. List out department names in which more than two persons are working. 
SELECT DEPT.DepartmentName,COUNT(Personn.PersonID) AS COUNT_STU
FROM Personn
FULL OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
GROUP BY DEPT.DepartmentName
HAVING COUNT(Personn.PersonID)>2;
--3. Give a 10% increment in the computer department employee’s salary. (Use Update) 
UPDATE Personn
SET Personn.Salary = Personn.Salary + 0.10*(Personn.Salary)
FROM Personn
LEFT OUTER JOIN DEPT
ON Personn.DepartmentID = DEPT.DepartmentId
WHERE DEPT.DepartmentName = 'Computer';