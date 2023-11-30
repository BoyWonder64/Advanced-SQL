use Northwind;
go
create procedure expediteDelivery
(
    @sp_orderID int
)
as
begin    
        select CustomerID, OrderDate, ShippedDate, RequiredDate  from Orders where OrderID =  @sp_orderID and DATEDIFF(day, OrderDate, ShippedDate) < 10
        Update Orders 
        set ShippedDate = DateAdd(Day, -7, ShippedDate) where CustomerID =   @sp_orderID and (DATEDIFF(day, ShippedDate, RequiredDate) > 10)

        Update Orders 
        set Freight = Freight * 2
        where OrderID =   @sp_orderID and (DATEDIFF(day, ShippedDate, RequiredDate) > 10)
end