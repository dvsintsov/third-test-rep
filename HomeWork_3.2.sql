/*
��. ���� 3.2. �������
*/

--������� 1
--�������� ������� ����������� ���������� ����� (min_salary) � ������� ������������ ���������� ����� (max_salary) � ����� ������� �� ������� ����� (Jobs).
select 
        avg(min_salary) min_sal_avg
        , avg(max_salary) max_sal_avg
from jobs2;

--������� 2
--�������� ������� ������������� ������� (region_id) �� ������� ����� (Countries).
select   avg(region_id) 
--from Countries
from departments

--������� 3
--�������� ������� ���������� ����� ����������� (salary) � ������������ �� �������������� ������ (job_id) �� ������� ����������� (Employees).
--�� ������ � ������� Employees ������� ��������� �������� ��� ������� ���� �����. ��� ����� � ������ ������ ������� ��������� ����������� �� job_id � ��������� ������ ���������� ������� � ���� ������� salary.
select   job_id
        ,avg(salary) avg_salary
from Employees
group by job_id;

--���� ��������� ��������� 
select   *
from Employees
group by job_id;
