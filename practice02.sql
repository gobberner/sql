-- 문제 1. 
-- 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요. 두 임금의 차이는 얼마인가요? 함께 “최고임금 – 최저임금”이란 타이틀로 출력해 보세요.

select MAX(salary) as '최고임금',MIN(salary) as '최소임금', MAX(salary) - MIN(salary) as '최고임금 - 최저임금' from salaries;

-- 문제2.
-- 마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일

select MAX(hire_date) from employees order by hire_date desc;

-- 문제3.
-- 가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요. -- *********
-- 예) 2014년 07월 10일
select * from titles;

-- 문제4.
-- 현재 이 회사의 평균 연봉은 얼마입니까?
select avg(s.salary) from salaries s where s.to_date='9999-01-01';

-- 문제5.
-- 현재 이 회사의 최고/최저 연봉은 얼마입니까?
select MAX(s.salary) as '최고연봉',min(s.salary) as '최저연봉' 
from salaries s where s.to_date='9999-01-01';

-- 문제6.
-- 최고 어린 사원의 나이와 최 연장자의 나이는?

select MAX(birth_date),MIN(birth_date) from employees ;
SELECT FLOOR( (CAST(REPLACE(current_date,'-','') AS UNSIGNED) - 
       CAST(REPLACE(MAX(birth_date),'-','') AS UNSIGNED)) / 10000 ) as '가장 나이 적은 사원',
       FLOOR( (CAST(REPLACE(current_date,'-','') AS UNSIGNED) - 
       CAST(REPLACE(MIN(birth_date),'-','') AS UNSIGNED)) / 10000 ) as '가장 나이 많은 사원'from employees;


select * from employees order by birth_date desc;

