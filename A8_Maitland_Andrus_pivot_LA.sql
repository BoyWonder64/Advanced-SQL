use Northwind;

select * from orders;
select * from Customers;
select * from shippers;

select ShipVia, count(shipvia) as 'Counted' from customers 
inner join orders on Orders.CustomerID = Customers.CustomerID
group by ShipVia
order by shipVia


--this is my pivot base query
select ShipVia, count(shipvia) as 'Counted' from customers 
inner join orders on Orders.CustomerID = Customers.CustomerID

-- pivot example 1
select * from
(
	select ShipVia, CompanyName from Customers
	inner join orders on orders.CustomerID = customers.CustomerID

)
as shipViaTable
pivot
(
	count(companyName)
	for shipVia in([1],[2],[3])
)
as ShipViaPivotTable







--pivot example 2
-- how many customers are bneing served in each city by each shipper
select ShipVia,city, count(Customers.customerID) as NoOfCompanies
from Customers inner join orders on customers.CustomerID = orders.CustomerID
group by ShipVia, City
order by city

/* 
City      [1] [2] [3]
Aachen     1   3   3
Anchroage  3   2   5
*/

-- What is my base query
select ShipVia, City, Customers.CustomerID
from Customers inner join Orders on Customers.CustomerID = Orders.CustomerID

select * from 

(
	select ShipVia, City, Customers.CustomerID
	from Customers inner join Orders on Customers.CustomerID = Orders.CustomerID
)
as ShipViaTable
pivot 
(
	count(CustomerID)
	for ShipVia in ([1], [2], [3])

)
as ShipViaPivotTable
order by City


-- Pivot example 3
-- what is the average freight paid to each shiopper in each sity

select ShipCity, Shippers.CompanyName as ShipperName, AVG(Freight) as AvgFreight from Customers
inner join orders on Customers.CustomerID = orders.CustomerID
inner join shippers on shippers.ShipperID = orders.ShipVia
group by Shippers.CompanyName, ShipCity
order by ShipCity

-- What is my base query.
select ShipCity, Shippers.CompanyName as ShipperName, Freight from Customers
inner join orders on Customers.CustomerID = orders.CustomerID
inner join shippers on shippers.ShipperID = orders.ShipVia

-- writing my pivot
select * from
(
	select ShipCity, Shippers.CompanyName as ShipperName, Freight from Customers
	inner join orders on Customers.CustomerID = orders.CustomerID
	inner join shippers on shippers.ShipperID = orders.ShipVia

)
as ShipperIntermediateTable
pivot
(
	AVG(Freight)
	for ShipperName in  ([Federal Shipping],[Speedy Express],[United Package])
)
as ShipperPivotTable