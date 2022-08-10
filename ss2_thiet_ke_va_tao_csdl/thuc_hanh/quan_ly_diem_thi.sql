drop database if exists quan_ly_diem_thi;

create database quan_ly_diem_thi;
use quan_ly_diem_thi;

create table hoc_sinh(
ma_hoc_sinh varchar(20) primary key,
ten_hoc_sinh varchar(45) not null,
ngay_sinh date not null,
lop varchar(45) not null,
gioi_tinh varchar(20) not null
);

create table mon_hoc(
ma_mon_hoc varchar(20) primary key,
ten_mon_hoc varchar(45) not null
);

create table bang_diem(
ma_hoc_sinh varchar(20) ,
ma_mon_hoc varchar(20),
primary key(ma_hoc_sinh,ma_mon_hoc),
diem_thi double not null,
ngay_kiem_tra date,
foreign key(ma_hoc_sinh) references hoc_sinh(ma_hoc_sinh),
foreign key(ma_mon_hoc) references mon_hoc(ma_mon_hoc)
);

create table giao_vien(
ma_giao_vien varchar(20) primary key,
ten_giao_vien varchar(45) not null,
so_dien_thoai  varchar(45) not null
);

alter table mon_hoc add ma_giao_vien varchar(20);
alter table mon_hoc add constraint fk_ma_giao_vien foreign key(ma_giao_vien) references giao_vien(ma_giao_vien);