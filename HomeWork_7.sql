/*
Модуль 7. Присоединение таблиц
Домашние задания
*/

--7.2 Соединение таблиц. right outer join
--Задание 1
--Сделайте запрос, в котором правым соединением присоедините к таблице отделов (departments) таблицу локаций (locations).
select * 
from departments d
right outer join locations l
on d.location_id = l.location_id;


--Задание 2
--Сделайте запрос, в котором правым соединением присоедините к таблице истории работ (job_history) таблицу типов работ (jobs), задайте фильтр с выбором работников в должности программиста (IT_PROG).
select * 
from job_history jh
right outer join jobs j
on j.job_id = jh.job_id
where j.job_id = 'IT_PROG';

--Задание 3
--Создайте запрос, в котором будут соединяться таблицы регионов (regions) и стран (countries) левым соединением, и этот набор данных присоедините к таблице локаций (locations) с фильтром на следующие страны: Канада, Мексика, США.
select * from 
(select 
r.region_id
, r.region_name
, c.country_id
, c.country_name
from regions r 
left join countries c
on r.region_id = c.region_id) rc
join
locations l 
on l.country_id = rc.country_id
where l.country_id in ('MX', 'CA', 'US')
;

--7.3 Соединение таблиц. full outer join
--Задание 1
--Соедините полным соединением таблицы стран (countries) и локаций (locations) с условием равенства по полям идентификатора стран (country_id) и условием включения стран Бразилии и Аргентины.
select * 
from countries c
full join 
locations l 
on c.country_id = l.country_id
where 
c.country_id in ('BR', 'AR')
or l.country_id in ('BR', 'AR')
;

--Задание 2
--Соедините полным соединением таблицы истории работ (job_history) и типов работ (jobs) с условием равенства по полям вида работ (job_id). При этом для таблицы работ (jobs) поставьте лимит на количество строк (rownum) меньше десяти.
select * 
from 
job_history jh
full join 
(select * from jobs where rownum<10) j
on jh.job_id = j.job_id;


--Задание 3
--Не меняя типа соединения, из результата задания 2 выберите данные, которые можно получить только для левого соединения.
select * 
from 
job_history jh
full join 
(select * from jobs where rownum<10) j
on jh.job_id = j.job_id
where jh.job_id is not null
;


--Задание 4
--Не меняя типа соединения, из результата задания 2 выберите данные, которые можно получить только для правого соединения.
select * 
from 
job_history jh
full join 
(select * from jobs where rownum<10) j
on jh.job_id = j.job_id
where j.job_id is not null
;

--7.4 Декартово произведение. cross join
--Задание 1
--Соедините перекрёстным соединением таблицы сотрудников (employees) и регионов (regions).
select * from 
employees e 
cross join 
regions r;

--Задание 2
--Соедините перекрёстным соединением таблицы стран (countries), работ (jobs) и отделов (departments).
select * 
from countries c
cross join jobs j
cross join departments d;

select * 
from countries c, jobs j, departments d;


--Задание 3
--Соедините перекрёстным соединением таблицу истории работ (job_history) и выборку
select * 
from job_history jh
cross join
(select 1553 as id, 'print' as txt from dual
union all
select 1868 as id, 'type' as txt from dual);

