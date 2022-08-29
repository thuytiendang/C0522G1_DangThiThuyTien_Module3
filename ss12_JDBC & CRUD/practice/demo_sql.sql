drop database if exists demo;

create database demo;
use demo;

create table users (
id int(3) primary key auto_increment,
name varchar(120) not null,
email varchar(220) not null,
country varchar(120)
);

create table permision(
id int(11) primary key auto_increment,
name varchar(50)
);

create table user_permision(
permision_id int(11),
user_id int(11),
foreign key(permision_id) references permision(id),
foreign key(user_id) references users(id)
);

insert into users (name, email, country)
values 
('Thuy Tien', 'thuytien@gmail.com','Viet Nam'),
('Moon Dang', 'moon2k@gmail.com', 'Viet Nam');

DELIMITER $$
CREATE PROCEDURE find_all()
BEGIN
SELECT *
FROM users;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE set_user_by_id(IN user_id INT, user_name varchar(120), user_email varchar(120), user_country varchar(120))
BEGIN
update users 
set name = user_name, email = user_email, country = user_country
 where id = user_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_user(IN user_id INT)
BEGIN
delete from users
where id = user_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
SELECT users.name, users.email, users.country
FROM users
where users.id = user_id;
END$$
DELIMITER ;

  

DELIMITER $$
CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
END$$
DELIMITER ;