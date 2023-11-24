/*
ДЗ. Урок 3.3. Count
*/

--Задание 1
--Посчитайте количество стран через символ звёздочку из таблицы Countries.
select count(*) 
from Countries;

--Задание 2
--Посчитайте количество видов работ через псевдоколонку из таблицы Jobs.
select count(1)
from Jobs;

--Задание 3
--Посчитайте количество департаментов по полю Department_ID из таблицы Departments, сгруппированных по полю Location_ID.
select location_id, count(Department_ID) Dept_cnt
from Departments
group by Location_ID;


--Задание 4
--Посчитайте количество департаментов по полю Manager_ID из таблицы Departments.
select Manager_ID, count(Department_ID) Dept_cnt
from Departments
group by Manager_ID;