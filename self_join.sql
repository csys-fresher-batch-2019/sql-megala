drop table emp;
create table emp(
emp_id number not null,
emp_name varchar2(50),
mrg_id number
);

insert into emp(emp_id,emp_name)
values(1,'karthi');

insert into emp(emp_id,emp_name,mrg_id)
values(2,'sandhi',8);

insert into emp(emp_id,emp_name,mrg_id)
values(3,'bharu',9);

select * from emp;

select e1.emp_id,e1.emp_name,e2.emp_name as mrg_id from emp e1,emp e2 where e1.mrg_id=e2.emp_id;
