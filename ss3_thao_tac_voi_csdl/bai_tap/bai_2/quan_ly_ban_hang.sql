drop database if exists quan_ly_ban_hang;

create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer(
customer_id int auto_increment primary key,
customer_name varchar(45) not null,
customer_age int not null
);

create table orders(
order_id int auto_increment primary key,
order_date date,
order_total_price double,
customer_id int,
foreign key(customer_id) references customer(customer_id)
);

create table product(
product_id int auto_increment primary key,
product_name varchar(45) not null,
product_price double not null
);

create table order_detail(
order_id int,
product_id int,
primary key(order_id,product_id),
order_quantity int not null,
foreign key(order_id) references orders(order_id),
foreign key(product_id) references product(product_id)
);

insert into customer(customer_name,customer_age)
values
('Minh Quan',10),
('Ngoc Oanh',20),
('Hong Ha',50);

insert into orders(customer_id,order_date,order_total_price)
values
(1,'2006-03-21',null),
(2,'2006-03-23',null),
(1,'2006-03-16',null);

insert into product(product_name,product_price)
values 
('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

insert into order_detail(order_id,product_id,order_quantity)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);