select (first_name,
	last_name,
    gender,
    hire_date)
    from employees;
-- concat
select concat(first_name,' ',last_name) as name,
gender as 성별,
hire_date as '입사 날짜'
from employees
order by hire_date desc;
-- alias -> as

-- 중복제거 dictinct()

select distinct(title) from titles;

-- ex2) salaries 테치블에서 2001년 월급을 가장 높은순으로 사번,월급순으로 출력
select concat(first_name,' ', last_name) as '이름',
gender, hire_date
from employees
where hire_date < '1989-01-01'
and gender = 'f'
order by hire_date desc;

select emp_no, salary
from salaries where from_date like '2001%'
order by salary desc;

-- where (조건절)


-- ex3)
select * from dept_emp
where dept_no = 'd005'
or dept_no = 'd009';

select * from dept_emp
where dept_no in('d005','d009');


select concat(first_name,' ', last_name) as '이름',
hire_date
from employees
where hire_date < '1989-12-31'
and hire_date >= '1989-01-01'
order by hire_date desc;



show tables;