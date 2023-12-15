use MyCompany
insert into [dbo].[Department]([DeptName],[Location])
values

	('managment','NY'),
	('Human Resources','DS'),
	('Finance','KW');

insert into employee ([EmpFName],[EmpLName],[Departmentno],salary)
values

	('mOHAMED','AFETD 1',1,2000),
	('mOHAMED 2','AFETD 2 ',2,4000),
	('mOHAMED 3','AFETD 3',2,5000),
	('mOHAMED 4 ','AFETD 4 ',3,5000),
	('mOHAMED 5','AFETD 5 ',3,1000),
	('mOHAMED 6 ','AFETD 6',3,5000),
	('mOHAMED 7 ','AFETD 7',1,3000),
	('mOHAMED 8 ','AFETD 8 ',2,1000);

insert into Project(projectName,budget)
values
	('P7',6000),
		('P1',5000),	
		('P2',4000),	
		('P3',2000),	
		('P4',9000);


insert into works_on(EmpNo,projNo,Job,Enter_Date)
values
	
		(12,3,'manager','1.1.2008'),	
		(11,2,'clerk','1.2.2007'),	
		(10,2,NULL,'1.6.2009'),	
		(5,4,'clerk','12.12.2005'),
		(6,5,'analyst','12.9.2010'),
		(7,5,'manager','1.5.2006'),
		(8,4,null,'1.10.2006');



--2
select projectName , count (EmpNo) from Project 
inner join works_on 
on Project.projectNo =works_on.projNo
group by projectName


--3
select * from Department
where Department.DeptNo =(
select employee.Departmentno from employee
where employee.EmpNo=(
select min(employee.EmpNo)from employee
))

select Top 1  DeptNo , AVG(salary) as salarys from Department
join employee
on Department.DeptNo=employee.Departmentno
group by DeptNo 
order by salarys DESC

select Top 1  DeptNo , AVG(salary) as salarys from Department
join employee
on Department.DeptNo=employee.Departmentno
group by DeptNo 

--5
select employee.EmpNo ,employee.EmpLName from employee
left outer join works_on
on employee.EmpNo =works_on.EmpNo
where works_on.EmpNo is null and works_on.projNo is null
--6
select * from employee
where employee.Departmentno =(select DeptNo from Department
join employee
on Department.DeptNo=employee.Departmentno
group by DeptNo 
having AVG(salary) < (select AVG(employee.salary) from employee))

--7

select e.EmpFName,e.EmpLName,e.Departmentno from employee as e
join works_on 
on e.EmpNo = works_on.EmpNo
join Project 
on Project.projectNo = projNo
order by  Departmentno ,EmpLName ,EmpFName

--8
-- 
select top 2 salary from employee 
where employee.salary in (select  top 2  salary from employee
order by salary DESC)

--9
select top 2 EmpFName , EmpLName from employee 
where employee.salary in (select  top 2  salary from employee
order by salary DESC)

--10 

insert into employee ([EmpFName],[EmpLName],[Departmentno],salary)
values

	('Noha','Mohamed',1,3000);

insert into [dbo].[Department]([DeptName],[Location])
values

	('sabsab','NY');



update  employee
set Departmentno = 4 
where employee.EmpNo =14


--11
insert into employee ([EmpFName],[EmpLName],[Departmentno],salary)
values

	('Kamel ','Mohamed',4,5500);


select * from works_on
where EmpNo =15

delete employee
where employee.EmpFName = 'Kamel ' 

insert into Project(projectName,budget)
values
	('AlRabwah',60000);

insert into works_on(EmpNo,projNo,Job,Enter_Date)
values
	
		(14,6,'manager','1.1.2010');

-- 12
update employee 
SET salary = salary + (salary * 10/100)
where EmpNo = ( 
select works_on.EmpNo from works_on
where works_on.projNo = (
select Project.projectNo from Project
where projectName ='AlRabwah'))