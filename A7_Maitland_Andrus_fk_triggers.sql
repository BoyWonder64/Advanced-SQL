-- 3.2 a) 
create trigger fk_order_customers_on_update_no_action on orders
after update
as
if update(CustomerID)
begin 
	if(select count(*) from Customers
	inner join deleted on Customers.CustomerID = deleted.CustomerID) > 0
	begin
		print 'Rollback Transaction. No Rows changed :).';
		rollback transaction
	end 
	else
		print 'Transaction is sucessful.Rows changed.' 
end;

select * from Orders
update Orders set CustomerID = 'PIZZA' where OrderID = 10248

go
-- 3.2 b)
create trigger fk_orders_customers_on_update_cascade on orders
after update
as
if update(CustomerID)
begin
	if(select count(*) from Customers
	inner join inserted on Customers.CustomerID = inserted.CustomerID) = 0
	begin
		print 'Rollback Transaction. No Rows changed :).';
		rollback transaction
	end 
	else
		print 'Transaction is sucessful.Rows changed.' 
end;

update Orders set CustomerID = 'PIZZA' where OrderID = 10248


go
-- 3.2 c) 
create trigger fk_orders_shippers_on_update_no_action on orders
after update
as
if update(CustomerID)
begin 
	if(select count(*) from Customers
	inner join deleted on Customers.CustomerID = deleted.CustomerID) > 0
	begin
		print 'Rollback Transaction. No Rows changed :).';
		rollback transaction
	end 
	else
		print 'Transaction is sucessful.Rows changed.' 
end;



go
-- 3.2 d)
create trigger fk_orders_shippers_on_update_cascade on orders
after update
as
if update(ShipVia)
begin
	if(select count(*) from shippers
	inner join inserted on shippers.ShipperID = inserted.ShipVia) = 0
	begin
		print 'Rollback Transaction. No Rows changed :).';
		rollback transaction
	end 
	else
		print 'Transaction is sucessful.Rows changed.' 
end;






