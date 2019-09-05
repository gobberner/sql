-- 문제1 현재 평균 연봉보다 많은 월급을 받는 직원은 몆명이나 있습니까?
select count(*) as '직원수' 
 from salaries s
 where s.to_date = '9999-01-01'
 and s.salary > (select avg(s.salary) 
 from salaries s); 

-- 문제2 현재 각 부서별로 최고의 급여를 받는 사원의 사번,이름,부서 연봉을 조회하세요. 
-- 단 조회결과는 연봉의 내림차순으로 정렬되어 나타납니다
select e.emp_no, s.salary,concat(e.first_name, ' ', e.last_name) , d.dept_name
from employees e, dept_emp p, salaries s, departments d
where e.emp_no = s.emp_no
and e.emp_no = p.emp_no
and p.dept_no = d.dept_no
and p.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
and (p.dept_no,s.salary ) in(
	select p.dept_no, MAX(s.salary)
	from employees e, dept_emp p, salaries s 
	where e.emp_no = s.emp_no
	and e.emp_no = p.emp_no
	and p.to_date = '9999-01-01'
	and s.to_date = '9999-01-01'
	group by p.dept_no 
);
select MAX(s.salary) from salaries s where emp_no = '18006';
-- 문제3 현재 자신의 부서 평균 급여보다 연봉이많은 사원의 사번, 이름과 연봉을 조회하세요
	

select e.emp_no, s.salary,concat(e.first_name, ' ', e.last_name)
from employees e, dept_emp p, salaries s, (select p.dept_no, avg(s.salary) as avgs
	from salaries s, departments d, dept_emp p, employees e
	where e.emp_no = s.emp_no 
	and e.emp_no = p.emp_no 
	and p.dept_no = d.dept_no
	and s.to_date = '9999-01-01'
	and p.to_date = '9999-01-01'
	group by d.dept_name
	order by avg(s.salary) desc ) ps
where e.emp_no = s.emp_no
and e.emp_no = p.emp_no
and p.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
and ps.avgs <=  s.salary
and ps.dept_no =p.dept_no ;

-- 문제4 현재 사원들의 사번,이름.매니저 이름 ,부서 이름으로 출력해 보세요




-- 문제5 현재 평균연봉이 가장 높은 부서의 사원들의 사번 이름 직책 연봉을 조회하고 연봉 순으로 출력하세요a

select e.emp_no, s.salary,concat(e.first_name, ' ', e.last_name) , t.title
from employees e, dept_emp p, salaries s, titles t
where e.emp_no = s.emp_no
and e.emp_no = p.emp_no
and t.emp_no= e.emp_no
and p.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
and t.to_date = '9999-01-01'
and p.dept_no = (
	select p.dept_no
	from salaries s, departments d, dept_emp p, employees e
	where e.emp_no = s.emp_no 
	and e.emp_no = p.emp_no 
	and p.dept_no = d.dept_no
	and s.to_date = '9999-01-01'
	and p.to_date = '9999-01-01'
	group by d.dept_name
	order by avg(s.salary) desc 	
	limit 0,1 
);

-- 문제6 평균 연봉이 가장 높은 부서는?
select d.dept_name , avg(s.salary)
from salaries s, departments d, dept_emp p, employees e
where e.emp_no = s.emp_no 
and e.emp_no = p.emp_no 
and p.dept_no = d.dept_no
and s.to_date = '9999-01-01'
and p.to_date = '9999-01-01'
group by d.dept_name
order by avg(s.salary) desc; 

-- 문제7 푱균 연봉이 가장 높은 직책은?
select t.title, avg(s.salary) 
from titles t, salaries s
where t.emp_no = s.emp_no
and t.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
group by t.title
order by avg(s.salary);

-- 문제8 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?




-- 부서이름 사원이름 연봉 매니저이름 매니저 연봉 순으로 출력합니다. 