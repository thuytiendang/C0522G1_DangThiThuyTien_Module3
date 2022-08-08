drop database if exists student_management;
create database student_management;

use student_management;

create table student(
id int primary key not null,
`name` varchar(45) not null,
age int not null,
country varchar(45) not null
);

create table class(
id int primary key not null,
`name` varchar(45) not null
);

create table teacher(
id int primary key not null,
`name` varchar(45) not null,
age int not null,
country varchar(45) not null
);
