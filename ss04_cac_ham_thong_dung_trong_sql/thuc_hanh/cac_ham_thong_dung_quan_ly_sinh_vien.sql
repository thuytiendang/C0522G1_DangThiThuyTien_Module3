use quan_ly_sinh_vien;

select address, count(student_id) as so_luong_hoc_vien
from student
group by address;

select s.student_id, s.student_name, avg(m.mark)
from student s 
join mark m on m.student_id = s.student_id
group by student_id,student_name;

select s.student_id, s.student_name, avg(m.mark) as diem_trung_binh
from student s 
join mark m on m.student_id = s.student_id
group by student_id,student_name
having diem_trung_binh > 15;

select s.student_id, s.student_name, avg(m.mark) as diem_trung_binh
from student s 
join mark m on m.student_id = s.student_id
group by student_id,student_name
having avg(m.mark) >= all (
select avg(m.mark) 
from mark
group by mark.student_id);
