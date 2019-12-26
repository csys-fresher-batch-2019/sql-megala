drop table tlist;
create table tlist(
task varchar(60) not null,
person_name varchar(50) not null,
created_date date not null,
deadline_date date,
modified_date date default SYSDATE,
completed_on date null,
status varchar(20),
priority_pk number primary key
);
insert into tlist(task,person_name,created_date,deadline_date,priority_pk)
values('oracle','mega',TO_DATE('12-12-2019','dd-MM-yyyy'),TO_DATE('25-12-2019','dd-MM-yyyy'),2);

insert into tlist(task,person_name,created_date,deadline_date,completed_on,priority_pk)
values('jdk','anu',TO_DATE('11-12-2019','dd-MM-yyyy'),TO_DATE('15-12-2019','dd-MM-yyyy'),TO_DATE('13-12-2019','dd-MM-yyyy'),1);
update tlist set status='COMPLETED' where completed_on is not null;
update tlist set status='PENDING' where completed_on is null;
select *from tlist order by priority_pk ASC;
