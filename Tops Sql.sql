CREATE DATABASE Practice
USE Practice

CREATE TABLE tblProducts(tID                INT PRIMARY KEY IDENTITY,
                         ProductName        VARCHAR(20),
                         RecommendedPrice    MONEY,
                         Category            VARCHAR(10))
                         
CREATE TABLE tblCustomers(CustomerID        INT PRIMARY KEY IDENTITY,
                          FirstName            VARCHAR(50),
                          LastName            VARCHAR(50),
                          City                VARCHAR(50),
                          State                CHAR(2),
                          Zip                VARCHAR(10))
                          
CREATE TABLE tblSales(SalesID                INT PRIMARY KEY IDENTITY,
                      ProductID                INT REFERENCES tblProducts(tID),
                      CustomerID            INT REFERENCES tblCustomers(CustomerID),
                      SalesPrice            MONEY,
                      SalesDate                SMALLDATETIME
					  
					  )
INSERT INTO tblProducts(ProductName,RecommendedPrice,Category) VALUES('DVD',105.00 ,'LivingRoom' )
INSERT INTO tblProducts(ProductName,RecommendedPrice,Category) VALUES('MICROWAVE',98.00 ,'Kitchen' )
INSERT INTO tblProducts(ProductName,RecommendedPrice,Category) VALUES('MONITOR',200.00 ,'Office' )
INSERT INTO tblProducts(ProductName,RecommendedPrice,Category) VALUES('Speakers',85.00 ,'Office' )
INSERT INTO tblProducts(ProductName,RecommendedPrice,Category) VALUES('Refrigerator',900.00 ,'Kitchen' )                  
INSERT INTO tblProducts(ProductName,RecommendedPrice,Category) VALUES('VCR',165.00 ,'LivingRoom' )
INSERT INTO tblProducts(ProductName,RecommendedPrice,Category) VALUES('CoffeePot',35.00 ,'Kitchen' )            

INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Chintan', 'Patel','Anand','GJ' ,'388001')
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Paresh', 'Prajapati','Nadiad','GJ','387001' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Pragnesh', 'Patel','Surat','GJ','395008' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Nilesh', 'Dharsandia','Mumbai','MH','400002' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Sonal', 'Patel','Mumbai','MH','400002' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Harshal', 'Patel','Mogri','GJ','388345' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Prakash', 'Rathod','Mogri','GJ','388345' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Aarzoo', 'Dodhiya','Rajkot','GJ','360003' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Heta', 'Dave','Varanasi','UP','221002' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Nikita', 'Dave','Varanasi','UP','221002' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Vaibhav', 'Dave','Varanasi','UP','221002' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Paresh', 'Patel','Pune','MH' ,'411001')
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Prakash', 'Patel','Pune','MH','411001' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Sandhya', 'Patel','Hyedrabad','AP','500031' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Divesh', 'Patel','Hyedrabad','KA','560002' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Payal', 'Shah','Banglore','KA','560002' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Priyanka', 'Rana','Banglore','GJ','388121' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Sanket', 'Dhebar','Anand','GJ','388121' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Puja', 'Shah','V.V.Nagar','UP','388122' )
INSERT INTO tblCustomers(FirstName,LastName,City,State,Zip) VALUES('Priya', 'Shah','Varanasi','UP','221002' )

INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(1,1,130.00,'2005-06-14')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(2,2,97.00,'2005-06-19')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(3,3,200.00,'2005-09-20')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(4,4,80.00,'2005-03-22')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(5,5,899.00,'2005-01-23')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(6,6,150.00,'2005-03-24')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(3,7,209.00,'2005-03-10')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(4,8,90.00, '2005-08-11')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(6,9,130.00, '2005-08-12')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(2,14,85.00, '2005-12-13')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(3,15,240.00, '2005-05-14')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(1,17,87.00, '2005-07-19')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(2,18,99.00, '2005-09-20')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(6,19,150.00, '2005-07-22')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(5,5,900.00, '2005-03-06')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(4,6,86.00, '2005-04-07')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(2,7,88.00, '2005-11-08')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(3,8,198.00, '2005-05-09')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(1,9,150.00, '2005-10-10')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(6,14,99.00, '2005-09-09')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(6,15,104.00, '2005-09-20')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(4,14,90.00, '2005-07-22')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(1,1,130.00,'2005-03-06')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(2,2,102.00, '2005-04-07')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(1,3,114.00, '2005-11-08')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(5,4,1000.00, '2005-05-09')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(5,5,1100.00, '2005-10-10')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(3,6,285.00, '2005-06-11')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(2,7,87.00, '2005-10-12')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(3,8,300.00, '2005-07-13')
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(3,20,205.00, '2005-12-31')



SELECT * FROM tblProducts
SELECT * FROM tblCustomers
SELECT * FROM tblSales



SELECT  tblCustomers.FirstName, 
        tblCustomers.LastName, 
        tblProducts.ProductName, 
        SalesPrice
FROM tblSales
 INNER JOIN tblProducts ON tblProducts.tID= tblSales.ProductID 
INNER JOIN tblCustomers  ON tblCustomers.CustomerID =tblSales.CustomerID
WHERE SalesDate BETWEEN '2005-10-01' AND '2005-10-31'

SELECT CustomerID,FirstName,LastName  
FROM tblCustomers 
WHERE CustomerID not in (
select distinct CustomerID from tblSales
)


SELECT tblCustomers.FirstName,tblCustomers.LastName,tblSales.SalesPrice,abs(SalesPrice-RecommendedPrice) as diff 
FROM tblSales 
inner join tblCustomers ON tblCustomers.CustomerID =tblSales.SalesID
inner join tblProducts on tblProducts.tID = tblSales.ProductID
 
 
 select tblProducts.Category, AVG(tblSales.SalesPrice) as total
 from tblSales
 inner join tblProducts on tblProducts.tID = tblSales.ProductID group by Category 
 
 
 select tblProducts.Category, SUM(tblSales.SalesPrice) as Total
 from tblSales
 inner join tblProducts on tblProducts.tID = tblSales.ProductID group by Category 
 



select  distinct   tblCustomers.FirstName,tblCustomers.LastName,tblProducts.Category, COUNT(*) as' total product' ,AVG(tblSales.SalesPrice) As AVGE 
from tblSales
 inner join tblCustomers ON tblCustomers.CustomerID =tblSales.CustomerID
 inner join tblProducts ON tblProducts.tID = tblSales.ProductID
group by Category,FirstName,LastName
HAVING COUNT(*)>=2


UPDATE tblSales SET SalesPrice= RecommendedPrice 
FROM tblSales
INNER JOIN tblProducts ON tblSales.ProductID = tblProducts.tID
WHERE SalesDate BETWEEN '2005-06-10' AND '2005-06-20'


SELECT Category,COUNT(SalesID) 
FROM tblProducts INNER JOIN tblSales ON tID=ProductID
GROUP BY category
HAVING AVG(RecommendedPrice) >= 10 AND AVG(RecommendedPrice)>AVG(SalesPrice)



SELECT distinct FirstName,LastName,ProductName, COUNT(*) as 'Total'
FROM tblCustomers
INNER JOIN tblSales ON tblCustomers.CustomerID=tblSales.ProductID
INNER JOIN tblProducts ON tblProducts.tID = tblCustomers.CustomerID
GROUP BY FirstName,LastName,ProductName



create procedure AddNewCustomer
@FName varchar(50),
@LName varchar(50),
@City varchar(50),
@State char(2),
@Zip varchar(10)
as
insert into tblCustomers values(@FName,@LName,@City,@State,@Zip)
exec AddNewCustomer 'Brijesh','Patil','Ahmedabad','GJ','380050'



select tblProducts.ProductName, count(tblSales.ProductID) from tblSales
inner join tblProducts on tblProducts.tID = tblSales.ProductID 
group by tblProducts.ProductName having AVG(tblProducts.RecommendedPrice)<=10 or AVG(tblSales.SalesPrice) >= 10

select * from tblProducts
select * from tblSales