drop database if exists products_management;

create database products_management;

use products_management;

create table products(
id int auto_increment primary key,
product_code int not null,
product_name varchar(45) not null,
product_price double not null,
product_amount int not null,
product_description text,
product_status varchar(45) not null
);

insert into products(id,product_code,product_name,product_price,product_amount,product_description,product_status)
value
(1,43,'PS',34000,30,'răng sáng chắc khỏe','còn'),
(2,368,'senka',120000,60,'hương dâu','còn'),
(3,687,'cocoon',160000,40,'tẩy da chết tốt','còn'),
(4,735,'aquafina',5000,100,'giải nhiệt cơ thể','còn'),
(5,78,'oishi',5000,200,'vị bắp','còn'),
(6,45,'oppo',8000000,30,'chuyên gia selfie','còn'),
(7,89,'campus',25000,200,'đồng hành cùng học sinh vùng cao','còn');

explain select * 
from products 
where product_name = 'oishi';

create unique index i_product_code on products(product_code);

create index i_product_name_price on products(product_name, product_price);

explain select * 
from products 
where product_name = 'oishi';

create view w_duplicate_product as
select product_code, product_name,product_price,product_status
from products;

select * from w_duplicate_product;

update w_duplicate_product set product_price=30000 where product_code = 43;

select * from w_duplicate_product;

drop view w_duplicate_product;

delimiter //
create procedure sp_all_information()
begin
select *
from products;
end //
delimiter ; 

call sp_all_information();

delimiter //
create procedure add_product()
begin
insert into products(id,product_code,product_name,product_price,product_amount,product_description,product_status)
value
(8,63,'asus',18000000,20,'màu đỏ gạch','còn');
end //
delimiter ; 

call add_product();

call sp_all_information();

delimiter //
create procedure change_product(in id_product int,codes int,product_names varchar(45),
price double,amount int,descriptions text,products_status varchar(45))
begin
update products set
product_code = codes,
product_name = product_names,
product_price = price,
product_amount = amount,
product_description = descriptions,
product_status = products_status
where id = id_product;
end //
delimiter ;

call change_product(8,63,'dell',18000000,300,'màu đỏ gạch','còn');

call sp_all_information();

delimiter //
create procedure delete_product(in id_product int)
begin
delete from products
where id = id_product;
end //
delimiter ;

call delete_product(1);

call sp_all_information();
