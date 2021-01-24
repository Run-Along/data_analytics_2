DROP TABLE if exists Loyal_Customers;
CREATE TABLE Loyal_Customers (
    CustomerID int,
    CustomerName varchar(255),
    Address varchar(255),
    City varchar(255),
    PostalCode int,
	Country varchar(255),
	Email varchar(255)
);

select * from Loyal_Customers

Insert into Loyal_Customers
values(1, 'Nancy Gray', '2020 Made Up Drive', 'Wrexham', 117, 'United Kingdom', 'nancydorian@gmail.com');
Insert into Loyal_Customers
values(2, 'Gary Lane', '169 Maple Drive', 'Royal', 09, 'Saudi Arabia', 'garythelaneman@hotmail.com');
Insert into Loyal_Customers
values(3, 'Rusty Shackleford', '1309 Dunder Hill', 'Lansebro', 117, 'Ghana', '545shackleru@gmail.com');

UPDATE Loyal_Customers
SET postalcode = 156, City= 'Frankfurt'
WHERE CustomerID = 3;

Insert into Loyal_Customers
values(4, 'Gia Cruz', '56 Halodro Street', 'Taribo', 96, 'New Zealand', 'giacruz@gmail.com');

DELETE FROM Loyal_Customers WHERE customerid=4;