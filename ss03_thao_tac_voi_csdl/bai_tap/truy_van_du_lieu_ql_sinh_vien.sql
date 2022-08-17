use quan_ly_sinh_vien;

select *
from student 
where student_name like 'H%';

select *
from class
where month(start_date) = 12;

select *
from subjects
where credit between 3 and 5;

set sql_safe_updates = 0;
update student set class_id = 2 
where student_name = 'Hung';

select s.student_name,sub.subject_name,m.mark
from mark m
join student s on m.mark_id=s.student_id
join subjects sub on m.mark_id=sub.subject_id
order by m.mark desc, s.student_name;
