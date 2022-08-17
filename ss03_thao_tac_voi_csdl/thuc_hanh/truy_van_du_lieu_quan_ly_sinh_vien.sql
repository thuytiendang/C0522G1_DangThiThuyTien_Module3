use quan_ly_sinh_vien;

select * 
from student;

select *
from student
where `status` = true;

select *
from subjects
where credit < 10;

select s.student_id,s.student_name,c.class_name
from student s 
join class c on s.class_id = c.class_id
where c.class_name = 'A1';

select s.student_id,s.student_name,sub.subject_name,m.mark
from student s 
join mark m on s.student_id = m.student_id
join subjects sub on m.subject_id = sub.subject_id
where sub.subject_name='CF';