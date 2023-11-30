use Northwind;
go
create procedure expediteDelivery
(
    @sp_custID varchar(50)
)
as
begin    
        select CustomerID, OrderDate, ShippedDate, RequiredDate  from Orders where CustomerID = @sp_custID and DATEDIFF(day, OrderDate, ShippedDate) < 10
        Update Orders 
        set ShippedDate = DateAdd(Day, -7, ShippedDate) where CustomerID =  @sp_custID and (DATEDIFF(day, ShippedDate, RequiredDate) > 10)

        Update Orders 
        set Freight = Freight * 2
        where CustomerID =  @sp_custID and (DATEDIFF(day, ShippedDate, RequiredDate) > 10)
end