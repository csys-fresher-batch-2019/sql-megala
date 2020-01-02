drop table transaction_details;
drop table beneficiary_list;
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

---------list the brach id and its details in ascending order------------
select *from branch order by branch_id ASC;

---------count the number of branch_cities that are distinct-----------
select count(distinct(branch_city)) from branch;

---------display the branch cities that are distinct---------------
select distinct(branch_city) from branch;

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

----------list the customer name and its details in ascending order----------
select *from customer_details order by customer_name ASC;

------------display the customer cities that are in chennai--------------
select *from customer_details where customer_city='chennai';

----------------display the customer cities except coimbatore----------
select *from customer_details where customer_city != 'coimbatore';

create table account_details(
customer_name varchar2(40) not null,
acc_no number primary key,
acc_type varchar2(70) not null,
available_balance number not null,
constraint acc_type_ck check(acc_type in ('salaried','saving')),
constraint customer_name_fk foreign key (customer_name) references customer_details(customer_name)
--constraint acc_no_pk primary key (acc_no)
);
insert into account_details(customer_name,acc_no,acc_type,available_balance)
values('karthi',11111,'salaried',10000);

insert into account_details(customer_name,acc_no,acc_type,available_balance)
values('surya',11122,'saving',15000);

insert into account_details(customer_name,acc_no,acc_type,available_balance)
values('bharu',11133,'saving',20000);

insert into account_details(customer_name,acc_no,acc_type,available_balance)
values('sandhi',11144,'salaried',21000);

insert into account_details(customer_name,acc_no,acc_type,available_balance)
values('prabha',11155,'saving',40000);

------------display the account details and customer name in ascending order------
select * from account_details order by customer_name ASC;

---------------available balance less than or equal to 20000------------
select customer_name,available_balance from account_details where available_balance<=20000;

------------------display account type which are saving account------------------
select acc_no,acc_type,available_balance from account_details where acc_type='saving';

-------------display maximum available balance--------------------------
select max(available_balance) from account_details;

---------------display customer name having minimum balance-------------
select customer_name from account_details where available_balance=(select min(available_balance) from account_details);

------------count the number of customers-------------- 
select count(*) from account_details;

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

--insert into loan_details(customer_id,customer_name,branch_name,loan_no,amount)
--values(235,'prabha','sulur','A5F5690981',145000);


select *from loan_details;

select * from account_details a,loan_details l where l.customer_name=a.customer_name;

create table credit_card(
-- customer_id number not null,
credit_card_no number not null,
acc_no number not null,
limit_no number not null,
expiry_date date not null,
created_date date default sysdate,
emergency number,
blocked number,
constraint emergency_ck check(emergency in (1,0)),
constraint blocked_ck check(blocked in (1,0)),
constraint expiry_date_ck check(expiry_date>created_date),
--constraint customer_card_uq unique(customer_id),
constraint credit_card_no_uq unique(credit_card_no),
constraint acc_no_uq unique(acc_no),
constraint acc_no_fk foreign key (acc_no) references account_details(acc_no)
--constraint acc_no_uq unique(acc_no)
);

insert into credit_card(credit_card_no,acc_no,limit_no,expiry_date,emergency)
values(11110,11155,10000,to_date('20-12-2020','dd-MM-yyyy'),1);

insert into credit_card(credit_card_no,acc_no,limit_no,expiry_date,emergency)
values(21112,11133,15000,to_date('31-01-2020','dd-MM-yyyy'),0);

insert into credit_card(credit_card_no,acc_no,limit_no,expiry_date,emergency)
values(31114,11144,25000,to_date('09-04-2020','dd-MM-yyyy'),1);

insert into credit_card(credit_card_no,acc_no,limit_no,expiry_date,emergency)
values(31115,11122,25000,to_date('05-05-2020','dd-MM-yyyy'),0);

insert into credit_card(credit_card_no,acc_no,limit_no,expiry_date,emergency)
values(41116,11111,25000,to_date('02-09-2022','dd-MM-yyyy'),0);

update credit_card set blocked=1 where emergency=1 or (expiry_date>created_date);
update credit_card set blocked=0 where emergency=0 or (expiry_date<created_date);

select *from credit_card ;

create table beneficiary_list(
beneficiary_name varchar2(50),
acc_no_1 number not null,
IFSC_code varchar2(50) not null,
constraint acc_no__1_uq unique (acc_no_1),
constraint IFSC_code_uq unique(IFSC_code),
constraint beneficiary_name_pk primary key (beneficiary_name)
);

insert into beneficiary_list(beneficiary_name,acc_no_1,IFSC_code)
values('jeeva',123678954,'45SAFGYD76');

insert into beneficiary_list(beneficiary_name,acc_no_1,IFSC_code)
values('suba',7891234250,'87FGHGY87N');


insert into beneficiary_list(beneficiary_name,acc_no_1,IFSC_code)
values('sudha',542678192,'6568FDGD76');

insert into beneficiary_list(beneficiary_name,acc_no_1,IFSC_code)
values('devi',9875466437,'7GVHFVJK90');

select *from beneficiary_list;

create table transaction_details(
transaction_id number primary key,
beneficiary_acc_no number not null,
transaction_date date not null,
transaction_amount number not null,
created_date date default sysdate,
constraint transaction_date_ck check(transaction_date>created_date),
constraint beneficiary_acc_no_uq unique(beneficiary_acc_no),
constraint beneficiary_acc_no_fk foreign key(beneficiary_acc_no) references  beneficiary_list(acc_no_1)
);

insert into transaction_details(transaction_id,beneficiary_acc_no,transaction_date,transaction_amount)
values(1,123678954,to_date('31-01-2020','dd-MM-yyyy'),100);

insert into transaction_details(transaction_id,beneficiary_acc_no,transaction_date,transaction_amount)
values(2,7891234250,to_date('30-03-2020','dd-MM-yyyy'),200);

insert into transaction_details(transaction_id,beneficiary_acc_no,transaction_date,transaction_amount)
values(3,9875466437,to_date('13-02-2020','dd-MM-yyyy'),300);


select *from transaction_details order by transaction_id ASC;

update account_details set available_balance =  available_balance-(select transaction_amount from transaction_details where transaction_id = 1)
where acc_no = 11111;

update account_details set available_balance =  available_balance-(select transaction_amount from transaction_details where transaction_id = 2)
where acc_no = 11122;

update account_details set available_balance =  available_balance-(select transaction_amount from transaction_details where transaction_id = 3)
where acc_no = 11155;

select *from account_details;

