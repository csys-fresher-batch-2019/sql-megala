drop table customer_details;
drop table branch;
create table branch(
branch_id number,
branch_name varchar2(50) not null,
branch_city varchar2(60) not null,
constraint branch_id_pk primary key(branch_id),
constraint branch_name_uq unique(branch_name)
);
insert into branch(branch_id,branch_name,branch_city)
values(1000000011,'singanallur','coimbatore');

insert into branch(branch_id,branch_name,branch_city)
values(1000000012,'jayanagar','bangalore');

insert into branch(branch_id,branch_name,branch_city)
values(1000000013,'ramanadhapuram','coimbatore');

insert into branch(branch_id,branch_name,branch_city)
values(1000000014,'vandalur','chennai');

insert into branch(branch_id,branch_name,branch_city)
values(1000000015,'alwarpet','chennai');

select *from branch order by branch_city ASC;

create table customer_details(
customer_name varchar2(50) not null,
customer_id number,
customer_street varchar2(50) not null,
customer_city varchar2(40) not null,
constraint customer_id_pk primary key (customer_id),
constraint customer_name_uq unique(customer_name)
);
insert into customer_details(customer_name,customer_id,customer_street,customer_city)
values('sandhi',123,'ondipudur','coimbatore');

insert into customer_details(customer_name,customer_id,customer_street,customer_city)
values('karthi',850,'irugur','coimbatore');

insert into customer_details(customer_name,customer_id,customer_street,customer_city)
values('surya',754,'madambakkam','chennai');

insert into customer_details(customer_name,customer_id,customer_street,customer_city)
values('bharu',609,'ambatturr','chennai');

insert into customer_details(customer_name,customer_id,customer_street,customer_city)
values('prabha',235,'jayanagar','bangalore');

select *from customer_details;
/*create table loan_details( 
branch_name varchar2(50),
loan_no number,
amount
*/
