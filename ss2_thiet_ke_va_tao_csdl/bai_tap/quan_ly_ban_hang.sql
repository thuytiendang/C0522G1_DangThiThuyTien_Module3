create database if not exists quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer(
customer_id int primary key,
customer_name varchar(45) not null,
customer_age int not null
);

create table orders(
order_id int primary key,
order_date date,
order_total_price double not null,
customer_id int,
foreign key(customer_id) references customer(customer_id)
);

create table product(
product_id int primary key,
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
