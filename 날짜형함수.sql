select abs(2), abs(-2);

select mod(7,2), mod(15,4); -- 나눈 나머지

select floor(3.14), floor(-3.14);

select ceiling(3.14), ceiling(-3.14);

select round (1.298), round(1.5111);

-- round(x,d) : d자리에 가장 근접한 실수 반환
select round(1.298,1), round(1.5111,0);

-- 제곱승 
select pow(2,10), power(10,5);

-- sign(x) : x가 음수으면 -1, 양수이면 1, 0 이면 0
select sign(-2), sign(2), sign(0);

-- 가장큰값, 가장 작은값
select greatest(10,2,4,9), 
laest(10,2,4,9),
greatest('Abc','Abc1','ABcd');

-- curdate(), current_date
select curdate(), current_date;

-- curtime(), current_time = hh,mm,ss
select curtime(), current_time();

-- now(), sysdate(), current_timestamp() = yyyy,mm,dd,hh,mm,ss
select  now(), sysdate(), current_timestamp();

-- now() vs sysdate()
-- now: 쿼리 실행하기 전에
-- sysdate(): 쿼리가 실행되면서 
select now(),sleep(2),now();
select now(),sleep(2),sysdate();
-- date_format
select date_format(now(), '%Y년 %c월 %d일 %h시 %i분 %s초');
select date_format(sysdate(),'%Y년 %c월 %d일 %h시 %i분 %s초');

-- period_diff(p1,p2);
-- :YYMM,YYYYMM 으로 표기되는 p1과 p2의 차이의 개월을 반환한다.
-- ex) 직원들의 근무 개월 수 구하기alter
select concat(first_name,' ',last_name) as name,
period_diff(date_format(curdate(),'%Y%m'),date_format(curdate(),'%Y%m'))
from employees;

-- date_add, adddate
-- date_sub, subdate
-- (date, INTERVAL expr type)
-- : 날짜 date에 type 형식으로 지정한 expr값을 더하거나 뺸다.
-- ex) 각 직원들의 6개월 후 근무 평가일
select concat(first_name,' ',last_name) as name,
hire_date,
date_add(hire_date,INTERVAL 6 month)
from employees;
-- cast 
select now(),cast(now() as date),cast(now() as datetime);
select 1-2, cast(1-2 as unsigned);

select 1-2, cast(1-2 as unsigned) as signed;







 