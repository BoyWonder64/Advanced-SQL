go
use Northwind;
go
create procedure sp_calcDiscounts
(
    @category varchar(50)
)
as
begin

    declare @totalOrder as int
    declare @unitPrice as int
    declare @quantity as int

    select * from [Order Details]

    where [Order Details].UnitPrice = @unitPrice and [Order Details].Quantity = @quantity
 

        update [Order Details] set Discount = Discount + .05 from [Order Details]
		inner join Products on Products.ProductID = [Order Details].ProductID 
		inner join Categories on Categories.CategoryID = Products.CategoryID
		where Categories.CategoryName = @category and [Order Details].unitPrice * [Order Details].quantity < 50

        update [Order Details] set Discount =  Discount + .10 from [Order Details]
		inner join Products on Products.ProductID = [Order Details].ProductID 
		inner join Categories on Categories.CategoryID = Products.CategoryID
		where Categories.CategoryName = @category and  [Order Details].unitPrice * [Order Details].quantity >= 50 
													or [Order Details].unitPrice * [Order Details].quantity < 100
        update [Order Details] set Discount = Discount + .15 from [Order Details]
		inner join Products on Products.ProductID = [Order Details].ProductID 
		inner join Categories on Categories.CategoryID = Products.CategoryID
		where Categories.CategoryName = @category  and [Order Details].unitPrice * [Order Details].quantity > 100
   
end -- end of procedure
