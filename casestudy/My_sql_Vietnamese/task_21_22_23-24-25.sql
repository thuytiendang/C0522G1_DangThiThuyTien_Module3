use casestudy_furama_resort;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin 
-- của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập
--  hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp 
--  đồng là “12/12/2019”.

create view v_nhan_vien as
select nv.*
from nhan_vien nv 
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like '%Đà Nẵng' ;
-- and hd.ngay_lam_hop_dong like '12/12/2019'
-- group by nv.ma_nhan_vien
-- having count(hd.ma_hop_dong) >= 1;
select * from v_nhan_vien;
drop view v_nhan_vien;


-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ
--  thành “Liên Chiểu” đối với tất cả các nhân viên được 
--  nhìn thấy bởi khung nhìn này.

set sql_safe_updates = 0;
update v_nhan_vien 
set dia_chi = 'Liên Chiểu';

-- select nv.*
-- from nhan_vien nv 
-- join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
-- where nv.dia_chi like '%Liên Chiểu' ;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách
--  hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang

-- delimiter //
-- create procedure sp_xoa_khach_hang (in ma_kh int)
-- begin 
-- delete from khach_hang
-- where ma_khach_hang = ma_kh;
-- end //
-- delimiter ;

select* 
from khach_hang;
set sql_safe_updates = 0;
delimiter //
create procedure sp_xoa_khach_hang (in ma_kh int)
begin 
update khach_hang set khach_hang_bi_xoa = 1 
where ma_khach_hang = ma_kh;
end //
delimiter ;

call sp_xoa_khach_hang (2);

--  24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào
--  bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra 
--  tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa
--  chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter //
create procedure sp_them_moi_hop_dong (in sp_ma_hop_dong int, sp_ngay_lam_hop_dong datetime, sp_ngay_ket_thuc datetime,
sp_tien_dat_coc double , sp_ma_nhan_vien int, sp_ma_khach_hang int, sp_ma_dich_vu int)
begin 
insert into hop_dong(ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,ma_nhan_vien, ma_khach_hang, ma_dich_vu)
values
(sp_ma_hop_dong, sp_ngay_lam_hop_dong, sp_ngay_ket_thuc, sp_tien_dat_coc, sp_ma_nhan_vien, sp_ma_khach_hang, sp_ma_dich_vu);
end //
delimiter ;

call sp_them_moi_hop_dong(15, '2021-05-25', '2021-05-27', 0, 7, 10, 1);

select *
from hop_dong;

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị 
-- tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

