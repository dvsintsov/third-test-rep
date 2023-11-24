/*
������ 5. �������� �������
*/

--5.2 ������������� �������. ����� � ����������� ������
--������� 1
--�������� ������, � ������� ������������ ������������� ������� sum ��� �������� ����� ����� ����������� ������� (min_salary) �� ������� ����� (jobs).
select job_id, job_title, max_salary, min_salary 
, sum(min_salary) over() min_salary_sum
from jobs;

--������� 2
--�������� ������, ������� ���������� ������� count � ����������� ������������� �������, � ���������� ���������� ������� (city) � ���������������� �� ������� (country_id) � ������� ����� (locations).
select country_id, city
, count (city) over (partition by country_id) cities_in_country
from locations
order by country_id, city;

--������� 3
--�������� ������, ������� �� ������� � ������� 2, � �������� ������������� ������� ��� ��������� ����������� ����� � ����������� �� ���� ��������� ������� (postal_code).
select country_id, city, postal_code
, count (city) over (partition by country_id order by postal_code) cities_in_country
from locations
order by country_id, postal_code;


--5.3 ������������� �������. row_number()
--������� 1
--������������ ������ �� ���� ������� ����� (countries) � ����������� �� �������� ������ (country_name).
select country_id,country_name,region_id
, row_number() over(order by country_name) rn
from countries;

--������� 2
--������������ ������ �� ������� ����������� (employees) � ���������������� �� �������������� ������ (department_id) � ����������� �� ����� (first_name).
select e.* 
, row_number() over(partition by e.department_id order by e.first_name) rn
from employees e
order by e.department_id, rn;


--������� 3
--�������� ������������ (���������� �������) ������������ ������ (department_name) �� ������� ������� (departments), 
--��� ��������� �����, ���������������� �� �������������� ������� (location_id) � ��������������� �� ������������ ������ (department_id) �� ��������, ������ �������.
select s.* 
, max(department_name) over() as max_dep
from (
select d.* 
, row_number() over(partition by location_id order by department_id desc) rn
from departments d) s
where rn>1;


--5.4 ������������� �������. lead/lag
--������� 1
--�������� ������, ������� ���������� ������� (last_name) � ��� (first_name) ����������� ����������, � ����� ������� (last_name) � ��� (first_name) ����������, �������� ������ (hire_date) ��������� (lead), �� ������� ����������� (employees).
select e.* 
, lag(e.last_name) over (order by e.hire_date) as LN_prev
, lag(e.first_name) over (order by e.hire_date) as FN_prev
, lead(e.last_name) over (order by e.hire_date) as LN_next
, lead(e.first_name) over (order by e.hire_date)as FN_next
from employees e
order by e.hire_date;


--������� 2
--����������� ������ �� ������� 1 �� ����� ���������� ������ (lag) � ��������� �������� ������ � 2, � �������� �� ��������� � ��� ������.
select e.* 
, lag(e.last_name, 2, '�� ������') over (order by e.hire_date) as LN_prev
, lag(e.first_name, 2, '�� ������') over (order by e.hire_date) as FN_prev
from employees e
order by e.hire_date;

--������� 3
--�������� � ������ �� ������� 2 ��������������� � ������� ������� �� ������� (department_id).
select e.* 
, lag(e.last_name, 2, '�� ������') over (partition by e.department_id order by e.hire_date) as LN_prev
, lag(e.first_name, 2, '�� ������') over (partition by e.department_id order by e.hire_date) as FN_prev
from employees e
order by e.department_id, e.hire_date;

