-- upper

select upper('seoul'),upper('seoul');
select upper(first_name) from employees;

select first_name from employees;

-- lower
select lower('SEoul'), lower('SEOUL');

-- substring()

select substring('Happy Day',3,2);

select first_name as '이름',
		sunstring(hire_date,1,4) as '입사년도'
from employees;

-- lpad, rpad : 정렬
select lpad('1234',10,'-');
select rpad('1234',10,'-');

-- salaries 테이블에서 7만불 이하의 직원만 사번

-- select * from salaries where from_date like '2001%'
-- and salary < 70000

select emp_no, lpad(cast(salary as char),10,'*') from salaries 
where from_date like '2001%'
and salary < 70000 ;  -- 이거 안댐

-- ltrim, rtrim , trim
select concat('---',ltrim(' hello '),'---') as 'LTRIM',
	   concat('---',rtrim(' hello '),'---') as 'RTRIM',
       concat('---',trim(' hello '),'---') as 'TRIM',
       concat('---',trim(both 'x' from 'xxxxxxhelloxxxxx'),'---') as 'TRIM2',
       concat('---',trim(leading 'x' from 'xxxxxxhelloxxxxx'),'---') as 'TRIM3',
       concat('---',trim(trailing 'x' from 'xxxxxxhelloxxxxx'),'---') as 'TRIM4';