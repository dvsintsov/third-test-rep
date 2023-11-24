/*
ДЗ. Урок 4.1. Максимальное и минимальное значение
*/

--Задание 1
--Посчитайте самую большую зарплату из колонки минимальных зарплат (min_salary) и самую маленькую зарплату из колонки максимальных зарплат (max_salary) в таблице работ (jobs).
select max(min_salary) as greatest_min_sal
, min(max_salary) as smallest_max_sal
from jobs;

--Задание 2
--Найдите первое и последнее по алфавиту название страны (country_name) в таблице стран (countries).
select min(country_name) as First_Country
, max (country_name) as Last_Country
from countries;

--Задание 3
--Найдите максимальную и минимальную зарплату (salary) в таблице сотрудников (employees), сгруппированных по идентификатору отдела (department_id).
select 
  department_id
, max(salary) as max_sal
, min(salary) as min_sal
from employees
group by department_id;


--ДЗ. Урок 4.2. Группировка одинаковых данных

--Задание 1
--Создайте запрос, выбирающий уникальные идентификаторы локаций (location_id) из таблицы отделов (departments). Сравните их количество с количеством строк в этой таблице.
select distinct location_id
from departments;

select count(distinct location_id) disrtinct_count
from departments
union all
select count(location_id) total_count
from departments;


--Задание 2
--Создайте запрос, выбирающий уникальные идентификаторы работ (job_id) из таблицы работ (jobs). Сравните их количество с количеством строк в этой таблице.
select *
from jobs
order by job_id;


select distinct job_id
from jobs;

select count(distinct job_id) disrtinct_job
from jobs
union all
select count(1) total_job
from jobs;

--Задание 3
--Создайте запрос, выбирающий уникальные наименования штатов/провинций (state_province) из таблицы локаций (locations). Сравните их количество с количеством строк в этой таблице.
select *
from locations
order by state_province
;

select distinct state_province
from locations;


select count(distinct state_province) disrtinct_province
from locations
union all
select count(1) total_province
from locations;


--ДЗ. Урок 4.3. Условия после агрегации данных
--Задание 1
--Создайте запрос, который берёт данные из таблицы сотрудников (employees) и разбивает их на группы по отделам (department_id). Посчитайте суммы зарплат в отделах и выберите отделы, в которых сумма зарплат более 120 тыс. руб.
select department_id
, sum(salary) as tot_salary
from employees
group by department_id
having sum(salary)>120000;


--Задание 2
--Создайте запрос, который берёт данные из таблицы локаций (locations) и разбивает их на группы по идентификаторам стран (country_id). Посчитайте количество штатов и провинций (state_province) внутри стран и выберите страны, в которых количество штатов и провинций равно нулю.
select 
  country_id
, count(state_province) as state_province_cnt
from locations
group by country_id
having count(state_province)=0;

--ДЗ 4.4 Подзапросы
--Задание 1
--Создайте запрос, выбирающий сотрудников (таблица employees) с зарплатой более 9 тыс. руб.
select *
from employees
where salary>9000;

--Задание 2
--Преобразуйте запрос из задания 1 в подзапрос и в запросе, который будет сверху, создайте фильтр на имя (first_name) John (first_name = ‘John’).
select *
from (select *
from employees
where salary>9000)
where first_name = 'John';


--Задание 3
--Преобразуйте запрос из задания 2 в запрос с использованием CTE (Common Table Expression) так, чтобы в первом подзапросе выбирались сотрудники с зарплатой более 9 тыс. руб., а во втором — на имя накладывался фильтр.
with e9 as (
select *
from employees
where salary>9000
)
select * from e9
where first_name = 'John';


--Задание 4
--Создайте запрос, с помощью которого будут отображаться только имена (first_name), фамилии (last_name) и телефонные номера (phone_number) из таблицы сотрудников (employees). 
--При этом наложите на выборку фильтр одновременно по двум полям — идентификатор отдела (department_id) и вид деятельности (job_id). 
--Значения для этих фильтров необходимо выбрать с помощью подзапроса из таблицы истории смены типов деятельности (job_history), 
--которые нужно отфильтровать по сотруднику с идентификатором (employee_id), равным 176.
select *
from employees
where (department_id, job_id) in (
select department_id, 
job_id
from job_history
where employee_id=176);


select *
from employees
where (department_id, job_id) in (
select department_id, job_id
from employees
where employee_id = 100);