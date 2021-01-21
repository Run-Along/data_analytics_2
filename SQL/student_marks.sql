select * from student_marks order by unit4 desc

select * from student_marks where unit4 >= 89 and unit4 <=100 limit 15

select student_reg_id from student_marks where unit3 >= 89 and unit4 <=100 limit 15

select count (student_reg_id) from student_marks where unit2 > 90

select * from student_marks

select id from student_marks where unit2 =90 and unit3 = 90 and unit4 < 90

select id from student_marks where unit2 =90 and unit4 = 90

select count (distinct student_reg_id) from student_marks

select count (distinct id) from student_marks

select count (distinct unit4) from student_marks