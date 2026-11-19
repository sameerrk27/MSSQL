use adventureworks2012


-- Q.1]  Get all the details from the person table including email ID, phone number and phone number type
select  p1.*, 
p2.EmailAddress,
p3.PhoneNumber,
p4.Name as PhoneNumberTypeID
from Person.Person p1
LEFT JOIN Person.EmailAddress p2 
ON p1.BusinessEntityID = p2.BusinessEntityID -- Person.Person (p1) & Person.EmailAddress (p2)
LEFT JOIN Person.PersonPhone p3 
ON p1.BusinessEntityID =  p3.BusinessEntityID-- Person.EmailAddress (p2) & Person.PersonPhone (p3) 
LEFT JOIN Person.PhoneNumberType p4
ON p3.PhoneNumberTypeID = p4.PhoneNumberTypeID -- Person.PersonPhone (p3) & Person.PhoneNumberType (p4)

-------------------------------------------------------------------------------------------------------------------------

-- Q.2] Get the details of the sales header order made in May 2011
select * from Sales.SalesOrderHeader
where MONTH(OrderDate) = 5
and YEAR(OrderDate) = 2011;

-------------------------------------------------------------------------------------------------------------------------

-- Q.3] Get the details of the sales details order made in the month of May 2011
select 
    s1.*,
    s2.OrderDate
from Sales.SalesOrderDetail s1
inner join Sales.SalesOrderHeader s2
on s1.SalesOrderID = s2.SalesOrderID
where MONTH(s2.OrderDate) = 5
and YEAR(s2.OrderDate)= 2011;

-------------------------------------------------------------------------------------------------------------------------

-- Q.4] Get the total sales made in May 2011
select SUM(TotalDue) as total_sales
from Sales.SalesOrderHeader
where MONTH(OrderDate) = 5
and YEAR(OrderDate)= 2011;

-------------------------------------------------------------------------------------------------------------------------

-- Q.5] Get the total sales made in the year 2011 by month order by increasing sales
select  
MONTH(OrderDate) as order_month,
SUM(TotalDue) as total_sales
from Sales.SalesOrderHeader
where YEAR(OrderDate)= 2011 
group by MONTH(OrderDate)
order by total_sales asc;

-------------------------------------------------------------------------------------------------------------------------

-- Q.6] Get the total sales made to the customer with FirstName='Gustavo' and  LastName ='Achong'
select 
sum(h1.TotalDue) as total_sales
from 
Person.Person p1
INNER JOIN Sales.Customer c1
ON p1.BusinessEntityID = c1.PersonID
INNER JOIN Sales.SalesOrderHeader h1
ON  c1.CustomerID = h1.CustomerID
where p1.FirstName = 'Gustavo'
and p1.LastName = 'Achong';
