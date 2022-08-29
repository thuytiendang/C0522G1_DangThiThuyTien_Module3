use casestudy_furama_resort;

-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 
-- của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ma_dich_vu not in(
select hd.ma_dich_vu 
from hop_dong hd
where (year(hd.ngay_lam_hop_dong) >= 2021) and (month(hd.ngay_lam_hop_dong) in (1,2,3)))
group by ma_dich_vu
order by dv.dien_tich;

-- 	7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của
--  tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
--  nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, 
ldv.ten_loai_dich_vu
from dich_vu dv
left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020 and hd.ma_dich_vu not in(
select hd.ma_dich_vu
from hop_dong hd
where year(hd.ngay_lam_hop_dong) = 2021)
group by hd.ma_dich_vu;


-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, 
-- với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

select ho_ten
from khach_hang
group by ho_ten;

select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;

select distinct ho_ten
from khach_hang;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với 
-- mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
where (year(ngay_lam_hop_dong) = 2021)
group by thang
order by thang;

	-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng 
-- bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong
--  ở dich_vu_di_kem).

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
hd.tien_dat_coc, sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong
order by hd.ma_hop_dong;