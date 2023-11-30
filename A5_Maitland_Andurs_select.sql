 --Find the company name and contact name of all the customers who ordered products 
 --with the name "Chai" or "Chang" ordered by the company name in ascending order. (10 points)
 Use Northwind;

select * from customers
select * from orders
select * from [Order Details]
select * from products


select customers.CompanyName, customers.ContactName from customers
--Create Connections between IDs
inner join orders on customers.CustomerID = orders.CustomerID
inner join [Order Details] on [Order Details].OrderID = orders.OrderID
inner join products on products.ProductID = [Order Details].ProductID

where products.ProductName like 'Chai' or products.ProductName like 'Chang'
order by customers.CompanyName ASC

-- Completed!



--Find the country and number of customers per each country. (10 points)
select country, count(*) as 'CustNum' from customers
group by country

-- Completed!

--List countries that have more than five customers. (10 points)
select country, count(*) as 'CustNum' from customers
group by country
having count(*) > 5

-- Completed!

--List first name, last name, and the number of orders for each employee that are associated with more than 50 orders. (10 points)
select * from employees
select * from Orders
select * from [Order Details]
select employees.FirstName, employees.LastName, count(*) as 'Order Count' from Employees
inner join orders on orders.EmployeeID = employees.EmployeeID
group by employees.FirstName,employees.LastName
having count(*) > 50
-- Completed! 
/*
Verify Information
select EmployeeID, count(*) as 'Count' from orders
group by EmployeeID
*/


--List first name, last name, title, address, city, and zip code of all the employees who work in the western region order by the first name. (10 points)
select * from employees
select * from EmployeeTerritories
select * from Territories
select * from region
select Employees.FirstName, Employees.LastName, Employees.Title, Employees.Address, Employees.PostalCode from Employees
inner join EmployeeTerritories on EmployeeTerritories.EmployeeID = Employees.EmployeeID
inner join Territories on Territories.TerritoryID = EmployeeTerritories.TerritoryID
inner join region on region.RegionID = Territories.RegionID
where Region.RegionID = 2
group by Employees.FirstName, Employees.LastName, Employees.Title, Employees.Address, Employees.PostalCode

-- Completed!


--List unique product names of all the products who are part of orders that were served 
--by the employee whose last name starts with L and also served by the shipping company Federal Shipping. (10 points)
select * from products
select * from [Order Details]
select * from orders
select * from employees
select * from shippers

select Products.ProductName from Products
inner join [Order Details] on [Order Details].ProductID = Products.ProductID
inner join orders on orders.orderID = [Order Details].orderID
inner join shippers on shippers.ShipperID = orders.shipVia
inner join Employees on Employees.EmployeeID = orders.EmployeeID
where shippers.ShipperID = 3 and Employees.LastName like 'L%' 

-- Completed!

--List product name and supplier company name of all the products of category type Beverages.  (10 points)
select * from products
select * from Categories
select * from suppliers
select products.productName, suppliers.companyName from products
inner join suppliers on Suppliers.SupplierID = Products.SupplierID
inner join Categories on Categories.CategoryID = products.CategoryID
where Categories.CategoryID = 1

-- Completed!

--List last name and first name of all the employees supervised by Vice President Sales, sorted by the last name of the employee. (10 points)
select * from Employees

select LastName, FirstName, Title from Employees
where ReportsTo = 2
order by LastName
-- Completed!
