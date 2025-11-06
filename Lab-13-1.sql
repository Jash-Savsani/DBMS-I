--From the above given table perform the following queries:  
--Part – A: 
SELECT * FROM Book;
SELECT * FROM Author;
SELECT * FROM Publisher;
--1. List all books with their authors. 
SELECT Book.Title,Author.AuthorName
FROM Book
LEFT OUTER JOIN Author
ON Book.AuthorID = Author.AuthorID;
--2. List all books with their publishers. 
SELECT Book.Title,Publisher.PublisherName
FROM Book
LEFT OUTER JOIN Publisher
ON Book.PublisherID = Publisher.PublisherID;
--3. List all books with their authors and publishers. 
SELECT Author.AuthorName,Book.Title,Publisher.PublisherName
FROM Book
LEFT OUTER JOIN Author
ON Book.AuthorID = Author.AuthorID
LEFT OUTER JOIN Publisher
ON Publisher.PublisherID = Book.PublisherID;
--4. List all books published after 2010 with their authors and publisher and price. 
SELECT B.Title,B.Price,B.PublicationYear,A.AuthorName,P.PublisherName
FROM Book B
JOIN Author A
ON B.AuthorID=A.AuthorID
JOIN Publisher P
ON P.PublisherID = B.PublisherID
WHERE B.PublicationYear>2010;
--5. List all authors and the number of books they have written. 
SELECT A.AuthorName,COUNT(B.AuthorID) AS TOTAL_BOOKS
FROM Book B
JOIN Author A
ON B.AuthorID=A.AuthorID
GROUP BY A.AuthorName;
--6. List all publishers and the total price of books they have published. 
SELECT P.PublisherName,SUM(B.Price) AS TOTAL_Price
FROM Book B
JOIN Publisher P
ON B.PublisherID=P.PublisherID
GROUP BY P.PublisherName;
--7. List authors who have not written any books. 
SELECT A.AuthorName
FROM Book B
RIGHT OUTER JOIN Author A
ON B.AuthorID=A.AuthorID
WHERE B.AuthorID IS null;
--8. Display total number of Books and Average Price of every Author. 
SELECT A.AuthorName, COUNT(Book.BookID) as TOTAL_BOOKS , AVG(Book.Price) AS AVG_PRICE
FROM Book
JOIN Author A
ON Book.AuthorID=A.AuthorID
GROUP BY A.AuthorName;
--9. lists each publisher along with the total number of books they have published, sorted from highest to 
--lowest. 
SELECT P.PublisherName, COUNT(Book.BookID) as TOTAL_BOOKS
FROM Book
JOIN Publisher P
ON Book.PublisherID=P.PublisherID
GROUP BY P.PublisherName
ORDER BY COUNT(Book.BookID) DESC;
--10. Display number of books published each year. 
SELECT Book.PublicationYear, COUNT(Book.BookID) as TOTAL_BOOKS
FROM Book 
GROUP BY Book.PublicationYear;
--Part – B: 
--1. List the publishers whose total book prices exceed 500, ordered by the total price. 
SELECT P.PublisherName, SUM(Book.Price) as TOTAL_PRICE
FROM Book
JOIN Publisher P
ON Book.PublisherID=P.PublisherID
GROUP BY P.PublisherName
HAVING SUM(Book.Price)>500
ORDER BY SUM(Book.Price);
--2. List most expensive book for each author, sort it with the highest price. 
SELECT A.AuthorName,MAX(B.Price) AS Expensive_Price
FROM Book B
JOIN Author A
ON B.AuthorID=A.AuthorID
GROUP BY A.AuthorName
ORDER BY MAX(B.Price) DESC;
--Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 
--2. Insert 5 records in each table. 
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees. 