--1.1 

select * from [Product Sales for 1997]
inner join  [Order Details Extended] on  [Order Details Extended].ProductName = [Product Sales for 1997].ProductName
inner join Invoices on Invoices.OrderID = [Order Details Extended].OrderID
where [Order Details Extended].Discount = 0 and Invoices.ShippedDate between '1997-01-01' and '1997-03-31'
order by CategoryName


-- 2.1 a)

create view [Order Details Extended Above Average] as
select  [Order Details].OrderID, 
	   [Order Details].ProductID, 
	   Products.ProductName, 
	   [Order Details].UnitPrice, 
	   [Order Details].Quantity, 
	   [Order Details].Discount,
    convert(money, ([Order Details].Quantity * [Order Details].UnitPrice) * (1 - [Order Details].Discount) / 100) * 100 
		as ExtendedPrice
from [Order Details] 

inner join Products on [Order Details].ProductID = Products.ProductID

where convert(money, ([Order Details].Quantity * [Order Details].UnitPrice) * (1 - [Order Details].Discount) / 100) * 100 >
    (select avg(convert(money, (UnitPrice * Quantity) * (1 - Discount) / 100) * 100) from [Order Details]);

-- 2.1 b)
select * from [Order Details Extended Above Average]