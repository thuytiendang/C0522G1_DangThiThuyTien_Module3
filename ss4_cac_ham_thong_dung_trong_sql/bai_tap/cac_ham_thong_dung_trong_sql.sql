use quan_ly_sinh_vien;

select *
from subjects
where credit >= all (
select credit
from subjects
group by credit);

select s.subject_id, s.subject_name, m.mark as diem_cao_nhat
from subjects s
join mark m on m.subject_id = s.subject_id
where m.mark = (select max(mark) from mark);

select s.*, avg(m.mark) as diem_trung_binh
from student s
join mark m on m.student_id = s.student_id
group by student_id
order by m.mark desc;