use casestudy_furama_resort;

select * 
from nhan_vien
where ho_ten like 'H%' or ho_ten like 'T%' or  ho_ten like 'K%' and char_length(ho_ten) <=15;
-- where ho_ten regexp '^[HKT]' and char_length(ho_ten) <=15;

select *
from khach_hang
where (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị')
and (year(curdate()) - year(ngay_sinh) between 18 and 50);

-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_khach_hang) as so_lan_dat_phong
from khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where kh.ma_loai_khach = 1
group by kh.ma_khach_hang
order by so_lan_dat_phong;

-- 	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
--  ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
--  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
--  với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất 
-- cả các khách hàng đã từng đặt phòng.
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu,
hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,(dv.chi_phi_thue + dvdk.gia*hdct.so_luong) as tong_tien
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem;

