create or alter procedure sp_remove_order_details_by_product_id
(@productID int)
as
begin
	delete from [Order Details] where ProductID = @productID -- add delete statement to delete the order_details
end


go

declare remove_cursor_for_discontinued_product cursor
	for
	select ProductID from Products where Discontinued = 1

declare @productid int

open remove_cursor_for_discontinued_product;

fetch next from remove_cursor_for_discontinued_product
into @productid; --fetch into product id. 

while @@FETCH_STATUS = 0

begin
	 print @productid;

	-- create temp removal table here. #temp_order_removal
	-- insert certain orders based on product ids that needs to be
	-- removed from the order table 

	select Products.ProductID, orders.OrderID, count([Order Details].OrderID) as 'TEST' into #temp_order_removal from [Order Details]
	inner join Orders on [Order Details].OrderID = Orders.OrderID
	inner join Products on Products.productID = [Order Details].productID 
	where Discontinued = 1
	group by orders.OrderID, Products.ProductID
	having count([Order Details].orderid) = 1

	-- execute the stored procedure based on product id. 

	 execute sp_remove_order_details_by_product_id @productid

	-- delete from order table based on #temp_order_removal
	
	-- dont forget to drop or it will complain when the loop runs next time. 
	drop table #temp_order_removal 


	--fetch into product id again to continue the loop.
	fetch next from remove_cursor_for_discontinued_product
	into @productid; --fetch into product id. 

	
end;

close remove_cursor_for_discontinued_product
deallocate remove_cursor_for_discontinued_product


