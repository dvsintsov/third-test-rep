/*
Модуль 5. Домашние задания
*/

--5.2 Аналитические функции. Сумма с нарастающим итогом
--Задание 1
--Создайте запрос, в котором используется аналитическая функция sum для подсчёта общей суммы минимальных зарплат (min_salary) из таблицы работ (jobs).
select job_id, job_title, max_salary, min_salary 
, sum(min_salary) over() min_salary_sum
from jobs;

--Задание 2
--Создайте запрос, который использует функцию count и конструкцию аналитических функций, и посчитайте количество городов (city) с секционированием по странам (country_id) в таблице работ (locations).
select country_id, city
, count (city) over (partition by country_id) cities_in_country
from locations
order by country_id, city;

--Задание 3
--Возьмите запрос, который вы сделали в задании 2, и измените аналитическую функцию для получения набегающего итога с сортировкой по полю почтового индекса (postal_code).
select country_id, city, postal_code
, count (city) over (partition by country_id order by postal_code) cities_in_country
from locations
order by country_id, postal_code;


--5.3 Аналитические функции. row_number()
--Задание 1
--Пронумеруйте строки по всей таблице стран (countries) с сортировкой по названию страны (country_name).
select country_id,country_name,region_id
, row_number() over(order by country_name) rn
from countries;

--Задание 2
--Пронумеруйте строки по таблице сотрудников (employees) с секционированием по идентификатору отдела (department_id) и сортировкой по имени (first_name).
select e.* 
, row_number() over(partition by e.department_id order by e.first_name) rn
from employees e
order by e.department_id, rn;


--Задание 3
--Выберите максимальное (агрегатная функция) наименование отдела (department_name) из таблицы отделов (departments), 
--где нумерация строк, секционированная по идентификатору локации (location_id) и отсортированная по наименованию отдела (department_id) по убыванию, больше единицы.
select s.* 
, max(department_name) over() as max_dep
from (
select d.* 
, row_number() over(partition by location_id order by department_id desc) rn
from departments d) s
where rn>1;


--5.4 Аналитические функции. lead/lag
--Задание 1
--Создайте запрос, который показывает фамилию (last_name) и имя (first_name) предыдущего сотрудника, а также фамилию (last_name) и имя (first_name) сотрудника, которого наняли (hire_date) следующим (lead), из таблицы сотрудников (employees).
select e.* 
, lag(e.last_name) over (order by e.hire_date) as LN_prev
, lag(e.first_name) over (order by e.hire_date) as FN_prev
, lead(e.last_name) over (order by e.hire_date) as LN_next
, lead(e.first_name) over (order by e.hire_date)as FN_next
from employees e
order by e.hire_date;


--Задание 2
--Переделайте запрос из задания 1 на выбор предыдущей строки (lag) и передайте аргумент сдвига — 2, а значение по умолчанию — «не пришёл».
select e.* 
, lag(e.last_name, 2, 'не пришел') over (order by e.hire_date) as LN_prev
, lag(e.first_name, 2, 'не пришел') over (order by e.hire_date) as FN_prev
from employees e
order by e.hire_date;

--Задание 3
--Добавьте в запрос из задания 2 секционирование в оконные функции по отделам (department_id).
select e.* 
, lag(e.last_name, 2, 'не пришел') over (partition by e.department_id order by e.hire_date) as LN_prev
, lag(e.first_name, 2, 'не пришел') over (partition by e.department_id order by e.hire_date) as FN_prev
from employees e
order by e.department_id, e.hire_date;

