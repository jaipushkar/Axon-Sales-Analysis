use classicmodels;

select * from customers
limit 10;

-- Calculate total sales revenue:

select sum(quantityOrdered*priceEach) as TotalRevenue
from orderdetails;

-- Identify top-selling products:

select a.productCode,b.ProductName,sum(a.QuantityOrdered) as TotalQuantitySold
from orderdetails as a
inner join products as b on a.productCode = b.productCode
group by productCode
order by TotalQuantitySold desc
limit 10;

-- Analyze sales trends over time:

select date_format(OrderDate,'%Y-%m') as Month,SUM(quantityOrdered * PriceEach) as MonthlyRevenue
from Orders o
join OrderDetails od ON o.OrderNumber = od.OrderNumber
group by date_format(OrderDate,'%Y-%m')
order by Month;

-- Calculate average oder value:

select AVG(QuantityOrdered * PriceEach) as AverageOrderValue
from OrderDetails;

-- Customer Analysis:

-- Countthe number of customers:

select count(*) as TotalCustomers
from Customers;

-- Identify the top-spending customers:

select c.CustomerNumber, c.CustomerName, SUM(od.QuantityOrdered * od.PriceEach) as TotalSpent
from Customers c
join orders o ON c.CustomerNumber=o.CustomerNumber
join orderdetails od ON o.OrderNumber=od.OrderNUmber
group by c.customerNumber,c.customerName
order by TotalSpent Desc
Limit 10;

-- Product Analysis

-- Calculate total sales revenue by product line:

select pl.productLine, Sum(od.QuantityOrdered * od.PriceEach) as TotalRevenue
from Products p
join productlines pl ON p.productLine=pl.productLine
join orderdetails od on p.ProductCode=od.productCode
Group by pl.productLine
order by TotalRevenue Desc;

-- Determine the average order quantity by product:

Select p.ProductCode,p.ProductName, AVG(od.QuantityOrdered) AS AvgOrderQuantity
from Products p
join OrderDetails od ON p.ProductCode=od.ProductCode
Group By p.ProductCode,p.ProductName
Order By AvgOrderQuantity
Limit 20;


-- Sales Perfomance 

-- Calculate the total number of orders:

Select Count(*) AS TotalOrders
from Orders;

-- Payment Analysis:

-- Calculate total payments received:

Select SUM(Amount) AS TotalPayments 
From Payments;
