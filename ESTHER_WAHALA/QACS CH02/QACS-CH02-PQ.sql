SHOW 
TABLES;
-- Question A Show all data in each of the tables.
SELECT * FROM CUSTOMER, ITEM, SALE, SALE_ITEM;

-- B. List the LastName, FirstName, and Phone of all customers.
SELECT LastName, FirstName,Phone FROM CUSTOMER;

-- C. List the LastName, FirstName, and Phone for all customers with a FirstName of ‘John’.
SELECT LastName, FirstName,Phone FROM CUSTOMER WHERE FirstName = 'John';

-- D. List the LastName, FirstName, Phone, SaleDate, and Total of all sales in excess of $100.00.
SELECT CUSTOMER.LastName, CUSTOMER.FirstName, CUSTOMER.Phone, SALE.SaleDate, SALE.Total
FROM CUSTOMER, SALE 
WHERE CUSTOMER.CustomerID = SALE.CustomerID
AND SALE.Total > 100.00;

-- E. List the LastName, FirstName, and Phone of all customers whose first name starts with ‘D’.
SELECT LastName, FirstName,Phone 
FROM CUSTOMER 
WHERE FirstName LIKE 'D%';

-- F. List the LastName, FirstName, and Phone of all customers whose last name includes the characters ‘ne’.
SELECT LastName, FirstName,Phone 
FROM CUSTOMER 
WHERE LastName LIKE '%ne%';

-- G. List the LastName, FirstName, and Phone for all customers whose eighth and ninth digits 
-- (starting from the left) of their phone number are 56. For example, a phone number
-- ending in “567” would meet the criteria.


-- H. Determine the maximum and minimum sales Total.
SELECT MAX(Total), MIN(Total) FROM SALE;

-- I.Determine the average sales Total.
SELECT AVG(total) FROM SALE;

-- J. Count the number of customers.
SELECT COUNT(CustomerID)
AS NumberOfCustomers
FROM CUSTOMER;

-- K. Group customers by LastName and then by FirstName.
SELECT LastName, FirstName , COUNT(*) as NumberOfCustomer
FROM CUSTOMER

-- L. Count the number of customers having each combination of LastName and FirstName.


-- M Show the LastName, FirstName, and Phone of all customers who have had an order
-- with Total greater than $100.00. Use a subquery. Present the results sorted by Last-
-- Name in ascending order and then FirstName in descending order.

SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID in (
		SELECT CustomerID 
        FROM SALE 
        WHERE Total > 100
)
ORDER BY LastName ASC, FirstName DESC;

-- N Show the LastName, FirstName, and Phone of all customers who have had an order
-- with Total greater than $100.00. Use a join, but do not use JOIN ON syntax. Present
-- results sorted by LastName in ascending order and then FirstName in descending order.
SELECT C.LastName, C.FirstName, C.Phone
FROM CUSTOMER As C, SALE as S
WHERE C.CustomerID = S.SaleID
and S.Total > 100
ORDER BY C.LastName asc,  C.FirstName desc;

-- O
SELECT C.FirstName, C.LastName , C.Phone
FROM CUSTOMER AS C 
JOIN SALE AS S ON C.CustomerID = S.SaleID
WHERE S.Total > 100
ORDER BY C.LastName asc, C.FirstName desc;

-- P
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID in (
	SELECT CustomerID
	FROM SALE
    WHERE SaleID IN (
		SELECT SaleItemID
        FROM SALE_ITEM
        where ItemID in (
			select ItemID 
            FROM ITEM
            WHERE ItemDescription = 'Desk Lamp'
        )
    )
)
ORDER BY LastName asc, FirstName desc;
describe ITEM;

-- Q
select LastName, FirstName, Phone
from CUSTOMER as C 
join SALE as S
join SALE_ITEM as SI
join ITEM as I
where C.CustomerID = S.CustomerID
and S.SaleID = SI.SaleID
and SI.ItemID = I.ItemID
and I.ItemDescription = 'Desk Lamp'
ORDER BY C.LastName asc, C.FirstName desc;

-- R
SELECT LastName, FirstName, Phone
from CUSTOMER as C 
Join SALE as S on C.CustomerID = S.SaleID
join SALE_ITEM as SI on S.SaleID = SI.SaleID
join ITEM as I on SI.ItemID = I.ItemID
where I.ItemDescription = 'Desk Lamp'
ORDER BY LastName asc, FirstName desc;

-- S
SELECT LastName, FirstName, Phone
FROM CUSTOMER as C 
JOIN SALE as S on C.CustomerID = S.CustomerID
WHERE S.SaleID in(
	SELECT SaleID
    FROM SALE_ITEM as SI
    join ITEM as I on  SI.ItemID = I.ItemID
    where ItemDescription = 'Desk Lamp'
)
ORDER BY LastName desc, FirstName asc;

-- T
SELECT LastName, FirstName, Phone
FROM CUSTOMER as C 
WHERE C.CustomerID in (
	SELECT S.CustomerID
    FROM SALE AS S
    join SALE_ITEM as SI on S.SaleID = SI.SaleID
    where SI.ItemID in (
		SELECT ItemID
        FROM ITEM 
        where ItemDescription = 'Desk Lamp'
    )
); 

-- U
SELECT C.LastName, C.FirstName, C.Phone, I.ItemDescription
FROM CUSTOMER AS C
LEFT JOIN SALE AS S ON C.CustomerID = S.CustomerID
LEFT JOIN SALE_ITEM AS SI ON S.SaleID = SI.SaleID
LEFT JOIN ITEM AS I ON SI.ItemID = I.ItemID AND I.ItemDescription = 'Desk Lamp'
ORDER BY I.ItemDescription ASC, C.LastName ASC, C.FirstName DESC;

-- V
SELECT 
    C1.LastName AS CustomerLastName, 
    C1.FirstName AS CustomerFirstName, 
    C2.LastName AS ReferredByLastName, 
    C2.FirstName AS ReferredByFirstName
FROM CUSTOMER AS C1
LEFT JOIN CUSTOMER AS C2 ON C1.ReferredBy = C2.CustomerID;