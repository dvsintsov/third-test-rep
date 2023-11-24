/*
������ 7. ������������� ������
�������� �������
*/

--7.2 ���������� ������. right outer join
--������� 1
--�������� ������, � ������� ������ ����������� ������������ � ������� ������� (departments) ������� ������� (locations).
select * 
from departments d
right outer join locations l
on d.location_id = l.location_id;


--������� 2
--�������� ������, � ������� ������ ����������� ������������ � ������� ������� ����� (job_history) ������� ����� ����� (jobs), ������� ������ � ������� ���������� � ��������� ������������ (IT_PROG).
select * 
from job_history jh
right outer join jobs j
on j.job_id = jh.job_id
where j.job_id = 'IT_PROG';

--������� 3
--�������� ������, � ������� ����� ����������� ������� �������� (regions) � ����� (countries) ����� �����������, � ���� ����� ������ ������������ � ������� ������� (locations) � �������� �� ��������� ������: ������, �������, ���.
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

--7.3 ���������� ������. full outer join
--������� 1
--��������� ������ ����������� ������� ����� (countries) � ������� (locations) � �������� ��������� �� ����� �������������� ����� (country_id) � �������� ��������� ����� �������� � ���������.
select * 
from countries c
full join 
locations l 
on c.country_id = l.country_id
where 
c.country_id in ('BR', 'AR')
or l.country_id in ('BR', 'AR')
;

--������� 2
--��������� ������ ����������� ������� ������� ����� (job_history) � ����� ����� (jobs) � �������� ��������� �� ����� ���� ����� (job_id). ��� ���� ��� ������� ����� (jobs) ��������� ����� �� ���������� ����� (rownum) ������ ������.
select * 
from 
job_history jh
full join 
(select * from jobs where rownum<10) j
on jh.job_id = j.job_id;


--������� 3
--�� ����� ���� ����������, �� ���������� ������� 2 �������� ������, ������� ����� �������� ������ ��� ������ ����������.
select * 
from 
job_history jh
full join 
(select * from jobs where rownum<10) j
on jh.job_id = j.job_id
where jh.job_id is not null
;


--������� 4
--�� ����� ���� ����������, �� ���������� ������� 2 �������� ������, ������� ����� �������� ������ ��� ������� ����������.
select * 
from 
job_history jh
full join 
(select * from jobs where rownum<10) j
on jh.job_id = j.job_id
where j.job_id is not null
;

--7.4 ��������� ������������. cross join
--������� 1
--��������� ����������� ����������� ������� ����������� (employees) � �������� (regions).
select * from 
employees e 
cross join 
regions r;

--������� 2
--��������� ����������� ����������� ������� ����� (countries), ����� (jobs) � ������� (departments).
select * 
from countries c
cross join jobs j
cross join departments d;

select * 
from countries c, jobs j, departments d;


--������� 3
--��������� ����������� ����������� ������� ������� ����� (job_history) � �������
select * 
from job_history jh
cross join
(select 1553 as id, 'print' as txt from dual
union all
select 1868 as id, 'type' as txt from dual);

