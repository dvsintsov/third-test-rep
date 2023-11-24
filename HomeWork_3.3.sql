/*
��. ���� 3.3. Count
*/

--������� 1
--���������� ���������� ����� ����� ������ �������� �� ������� Countries.
select count(*) 
from Countries;

--������� 2
--���������� ���������� ����� ����� ����� ������������� �� ������� Jobs.
select count(1)
from Jobs;

--������� 3
--���������� ���������� ������������� �� ���� Department_ID �� ������� Departments, ��������������� �� ���� Location_ID.
select location_id, count(Department_ID) Dept_cnt
from Departments
group by Location_ID;


--������� 4
--���������� ���������� ������������� �� ���� Manager_ID �� ������� Departments.
select Manager_ID, count(Department_ID) Dept_cnt
from Departments
group by Manager_ID;