Use Northwind;
-- 1
INSERT INTO Products ( ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES ('Fortnite', 1, 2, 'a lot', 10, 11, 12, 50, 'False'),
    ( 'DogToy', 3, 4, 'even more', 22, 11, 33, 70, 'True');

select * from products
select * from [Order Details]
select * from Orders

INSERT INTO Orders VALUES (NULL, 3, NULL, NULL, NULL, 1, 33.5 ,'Dogo', '123 Main Str', 'Orem', NULL, 86096, 'France');
INSERT INTO Orders VALUES (NULL, 3, NULL, NULL, NULL, 1, 33.5 ,'OtherDogo', '123 Main Str', 'Orem', NULL, 86096, 'France');

INSERT INTO [Order Details] VALUES (11078, 78, 20, 4, 0)
INSERT INTO [Order Details] VALUES (11078, 79, 30, 4, 0)

select * from products
-- 2
UPDATE[Order Details]
SET Discount = Discount + .10
WHERE UnitPrice > 20

select * from ORDERS
-- 3
DELETE FROM orders WHERE OrderID = 11079
DELETE FROM orders WHERE OrderID = 11080
DELETE FROM Products WHERE ProductID = 78
DELETE FROM Products WHERE ProductID = 79


select * from ORDERS
select * from products

--4
UPDATE Territories
SET RegionID = 2
WHERE RegionID = 1