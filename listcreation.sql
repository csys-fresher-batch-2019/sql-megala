create table list(
task varchar(60) not null,
by varchar(50) not null,
dealine date,
completed_on date,
status varchar(20)not null
);
insert into list(task,by,deadline,completed_on,status)
values('oracle','mega',to_date('25-12-2019','dd-MM-yyyy'),to_date('25-12-2019','dd-MM-yyyy'),'completed');
select * from list where status='completed';
