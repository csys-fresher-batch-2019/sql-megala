
drop table employee;
create table employee(
emp_id number,
task varchar(30) not null,
assigned_to varchar(20) not null,
dep_name varchar(40),
deadline_date date not null,
completed_on date,
status varchar(50),
salary number not null,
priority_pk number primary key
);
drop sequence emp_id_seq;
create sequence emp_id_seq start with 1 increment by 1;

insert into employee(emp_id,task,assigned_to,dep_name,deadline_date,completed_on,salary,priority_pk)
values(emp_id_seq.nextval,'oracle','mega','HR',TO_DATE('12-12-2019','dd-MM-yyyy'),TO_DATE('25-12-2019','dd-MM-yyyy'),12000,2);

insert into employee(emp_id,task,assigned_to,dep_name,deadline_date,salary,priority_pk)
values(emp_id_seq.nextval,'jdk','mega','trainee',TO_DATE('02-12-2019','dd-MM-yyyy'),10000,1);

insert into employee(emp_id,task,assigned_to,dep_name,deadline_date,completed_on,salary,priority_pk)
values(emp_id_seq.nextval,'oracle','anu','dev',TO_DATE('01-12-2019','dd-MM-yyyy'),TO_DATE('25-11-2019','dd-MM-yyyy'),5000,3);

insert into employee(emp_id,task,assigned_to,dep_name,deadline_date,completed_on,salary,priority_pk)
values(emp_id_seq.nextval,'dba','karthi','sec',TO_DATE('04-09-2019','dd-MM-yyyy'),TO_DATE('02-09-2019','dd-MM-yyyy'),6000,4);

insert into employee(emp_id,task,assigned_to,dep_name,deadline_date,salary,priority_pk)
values(emp_id_seq.nextval,'sql','bharu','pres',TO_DATE('01-06-2019','dd-MM-yyyy'),20000,6);

insert into employee(emp_id,task,assigned_to,dep_name,deadline_date,completed_on,salary,priority_pk)
values(emp_id_seq.nextval,'sql','surya','HR',TO_DATE('12-12-2019','dd-MM-yyyy'),TO_DATE('25-12-2019','dd-MM-yyyy'),50000,5);

update employee set status='COMPLETED' where completed_on is not null;

update employee set status='PENDING' where completed_on is null;

select *from employee order by priority_pk;
update employee set assigned_to='anu'where assigned_to='mega' and status='PENDING';

select *from employee order by priority_pk;
