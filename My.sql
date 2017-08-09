create database FirstDB
use FirstDB

create table userinfo
(
	userid int primary key identity,
	fname varchar(50),
	lname varchar(50)
)
alter table userinfo add email varchar(50)
alter table userinfo drop column email

sp_rename 'NewTable','userinfo'

drop table userinfo
truncate table userinfo

insert into userinfo values('Brijesh','Patil')
insert into userinfo values('Dhavavcl123','P123atefdsl')
insert into userinfo values('Parth','dds')

update userinfo set fname='JAYRAJ123' where userid=3

delete from userinfo where userid=2




create table CustomerTbl
(
	CID int primary key identity,
	CName varchar(50)
)
insert into CustomerTbl values('JayRaj'),('Parth'),('Dhaval'),('Krishna')
,('Brijesh'),('Vipul'),('Krunal'),('Yogesh'),('Tejas'),('Kailash')

create table ProductTbl(
	PID int primary key identity,
	PName varchar(50),
	PPrice numeric
)

insert into ProductTbl values('Monitor',3500),('Mouse',450),('SMPS',480),('Keyboard',1250),('WebCam',6500),
('Printer',5500),('Mobile',2500),('Pendrive',3500)

create table OrderTbl
(
	OID int primary key identity,
	FkCID int references CustomerTbl(CID),
	FkPID int references ProductTbl(PID),
	QTY int
)

insert into OrderTbl values(1,1,10),(4,1,10),(9,2,10),(1,3,10),
(1,8,10),(5,6,10),(4,1,10),(7,6,10),(3,1,10)


select * from CustomerTbl
select * from CustomerTbl where CName='Brijesh'
select * from CustomerTbl where CID != 5

select * from CustomerTbl
select * from ProductTbl
select * from OrderTbl


select
CustomerTbl.CName, ProductTbl.PName,OrderTbl.QTY
from OrderTbl
inner join CustomerTbl on CustomerTbl.CID = OrderTbl.FkCID
inner join ProductTbl on ProductTbl.PID = OrderTbl.FkPID

select
CustomerTbl.CName,OrderTbl.QTY
from OrderTbl
right join CustomerTbl on CustomerTbl.CID = OrderTbl.FkCID

select
ProductTbl.PName, SUM(OrderTbl.QTY)
from OrderTbl
inner join ProductTbl on ProductTbl.PID = OrderTbl.FkPID
group by ProductTbl.PName

select
CustomerTbl.CName, COUNT(OrderTbl.FkCID)
from OrderTbl
inner join CustomerTbl on CustomerTbl.CID = OrderTbl.FkCID
group by CustomerTbl.CName having COUNT(OrderTbl.FkCID)>=2

select * from ProductTbl order by PPrice desc

select * from CustomerTbl where CName like 'd%'
select * from CustomerTbl where CName like '%h'
select * from CustomerTbl where CName like '%a%'
select * from CustomerTbl where CName like '_a%'

select * from CustomerTbl where CID not in (select DISTINCT FKCID from OrderTbl)
