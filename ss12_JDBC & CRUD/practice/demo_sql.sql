drop database if exists demo;

create database demo;
use demo;

create table users (
id int(3) primary key auto_increment,
name varchar(120) not null,
email varchar(220) not null,
country varchar(120)
);

insert into users (name, email, country)
values 
('Thuy Tien', 'thuytien@gmail.com','Viet Nam'),
('Moon Dang', 'moon2k@gmail.com', 'Viet Nam');
