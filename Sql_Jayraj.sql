/*
	Sql - Structured Query Language

	1:- DDL-Data Defination Language
		1- Create 
		2- Alter 
		3- Rename
		4- Describe
		5- Drop
		6- Truncate
	2:- DML-Data Manipulation Language
		1- Insert
		2- Update
		3- Delete
	3:- DQL-Data Query Language
		1- Select
	4:- DCL/TCL - Data/Transaction Control Language
		1- Commit
		2- Rollback
		3- Savepoint
		4- Rollback To Savepoint
*/

--DDl

create database MyFirstDB

use MyFirstDB


create table UserInfo
(
	UserId int primary key identity, 
	Fname varchar(50),
	Lname varchar(50)
);



alter table MyFirstTbl add Email varchar(50);
alter table MyFirstTbl Drop column Email ;

exec sp_rename 'MyFirstTbl','UserInfo';
exec sp_rename 'UserInfo','MyFirstTbl';

sp_help MyFirstTbl;


--DML

insert into UserInfo values('Jayraj','Vora');

insert into UserInfo(Fname) values('Brijesh');
insert into UserInfo(Lname) values('Patil');


update UserInfo set Lname = 'Patil' where Fname = 'Brijesh';

delete from UserInfo

select * from UserInfo 

create table ProductTbl
(
	PID int primary key identity,
	PName varchar(50), 
	PPrice numeric
)
insert into ProductTbl values('Mouse',350),('Printer',6500),('WebCam',8500),
('Keyboard',1250),('SMPS',450),('RAM8GB',7500)

create table CustomerTbl
(
	CID int primary key identity,
	CName varchar(50)
)
insert into CustomerTbl values('Brijesh'),('JayRaj'),('Krunal'),('Bhavesh'),('Khushal'),
('Hardik'),('Smit'),('Divyang')
create table OrderTbl
(
	OID int primary key identity,
	FkCID int references CustomerTbl(CID),
	FkPID int references ProductTbl(PID),
	QTY int
)
insert into OrderTbl values(1,5,10),(4,5,10),(8,5,10),(4,3,10),
(4,2,10),(8,1,10),(1,1,10),(3,2,10),(1,3,10),(4,1,10)


select * from CustomerTbl
select * from ProductTbl
select * from OrderTbl


select
CustomerTbl.CName, ProductTbl.PName, OrderTbl.QTY
from OrderTbl
inner join CustomerTbl on CustomerTbl.CID = OrderTbl.FkCID
inner join ProductTbl on ProductTbl.PID = OrderTbl.FkPID

select
CustomerTbl.CName, ProductTbl.PName, OrderTbl.QTY
from OrderTbl,CustomerTbl,ProductTbl
where OrderTbl.FkCID=CustomerTbl.CID and
OrderTbl.FkPID = ProductTbl.PID

select * from CustomerTbl order by CName desc
select * from CustomerTbl where CName like 'b%'
select * from CustomerTbl where CName like '%h'
select * from CustomerTbl where CName like '%a%'
select * from CustomerTbl where CName like '_r%'
-- % _ WildCard Characters

select
CustomerTbl.CName, COUNT(OrderTbl.fkcid)
from OrderTbl
inner join CustomerTbl on CustomerTbl.CID = OrderTbl.FkCID
group by CustomerTbl.CName

select
ProductTbl.PName, SUM( OrderTbl.QTY)
from OrderTbl
inner join ProductTbl on ProductTbl.PID = OrderTbl.FkPID
group by ProductTbl.PName

select
CustomerTbl.CName, COUNT(OrderTbl.fkcid)
from OrderTbl
inner join CustomerTbl on CustomerTbl.CID = OrderTbl.FkCID
group by CustomerTbl.CName having COUNT(OrderTbl.fkcid)>2

select * from CustomerTbl where CID not in (select DISTINCT FKCID from OrderTbl)

