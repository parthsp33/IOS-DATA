create database mysql
use mysql
create table tblproduct (ProductID int primary key  identity,Productname varchar(20) ,RecommendedPrice numeric
(10),  category varchar(10) )
create table tblCustomers (CustomerID int primary key identity,Firstname varchar(20), lastname varchar(20), city varchar(20), state varchar(20), zip numeric(6) )
create table sales (salesid int  primary key identity ,
					pid int  references tblproduct(ProductId),
					cid int references tblCustomers(CustomerID),
					salesprice money ,
					salesdate date) 

insert into tblproduct values ('DVD',105,'LivingRoom'),('Microwave',98,'Kitchen'),('Monitor',200,'Office'),('Speakers',85,'Office'),('Refrigerator',900,'Kitchen'),('VCR',165,'LivingRoom'),('CoffeePot',35,'Kitchen')
insert into tblCustomers values ('Parth','Prajapati','Ahmedabad','Gj',382415),('Banti','Prajapati','Ahmedabad','Gj',382415),('Jayraj ','vora','Ahmedabad','Gj',382000),('Brijesh','Patil','Mumbai','Mh',400005),('Pogo','Navadiya','Surat','Gj',385415),('Mona','Karmakar','Pune','MP',500055)
insert into sales values (1,1,130.00,2004-02-09),(2,2,150.00,2004-09-09),(3,3,850.00,2012-08-09),(4,4,110.00,2012-08-01),(5,5,566.00,2009-02-06),(6,6,888.00,2015-02-05)


select  tblCustomers.Firstname,tblCustomers.lastname,tblproduct.Productname,sales.salesprice from sales 
inner join  tblCustomers on tblCustomers.CustomerID = sales.cid
inner join tblproduct on tblproduct.ProductID = sales.pid
where salesdate between '1994-02-01' AND '1994-02-28'

select Firstname, lastname,CustomerID from tblCustomers
where CustomerID Not In (
select distinct CustomerID from sales   
) 


select  tblCustomers.Firstname,tblCustomers.lastname,tblproduct.Productname,sales.salesprice from sales 
inner join  tblCustomers on tblCustomers.CustomerID = sales.cid
inner join tblproduct on tblproduct.ProductID = sales.pid
