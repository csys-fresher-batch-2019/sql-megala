drop table credit_card;
drop table loan_details;
drop table account_details;
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

create table account_details(
customer_name varchar2(40) not null,
acc_no number primary key,
balance number not null,
constraint customer_name_fk foreign key (customer_name) references customer_details(customer_name)
--constraint acc_no_pk primary key (acc_no)
);
insert into account_details(customer_name,acc_no,balance)
values('karthi',11111,10000);

insert into account_details(customer_name,acc_no,balance)
values('surya',11122,20000);

insert into account_details(customer_name,acc_no,balance)
values('bharu',11133,30000);

insert into account_details(customer_name,acc_no,balance)
values('sandhi',11144,40000);

insert into account_details(customer_name,acc_no,balance)
values('prabha',11155,50000);

select * from account_details;

create table loan_details( 
customer_id number not null,
customer_name varchar2(50)not null,
branch_name varchar2(50) not null,
loan_no varchar2(50),
amount number not null,
constraint customer_name_1_fk foreign key (customer_name) references customer_details(customer_name),
constraint customer_id_uq unique(customer_id),
constraint customer_name_1_uq unique(customer_name),
constraint customer_id_fk foreign key (customer_id) references customer_details(customer_id),
constraint loan_no_pk primary key (loan_no)
);

insert into loan_details(customer_id,customer_name,branch_name,loan_no,amount)
values(123,'sandhi','irugur','A1B2390981',100000);

insert into loan_details(customer_id,customer_name,branch_name,loan_no,amount)
values(850,'karthi','selayur','A2B2560981',150000);

insert into loan_details(customer_id,customer_name,branch_name,loan_no,amount)
values(754,'surya','ambattur','A3H3680981',1200000);

insert into loan_details(customer_id,customer_name,branch_name,loan_no,amount)
values(609,'bharu','maambakkam','A4B2397681',100000);

insert into loan_details(customer_id,customer_name,branch_name,loan_no,amount)
values(235,'prabha','sulur','A5F5690981',145000);
select *from loan_details;

select * from account_details a,loan_details l where l.customer_name=a.customer_name;

create table credit_card(
customer_id number not null,
credit_card_no number not null,
acc_no number not null,
limit_no number not null,
expiry_date date,
constraint customer_card_uq unique(customer_id),
constraint credit_card_no_uq unique(credit_card_no),
constraint acc_no_uq unique(acc_no),
constraint customer_id_2_fk foreign key (customer_id) references customer_details(customer_id),
constraint acc_no_fk foreign key (acc_no) references account_details(acc_no)
--constraint acc_no_uq unique(acc_no)
);

insert into credit_card(customer_id,credit_card_no,acc_no,limit_no,expiry_date)
values(235,11110,11155,10000,to_date('20-12-2020','dd-MM-yyyy'));

insert into credit_card(customer_id,credit_card_no,acc_no,limit_no,expiry_date)
values(609,11112,11133,15000,to_date('10-05-2023','dd-MM-yyyy'));

insert into credit_card(customer_id,credit_card_no,acc_no,limit_no,expiry_date)
values(850,11114,11144,25000,to_date('09-04-2021','dd-MM-yyyy'));
/*
insert into credit_card(customer_id,credit_card_no,acc_no,limit_no,expiry_date)
values(609,11112,11133,15000,to_date('10-05-2023','dd-MM-yyyy'));

insert into credit_card(customer_id,credit_card_no,acc_no,limit_no,expiry_date)
values(609,11112,11133,15000,to_date('10-05-2023','dd-MM-yyyy'));

insert into credit_card(customer_id,credit_card_no,acc_no,limit_no,expiry_date)
values(609,11112,11133,15000,to_date('10-05-2023','dd-MM-yyyy'));*/
select *from credit_card ;
