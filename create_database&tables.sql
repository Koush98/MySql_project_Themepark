/*create a database named ABCSolutions*/

create database ABCSolutions;
show databases;
use ABCSolutions;

/* WAQ to Create a simple table named countries including columns country_id,country_name and regionid*/
create table countries(
country_id varchar(4),
country_name varchar(50),
regionid decimal(12,0));
show tables;

/*WAQ to Create a simple table countries including country_id, country_name, regionid which is already exixts*/
create table if not exists countries(
country_id varchar(2),
country_name varchar(50),
regionid decimal(12,0));

/* WAQ to create the strusture of a table dup_countries similar to countries*/
create table if not exists dup_countries
like countries;
show tables;

/*WAQ to create the structure of table dup_countries similar to countries*/
create table if not exists dup_countries
as select * countries;
drop table countries;

/* WAQ to create a table countries set a constraint NULL*/
create table if not exists countries(
counrtry_id varchar(4) not null,
country_name varchar(50) not null,
regionid decimal(12,0) not null);

/*WAQ to create a table named jobs including columns job_id,job_title,min_salary,
max_salary and check wheather the max_salary amount exceeding the upper limit 2500*/
create table if not exists jobs(
job_id varchar (12),
job_title varchar(40) not null,
min_salary decimal(7,0),
max_salary decimal (7,0) check (max_salary<=25000));
show tables;
