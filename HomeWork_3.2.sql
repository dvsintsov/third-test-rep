/*
ДЗ. Урок 3.2. Среднее
*/

--Задание 1
--Выберите среднюю минимальную заработную плату (min_salary) и среднюю максимальную заработную плату (max_salary) в одном запросе из таблицы работ (Jobs).
select 
        avg(min_salary) min_sal_avg
        , avg(max_salary) max_sal_avg
from jobs3;

--Задание 2
--Выберите средний идентификатор региона (region_id) из таблицы стран (Countries).
select   avg(region_id) 
from Countries2

--Задание 3
--Выберите среднюю заработную плату сотрудников (salary) с группировкой по идентификатору работы (job_id) из таблицы сотрудников (Employees).
--Из данных в таблице Employees найдите суммарные зарплаты для каждого вида работ. Для этого в рамках одного запроса выполните группировку по job_id и примените нужную агрегатную функцию к полю зарплат salary.
select   job_id
        ,avg(salary) avg_salary
from Employees
group by job_id;

--внес небольшое изменение 
select   *
from Employees
group by job_id;

select * from jobs;
--комментарий
