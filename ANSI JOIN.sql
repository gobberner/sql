-- ANSI JOIN 1999

-- join ~ on 
select a.emp_no,a.first_name,c.name 
from employees a, dept_emp b, departments c 
join dept_emp b
on a.emp_no = b.emp_no
join departments c
on b.dept_no = c.dept_no;

select a.first_name, b.title from employees a
join title b
on a.emp_no = b.emo_no;

-- natural join

select a.first_name, b.title 
from employees a
natural join titles b;

-- natural join의 문제점 => join using 으로 해결
select count(*) from salaries a
natural join titels b;

select count(*) from salaries a
natural join titels b;