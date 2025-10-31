/*For Comment Ctrl+k+c*/
--From the above given tables perform the following queries: 
--1. Retrieve all data from table DEPOSIT.
SELECT *
FROM DEPOSIT;
--2. Retrieve all data from table BORROW.  
SELECT *
FROM BORROW;
--3. Display Account No, Customer Name & Amount from DEPOSIT. 
SELECT ACTNO,CNAME,AMOUNT
FROM DEPOSIT;
--4. Display Loan No, Amount from BORROW. 
SELECT LOANNO,AMOUNT
FROM BORROW;
--5. Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table. 
SELECT *
FROM BORROW
WHERE BNAME='ANDHERI';
--6. Give account no and amount of depositor, whose account no is equals to 106 from deposit table.  
SELECT ACTNO,AMOUNT
FROM DEPOSIT
WHERE ACTNO=106;
--7. Give name of borrowers having amount greater than 5000 from borrow table.  
SELECT BNAME
FROM BORROW
WHERE AMOUNT>5000;
--8. Give name of customers who opened account after date '1-12-95' from deposit table.  
SELECT CNAME
FROM DEPOSIT
WHERE ADATE>'1995-10-01';
--9. Display name of customers whose account no is less than 105 from deposit table. 
SELECT CNAME
FROM  DEPOSIT
WHERE ACTNO<105;
--10. Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (USE OR & 
SELECT CNAME
FROM  CUSTOMERS
WHERE CITY IN ('NAGPUR','DELHI');
--IN) 
--11. Display name of customers with branch whose amount is greater than 4000 and account no is less than 
--105 from deposit table.
SELECT CNAME,BNAME
FROM DEPOSIT
WHERE AMOUNT>4000 AND ACTNO<105;
--12. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow 
--table. (USE AND & BETWEEN) 
SELECT CNAME
FROM BORROW
WHERE AMOUNT BETWEEN 3000 AND 8000;
--13. Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table. 
SELECT CNAME
FROM DEPOSIT
WHERE BNAME <> 'ANDHERI';
--14. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ 
--Or ‘M.G. ROAD’ and Account No is less than 104 from deposit table. 
SELECT ACTNO,CNAME,AMOUNT
FROM DEPOSIT
WHERE BNAME IN ('AJNI','KAROLBAGH','M.G. ROAD') AND ACTNO<104;
--15. Display all loan no, customer from borrow table does not belong to ‘VIRAR’ or ‘AJNI’ branch. (use NOT 
--IN) 
SELECT LOANNO,CNAME
FROM BORROW
WHERE BNAME NOT IN ('VIRAR','AJNI');
--16. Display all the customer’s name other than ‘MINU’ from deposit table (Use: NOT, <>, !=) 
SELECT CNAME
FROM DEPOSIT
WHERE CNAME != 'MINU';
--17. Display customer name from deposit table whose branch name is not available. (NULL) 
SELECT CNAME
FROM DEPOSIT
WHERE BNAME IS NULL;
--18. Retrieve all unique branches using DISTINCT. (Use Branch Table) 
SELECT DISTINCT BNAME
FROM BRANCH;
--19. Retrieve first 50% record from borrow table. 
SELECT TOP 50 PERCENT *
FROM BORROW;
--20. Retrieve first five account number from deposit table. 
SELECT TOP 5 ACTNO
FROM DEPOSIT; 
--Part – B: 
--1. Display all the details of first five customers from deposit table. 
SELECT TOP 5 *
FROM DEPOSIT;
--2. Display all the details of first three depositors from deposit table whose amount is greater than 1000. 
SELECT TOP 3 *
FROM DEPOSIT
WHERE AMOUNT>1000;
--3. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to 
--‘ANDHERI’ from borrow table. 
SELECT TOP 5 LOANNO,CNAME
FROM BORROW
WHERE NOT BNAME='ANDHERI';
--4. Select all details with account numbers not in the range 105 to 109 in deposit table. 
SELECT *
FROM DEPOSIT
WHERE ACTNO NOT BETWEEN 105 AND 109;
--5. Select all records from BORROW where the amount is greater than 1000 and less than or equal to 7000, 
--and the loan number is between 250 and 600 
SELECT *
FROM BORROW 
WHERE (AMOUNT>1000 AND AMOUNT<=7000) AND (LOANNO BETWEEN 250 AND 600);
--Part – C: 
--1. Display all the detail of customer who deposited more than 5000 without using * from deposit table. 
SELECT ACTNO,CNAME,BNAME,AMOUNT,ADATE
FROM DEPOSIT
WHERE AMOUNT>5000; 
--2. Retrieve all unique customer names with city. (Use Customer table) 
SELECT DISTINCT CNAME,CITY
FROM CUSTOMERS;
--3. Retrieve records from the BORROW table where the loan amount is greater than 3000 and the loan 
--number is not a multiple of 3. 
SELECT *
FROM BORROW
WHERE AMOUNT>3000 AND LOANNO%3!=0;
--4. Retrieve records from the DEPOSIT table where amount is greater than 2000 also account number is 
--between 100 and 110 and date is after '1-MAR-1995' or before '27-MAR-1996'. 
SELECT *
FROM DEPOSIT
WHERE (AMOUNT>2000) AND (ACTNO BETWEEN 100 AND 110) AND (ADATE>'1995-03-01' OR ADATE<'1996-03-27');
--5. Retrieve all odd/even value loan number from Borrow table. 
SELECT * --FOR ODD LOANNO
FROM BORROW
WHERE LOANNO%2!=0;