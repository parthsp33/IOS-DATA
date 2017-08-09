select * from customertbl
select * from producttbl
select * from ordertbl

select CustomerTbl.CName, ProductTbl.PName, orderTbl.QTY
from ordertbl
inner join ProductTbl on producttbl.pid = ordertbl.fkpid
inner join customertbl on customertbl.cid = ordertbl.fkcid

select CustomerTbl.CName, ProductTbl.PName, orderTbl.QTY
from ordertbl,ProductTbl , customertbl where
 producttbl.pid = ordertbl.fkpid and customertbl.cid = ordertbl.fkcid


select CustomerTbl.CName, ProductTbl.PName, orderTbl.QTY
from ordertbl
inner join ProductTbl on producttbl.pid = ordertbl.fkpid
inner join customertbl on customertbl.cid = ordertbl.fkcid

select ProductTbl.PName, SUM(OrderTbl.QTY) from ordertbl
inner join producttbl on producttbl.pid = ordertbl.fkpid
group by producttbl.pname


select CustomerTbl.CName, COUNT(ordertbl.fkcid) from ordertbl
inner join customertbl on customertbl.cid = ordertbl.fkcid
group by customertbl.cname having COUNT(ordertbl.fkcid) = 1


select * from customertbl where cid not in (select DISTINCT fkcid from ordertbl)

select * from producttbl order by pprice desc

select * from producttbl where pprice = (
select MAX(pprice) from producttbl 
where pprice != (select MAX(pprice) from producttbl))

select * from producttbl where pprice = (
select TOP 1 pprice from 
(select TOP 3 pprice from producttbl order by pprice desc) as TempTbl order by pprice)

select CustomerTbl.CName, SUM(producttbl.pprice * orderTbl.QTY)
from ordertbl
inner join ProductTbl on producttbl.pid = ordertbl.fkpid
inner join customertbl on customertbl.cid = ordertbl.fkcid
where customertbl.cname = 'brijesh'
group by customertbl.cname having SUM(producttbl.pprice * orderTbl.QTY) >= 200000