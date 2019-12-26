create table list(
task varchar(60) not null,
name varchar(50) not null,
created_date date not null,
deadline_date date,
modified_date date default SYSDATE,
completed_on date,
priority number,
status varchar(20)not null,
constraint priority_pk primary key(priority)
);
insert into list(task,name,created_date,deadline_date,completed_on,priority,status)
values('oracle','mega',to_date('12-12-2019','dd-MM-yyyy'),to_date('25-12-2019','dd-MM-yyyy'),to_date('25-12-2019','dd-MM-yyyy'),2,'completed');

insert into list(task,name,created_date,deadline_date,completed_on,priority,status)
values('jdk','anu',to_date('11-12-2019','dd-MM-yyyy'),to_date('15-12-2019','dd-MM-yyyy'),to_date('13-12-2019','dd-MM-yyyy'),1,'completed');
select * from list order by priority ASC;
