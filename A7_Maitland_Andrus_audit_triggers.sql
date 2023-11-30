-- 3.1

go
use Northwind
create table [Order Details Audit Trail] (
    OrderID int,
    ProductID int,
    [User] varchar(50),
    TimeStamp datetime,
    OldUnitPrice money,
    NewUnitPrice money
);
go
use Northwind;
go

create trigger OrderDetails_Update on [Order Details]
after update
as
begin
    insert into [Order Details Audit Trail] (OrderID, ProductID, [User], TimeStamp, OldUnitPrice, NewUnitPrice)
    select inserted.OrderID, inserted.ProductID, 'Maitland', GETDATE(), deleted.UnitPrice, inserted.UnitPrice
    from inserted 
    inner join deleted on inserted.OrderID = deleted.OrderID AND inserted.ProductID = deleted.ProductID
    where inserted.UnitPrice <> inserted.UnitPrice;
end;


go

update [Order Details] set UnitPrice = 14.00 where OrderID = 10248 

select * from [Order Details Audit Trail]


go
