select avg(salary), sum(salary)
from salaries where emp_no='10060';

select emp_no, avg(salary),sum(salary)
from salaries
where to_date = '9999-01-01'
group by emp_no
	having avg(salary) > 40000
order by avg(salary) asc;

-- ex1) 각 사원별로 평균연봉 출력
select avg(salary)
from salaries
group by emp_no
order by avg(salary) desc;

-- ex2) 각 현재 Manager 직책 사원에 대한 평균 연봉은?
-- select s.emp_no,avg(s.salary)
-- from salaries s, titles t
-- where s.emp_no = t.emp_no and t.title = 'manager' and t.to_date like '9999%'
-- group by s.emp_no;

select avg(a.salary)  
from salaries a, titles b
where a.emp_no = b.emp_no -- join 조건
and a.to_date = '9999-01-01' -- row 선택조건1
and a.to_date = '9999-01-01' -- row 선택조건2
and b.title = 'Manager'     ;  -- row 선택조건3   

-- ex2-1 응용문제) 각  직책별 평균 연봉은?

 select b.title, avg(a.salary)  
from salaries a, titles b
where a.emp_no = b.emp_no -- join 조건
and a.to_date = '9999-01-01' -- row 선택조건1
and a.to_date = '9999-01-01' -- row 선택조건2
and b.title = 'Manager'       -- row 선택조건3   
group by b.title;

-- ex3) 사원별 몆 번의 직책변경이 있었는지 조회alter
select s.emp_no,count(*)
from titles 
group by emp_no
order by count(*) desc;

-- ex4) 각 사원별로 평균연봉 출력하되 50,000불 이상인 직원만 출력
select emp_no, avg(salary)
from salaries
group by emp_no
having avg(salary)>50000
order by avg(salary);

-- ex5) 현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.

select t.title as '직책',count(t.emp_no) as '인원수',avg(s.salary) as '평균연봉' 
from titles t, salaries s
where t.emp_no = s.emp_no
and t.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
group by t.title having count(t.emp_no) >= '100';
  
-- ex6) 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.
select title as '직책', avg(s.salary) as '급여' 
from salaries s, titles t , dept_emp p, departments d
where t.emp_no = s.emp_no
and p.emp_no = t.emp_no
and p.dept_no = d.dept_no
and t.title = 'Engineer'
and t.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
group by d.dept_name;

-- ex7) 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요
--      단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에
--      대해서 내림차순(DESC)로 정렬하세요.   

select a.title,sum(b.salary) 
from titles a, salaries b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
and a.title != 'Engineer' 
group by a.title
having sum(b.salary) > 2000000000
order by sum(b.salary) desc;


select * from employees limit 10,10;















