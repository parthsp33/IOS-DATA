create database  FirstDATA
use FirstDATA
create table userinfo 
(
	id int primary key identity,
	fname varchar(10),
	lname varchar(20)

)
insert into userinfo values ('Parth','Prajapati'),('Banti','Prajapati'),('Jignesh','Patel'),('Jay','Vays')

sp_rename 'UserInfo','userinfo'

insert into userinfo values ('Rajesh','Gohil')


update  userinfo	set fname='Rajeshbhai' where id = 5
delete userinfo  where id = 3

-------------------------------------------------------
create table cus2
(
		cid int primary key identity ,
		cname varchar (10)	
)

insert into  cus2 values ('Parth'),('Banti'),('Jay'),('Rajeshbhai')

drop table  cus //Delete table 
------------------------------------------------------------
create table product
(
		pid int primary key identity,
		pname varchar (25),
		pprice  numeric
)


insert into product values ('DVD',5),('Pendrive',100),('OTG',50),('Headphone',300),('Leptopbag',200),('FlopyDisk',100)
------------------------------------------------------------
drop table ordertbl
create table ordertb
(
		oid int  primary key identity,
		ocid int references cus2(cid),
		opid int references product(pid),
		 qty int 
)
insert into ordertb values  (1,2,10),(2,3,10),(3,4,20),(1,3,10),(2,4,5),(4,4,20),(4,5,6)
--------------------------------------------------------------

select * from userinfo where lname like 'P%'
select * from userinfo where id=4
select id ,lname from userinfo where fname='Jay'

select * from product
select * from userinfo
select * from ordertb
select * from  cus2

select cus2.cname, product.pid, ordertb.qty  from
 ordertb
 inner join cus2 on cus2.cid = ordertb.ocid
 inner join product on product.pid =  ordertb.opid
 
select cus2.cname, product.pid, ordertb.qty  from
 ordertb
 inner join cus2 on cus2.cid = ordertb.ocid
 inner join product on product.pid =  ordertb.opid

 select cus2.cname ,product.pname,product.pprice ,ordertb.qty from 
ordertb
inner join cus2 on cus2.cid  = ordertb.ocid
inner join  product on product.pid = ordertb.opid

select product.pprice , SUM(ordertb.qty) from ordertb
inner join  product on product.pid = ordertb.opid 
group by product.pprice

select product.pname , SUM(ordertb.qty) from ordertb
inner join  product on product.pid = ordertb.opid 
group by product.pname

select cus2.cname ,COUNT( ordertb.ocid) from ordertb
inner join cus2 on cus2.cid = ordertb.ocid
group by cus2.cname

select cus2.cname ,COUNT( ordertb.ocid) from ordertb
inner join cus2 on cus2.cid = ordertb.ocid
group by cus2.cname having COUNT(ordertb.ocid)<=1


select * from product order by pprice
