use pgas
create table sesion_role (
role_id int primary key identity(1, 1),
role_name varchar(100) not null, 
role_description varchar(255) not null );

create table sesion_user ( 
user_id int primary key identity (1, 1), 
user_name varchar(100) not null, 
password varchar(100) not null, 
role_id int foreign key references sesion_role(role_id) );

create table Departements ( 
departement_id int primary key identity(1,1), 
departement_name varchar(100) not null)

create table Employees ( 
employee_id int primary key identity(1,1), 
employee_name varchar(100) not null, 
departement_id int, 
foreign key (departement_id) references Departements(departement_id))

create table Spendings( 
spending_id int primary key identity(1,1), 
employee_id int, 
spending_date date not null, 
value decimal(10,2) not null, 
foreign key (employee_id) references Employees(employee_id)); 

select * from sesion_user

insert into sesion_role (role_name, role_description) values ('A', 'Admin'), ('U', 'User');

--hapus data dan drop table
truncate table Employees
drop table Employees
drop table Departements
drop table Spendings


select * from sesion_role
select * from sesion_user
select * from Departements
select * from Employees
select * from Spendings

--show spanding value terkecil > terbesar
select e.employee_name, d.departement_name, s.spending_date, s.value
from Employees e
join Departements d on e.departement_id = d.departement_id
join Spendings s on e.employee_id = s.employee_id
where year(s.spending_date) between 2020 and 2025
and month(s.spending_date) between 1 and 12
and s.value > 1000
order by s.value asc

--laporan spanding
select e.employee_name, d.departement_name, s.spending_date, s.value
from Employees e
join Departements d on e.departement_id = d.departement_id
join Spendings s on e.employee_id = s.employee_id
where year(s.spending_date) between 2020 and 2025
and month(s.spending_date) between 1 and 12
and s.value > 1000
order by s.value asc

--create table data_gabungan
select 
    e.employee_name,
    d.departement_name,
    s.spending_date,
    s.value
into data_gabungan
from Departements d
inner join Employees e
    on d.departement_id = e.departement_id
inner join Spendings s
    on e.employee_id = s.employee_id
select * from data_gabungan

    