drop table emp;
create table emp(
emp_id number not null,
emp_name varchar2(50),
manager number
);

insert into emp(emp_id,emp_name)
values(1,'karthi');

insert into emp(emp_id,emp_name,manager)
values(2,'sandhi',1);

insert into emp(emp_id,emp_name,manager)
values(3,'bharu',2);

select * from emp;

select e1.emp_id,e1.emp_name,e2.emp_name as manager from emp e1,emp e2 where e1.manager=e2.emp_id;
