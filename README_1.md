# Citibank App

## Feature 1:list the branch details

```sql
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

select *from branch order by branch_id ASC;

```

| BRANCH_ID  | BRANCH_NAME    | BRANCH_CITY |
|------------|----------------|-------------|
| 1000000012 | jayanagar      | bangalore   |
| 1000000014 | vandalur       | chennai     |
| 1000000015 | alwarpet       | chennai     |
| 1000000011 | singanallur    | coimbatore  |
| 1000000013 | ramanadhapuram | coimbatore  |


* count the number of branch_cities that are distinct

```sql
select count(distinct(branch_city)) from branch;
```

| COUNT(DISTINCT(BRANCH_CITY)) |
|------------------------------|
| 3                            |


* display the branch cities that are distinct

```sql
select distinct(branch_city) from branch;
```

| BRANCH_CITY |
|-------------|
| chennai     |
| coimbatore  |
| bangalore   |

## Feature 2:customer details

```sql
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

select *from customer_details order by customer_name ASC;
```

| CUSTOMER_NAME | CUSTOMER_ID | CUSTOMER_STREET | CUSTOMER_CITY |
|---------------|-------------|-----------------|---------------|
| bharu         | 609         | ambatturr       | chennai       |
| karthi        | 850         | irugur          | coimbatore    |
| prabha        | 235         | jayanagar       | bangalore     |
| sandhi        | 123         | ondipudur       | coimbatore    |
| surya         | 754         | madambakkam     | chennai       |


* display the customer cities that are in chennai

```sql
select *from customer_details where customer_city='chennai';
```

| CUSTOMER_NAME | CUSTOMER_ID | CUSTOMER_STREET | CUSTOMER_CITY |
|---------------|-------------|-----------------|---------------|
| surya         | 754         | madambakkam     | chennai       |
| bharu         | 609         | ambatturr       | chennai       |

* display the customer cities except coimbatore

```sql
select *from customer_details where customer_city != 'coimbatore';
```

| CUSTOMER_NAME | CUSTOMER_ID | CUSTOMER_STREET | CUSTOMER_CITY |
|---------------|-------------|-----------------|---------------|
| surya         | 754         | madambakkam     | chennai       |
| bharu         | 609         | ambatturr       | chennai       |
| prabha        | 235         | jayanagar       | bangalore     |

## Feature 3: display the account details

```sql
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

select * from account_details order by customer_name ASC;
```
| CUSTOMER_NAME | ACC_NO | BALANCE |
|---------------|--------|---------|
| karthi        | 11111  | 10000   |
| surya         | 11122  | 20000   |
| bharu         | 11133  | 30000   |
| sandhi        | 11144  | 40000   |
| prabha        | 11155  | 50000   |

* available balance less than or equal to 20000

```sql
select customer_name,available_balance from account_details where available_balance<=20000;
```

| CUSTOMER_NAME | AVAILABLE_BALANCE |
|---------------|-------------------|
| karthi        | 10000             |
| surya         | 15000             |
| bharu         | 20000             |

* display account type which are saving account

```sql
select acc_no,acc_type,available_balance from account_details where acc_type='saving';
```
| ACC_NO | ACC_TYPE | AVAILABLE_BALANCE |
|--------|----------|-------------------|
| 11122  | saving   | 15000             |
| 11133  | saving   | 20000             |
| 11155  | saving   | 40000             |

* display maximum available balance

```sql
select max(available_balance) from account_details;
```
| MAX(AVAILABLE_BALANCE) |
|------------------------|
| 40000                  |

* display customer name having minimum balance

```sql
select customer_name from account_details where available_balance=(select min(available_balance) from account_details);
```
| CUSTOMER_NAME |
|---------------|
| karthi        |

* count the number of customers

```sql
select count(*) from account_details;
```
| COUNT(*) |
|----------|
| 5        |

## Table 4: Loan _details
```sql
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
```
| CUSTOMER_ID | CUSTOMER_NAME | BRANCH_NAME | LOAN_NO    | AMOUNT  |
|-------------|---------------|-------------|------------|---------|
| 123         | sandhi        | irugur      | A1B2390981 | 100000  |
| 850         | karthi        | selayur     | A2B2560981 | 150000  |
| 754         | surya         | ambattur    | A3H3680981 | 1200000 |
| 609         | bharu         | maambakkam  | A4B2397681 | 100000  |
| 235         | prabha        | sulur       | A5F5690981 | 145000  |

* display the account details using join

```sql
select * from account_details a,loan_details l where l.customer_name=a.customer_name;
```

| CUSTOMER_NAME | ACC_NO | ACC_TYPE | AVAILABLE_BALANCE | CUSTOMER_ID | CUSTOMER_NAME | BRANCH_NAME | LOAN_NO    | AMOUNT  |
|---------------|--------|----------|-------------------|-------------|---------------|-------------|------------|---------|
| karthi        | 11111  | salaried | 10000             | 850         | karthi        | selayur     | A2B2560981 | 150000  |
| surya         | 11122  | saving   | 15000             | 754         | surya         | ambattur    | A3H3680981 | 1200000 |
| bharu         | 11133  | saving   | 20000             | 609         | bharu         | maambakkam  | A4B2397681 | 100000  |
| sandhi        | 11144  | salaried | 21000             | 123         | sandhi        | irugur      | A1B2390981 | 100000  |

## Feature 5:credit card

```sql
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

--------display acc_no in ascending order-------------
select *from credit_card order by acc_no ASC;
```
| CREDIT_CARD_NO | ACC_NO | LIMIT_NO | EXPIRY_DATE | CREATED_DATE | EMERGENCY | BLOCKED |
|----------------|--------|----------|-------------|--------------|-----------|---------|
| 41116          | 11111  | 25000    | 02-SEP-22   | 03-JAN-20    | 0         | 0       |
| 31115          | 11122  | 25000    | 05-MAY-20   | 03-JAN-20    | 0         | 0       |
| 21112          | 11133  | 15000    | 31-JAN-20   | 03-JAN-20    | 0         | 0       |
| 31114          | 11144  | 25000    | 09-APR-20   | 03-JAN-20    | 1         | 1       |


* display the credit card details when blocked is 0
```sql
select *from credit_card where blocked=0;
```
| CREDIT_CARD_NO | ACC_NO | LIMIT_NO | EXPIRY_DATE | CREATED_DATE | EMERGENCY | BLOCKED |
|----------------|--------|----------|-------------|--------------|-----------|---------|
| 21112          | 11133  | 15000    | 31-JAN-20   | 03-JAN-20    | 0         | 0       |
| 31115          | 11122  | 25000    | 05-MAY-20   | 03-JAN-20    | 0         | 0       |
| 41116          | 11111  | 25000    | 02-SEP-22   | 03-JAN-20    | 0         | 0       |

Feature 6: beneficiary list

```sql
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
```
| BENEFICIARY_NAME | ACC_NO_1   | IFSC_CODE  |
|------------------|------------|------------|
| jeeva            | 123678954  | 45SAFGYD76 |
| suba             | 7891234250 | 87FGHGY87N |
| sudha            | 542678192  | 6568FDGD76 |

## Feature 7: Transaction details

```sql
create table transaction_details(
transaction_id number primary key,
beneficiary_acc_no number not null,
transaction_date date not null,
transaction_amount number not null,
created_date date default sysdate,
constraint transaction_date_ck check(transaction_date>=created_date),
constraint beneficiary_acc_no_uq unique(beneficiary_acc_no),
constraint beneficiary_acc_no_fk foreign key(beneficiary_acc_no) references  beneficiary_list(acc_no_1)
);

insert into transaction_details(transaction_id,beneficiary_acc_no,transaction_date,transaction_amount)
values(1,123678954,to_date('31-01-2020','dd-MM-yyyy'),1000);

insert into transaction_details(transaction_id,beneficiary_acc_no,transaction_date,transaction_amount)
values(2,7891234250,to_date('30-03-2020','dd-MM-yyyy'),2000);

insert into transaction_details(transaction_id,beneficiary_acc_no,transaction_date,transaction_amount)
values(3,9875466437,to_date('13-02-2020','dd-MM-yyyy'),3000);

-----------display the transaction details in ascending order---------------
select *from transaction_details order by transaction_id ASC;
```
| TRANSACTION_ID | BENEFICIARY_ACC_NO | TRANSACTION_DATE | TRANSACTION_AMOUNT |
|----------------|--------------------|------------------|--------------------|
| 1              | 123678954          | 31-JAN-20        | 1000               | 
| 2              | 7891234250         | 30-MAR-20        | 2000               | 
| 3              | 9875466437         | 13-FEB-20        | 3000               |


* Updating the current balance after transaction

```sql
update account_details set available_balance =  available_balance-(select transaction_amount from transaction_details where transaction_id = 1)
where acc_no = 11111;

update account_details set available_balance =  available_balance-(select transaction_amount from transaction_details where transaction_id = 2)
where acc_no = 11122;

update account_details set available_balance =  available_balance-(select transaction_amount from transaction_details where transaction_id = 3)
where acc_no = 11155;

select *from account_details;
```
| CUSTOMER_NAME | ACC_NO | ACC_TYPE | AVAILABLE_BALANCE |
|---------------|--------|----------|-------------------|
| karthi        | 11111  | salaried | 9000              |
| surya         | 11122  | saving   | 13000             |
| bharu         | 11133  | saving   | 20000             |
| sandhi        | 11144  | salaried | 21000             |
| prabha        | 11155  | saving   | 37000             |
