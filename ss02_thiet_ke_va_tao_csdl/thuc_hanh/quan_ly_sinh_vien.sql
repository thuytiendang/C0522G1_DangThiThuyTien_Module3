drop database if exists quan_ly_sinh_vien;

create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class(
class_id int auto_increment primary key ,
class_name varchar(60) not null,
start_date datetime not null,
status bit
);

create table student(
student_id int auto_increment primary key ,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
class_id int,
foreign key(class_id) references class(class_id)
);

create table subjects(
subject_id int auto_increment primary key,
subject_name varchar(30) not null,
credit tinyint not null default 1 check (credit >=1),
status bit default 1
);

create table mark(
mark_id int auto_increment primary key,
subject_id int,
student_id int,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
foreign key(subject_id) references subjects(subject_id),
foreign key(student_id) references student(student_id)
);
