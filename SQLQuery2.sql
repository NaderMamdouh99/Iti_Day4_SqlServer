use MyCompany
--------------1------------------------
create schema HR
alter schema HR transfer [dbo].[Employee]
---------------2-------------------------
sp_addtype CityUDD,'Nvarchar(10)'
---------------3-------------------------
sp_addtype Tel ,'Nvarchar(11)','not null'
---------------4--------------------------
create default City as 'Not Applied'
---------------5----------------------------
create rule r4 as @City IN('Assiut','Ismalia','Alex','Cairo','Mansoura');
---------------6-------------------------------
sp_bindrule r4 ,CityUDD
sp_bindefault City,CityUDD
-------------------7----------------------------
create table Student4 
(
	id int, 
	name varchar(50),
	City CityUDD
)
-------------------8---------------------------------
create sequence Id_Value3 start with 1 increment by 1
-------------------a----------------------------------
insert into Student4 
values (Next Value for Id_Value3,'Nader','Assiut')
insert into Student4 
values (Next Value for Id_Value3,'ali','Ismalia')
insert into Student4 
values (Next Value for Id_Value3,'hossam','Alex')
----------------------b-----------------------------------
delete from Student4
where id = 2
-----------------------c-------------------------------------
insert into Student4 
values (Next Value for Id_Value3,'mariam','Cairo')
insert into Student4 
values (Next Value for Id_Value3,'mohamed','Mansoura')
-----------------------d---------------------------------
insert into Student4 
values (7,'mohamed','Mansoura')

insert into Student4 
values ('mohamed','Mansoura')
No
----------------------e-----------------------------------
update Student4 
set id = 2
where id = 5
No 
----------------------f------------------------------
insert into [dbo].[Student1]
values (Next Value for Id_Value3,'ali','Assiut')
---------------------h----------------------------------
any error

-------------------9-----------------------------------
create synonym ST4 for [dbo].[Student4]
insert into ST4 
values (Next Value for Id_Value3,'manal','Assiut')	

