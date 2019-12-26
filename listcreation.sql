drop table tlist;
create table tlist(
task varchar(60) not null,
person_name varchar(50) not null,
created_date date not null,
deadline_date date,
modified_date date default SYSDATE,
completed_on date,
status varchar(20)not null,
priority_pk number primary key
);
insert into tlist(task,person_name,created_date,deadline_date,completed_on,priority_pk,status)
values('oracle','mega',TO_DATE('12-12-2019','dd-MM-yyyy'),TO_DATE('25-12-2019','dd-MM-yyyy'),TO_DATE('25-12-2019','dd-MM-yyyy'),2,'completed');

insert into tlist(task,person_name,created_date,deadline_date,completed_on,priority_pk,status)
values('jdk','anu',TO_DATE('11-12-2019','dd-MM-yyyy'),TO_DATE('15-12-2019','dd-MM-yyyy'),TO_DATE('13-12-2019','dd-MM-yyyy'),1,'completed');
select *from tlist order by priority_pk ASC;
