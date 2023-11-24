/*
��. ���� 4.1. ������������ � ����������� ��������
*/

--������� 1
--���������� ����� ������� �������� �� ������� ����������� ������� (min_salary) � ����� ��������� �������� �� ������� ������������ ������� (max_salary) � ������� ����� (jobs).
select max(min_salary) as greatest_min_sal
, min(max_salary) as smallest_max_sal
from jobs;

--������� 2
--������� ������ � ��������� �� �������� �������� ������ (country_name) � ������� ����� (countries).
select min(country_name) as First_Country
, max (country_name) as Last_Country
from countries;

--������� 3
--������� ������������ � ����������� �������� (salary) � ������� ����������� (employees), ��������������� �� �������������� ������ (department_id).
select 
  department_id
, max(salary) as max_sal
, min(salary) as min_sal
from employees
group by department_id;


--��. ���� 4.2. ����������� ���������� ������

--������� 1
--�������� ������, ���������� ���������� �������������� ������� (location_id) �� ������� ������� (departments). �������� �� ���������� � ����������� ����� � ���� �������.
select distinct location_id
from departments;

select count(distinct location_id) disrtinct_count
from departments
union all
select count(location_id) total_count
from departments;


--������� 2
--�������� ������, ���������� ���������� �������������� ����� (job_id) �� ������� ����� (jobs). �������� �� ���������� � ����������� ����� � ���� �������.
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

--������� 3
--�������� ������, ���������� ���������� ������������ ������/��������� (state_province) �� ������� ������� (locations). �������� �� ���������� � ����������� ����� � ���� �������.
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


--��. ���� 4.3. ������� ����� ��������� ������
--������� 1
--�������� ������, ������� ���� ������ �� ������� ����������� (employees) � ��������� �� �� ������ �� ������� (department_id). ���������� ����� ������� � ������� � �������� ������, � ������� ����� ������� ����� 120 ���. ���.
select department_id
, sum(salary) as tot_salary
from employees
group by department_id
having sum(salary)>120000;


--������� 2
--�������� ������, ������� ���� ������ �� ������� ������� (locations) � ��������� �� �� ������ �� ��������������� ����� (country_id). ���������� ���������� ������ � ��������� (state_province) ������ ����� � �������� ������, � ������� ���������� ������ � ��������� ����� ����.
select 
  country_id
, count(state_province) as state_province_cnt
from locations
group by country_id
having count(state_province)=0;

--�� 4.4 ����������
--������� 1
--�������� ������, ���������� ����������� (������� employees) � ��������� ����� 9 ���. ���.
select *
from employees
where salary>9000;

--������� 2
--������������ ������ �� ������� 1 � ��������� � � �������, ������� ����� ������, �������� ������ �� ��� (first_name) John (first_name = �John�).
select *
from (select *
from employees
where salary>9000)
where first_name = 'John';


--������� 3
--������������ ������ �� ������� 2 � ������ � �������������� CTE (Common Table Expression) ���, ����� � ������ ���������� ���������� ���������� � ��������� ����� 9 ���. ���., � �� ������ � �� ��� ������������ ������.
with e9 as (
select *
from employees
where salary>9000
)
select * from e9
where first_name = 'John';


--������� 4
--�������� ������, � ������� �������� ����� ������������ ������ ����� (first_name), ������� (last_name) � ���������� ������ (phone_number) �� ������� ����������� (employees). 
--��� ���� �������� �� ������� ������ ������������ �� ���� ����� � ������������� ������ (department_id) � ��� ������������ (job_id). 
--�������� ��� ���� �������� ���������� ������� � ������� ���������� �� ������� ������� ����� ����� ������������ (job_history), 
--������� ����� ������������� �� ���������� � ��������������� (employee_id), ������ 176.
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