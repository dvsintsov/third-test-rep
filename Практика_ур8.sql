Create table Friends (name varchar2(64), age number, birthdate date);

Alter table friends add last_name varchar2(128);

select * from Friends;

Alter table friends modify name not null;

Comment on table friends is 'ƒрузь€';

Comment on column friends.name is '»м€';


select to_date ('2023.11.18', 'yyyy.mm.dd') dt from dual;

select date'2023-11-18' dt from dual;

select to_date ('2023.11.18 16:20:18', 'yyyy.mm.dd hh24:mi:ss') dt from dual;

Select to_char(4352, '9G999') as chr from dual;


select sysdate from dual;

select current_timestamp from dual;

select to_char(sysdate, 'dd/Mon-yyy') from dual;

select trim('   asdf   asdf      ') as t from dual;


Select to_char(sysdate, 'mm') from dual;

Select to_number(to_char(sysdate, 'mm')) from dual;

select trunc(sysdate) from dual; - преобразует в дату (из даты-времени)

select trunc(sysdate, 'mm') from dual; -- возвращает первый день мес€ца

select trunc(sysdate, 'yyyy') from dual; -- возвращает первый день года

