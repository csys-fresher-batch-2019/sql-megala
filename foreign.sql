drop table order_items;
drop table orders;
drop table books;
create table books( 
book_id_pk number primary key, 
book_name varchar2(30) not null, 
author_name varchar2(40) not null, 
price number not null, 
publisher varchar2(50) not null, 
version number, 
active number check(active in (1,0)), 
category_book varchar2(50) not null, 
constraint price_ck check(price>0) 
);
insert into books(book_id_pk,book_name,author_name,price,publisher,version,category_book,active) 
values(123,'cinderalla','queen',1500,'charuu',2,'comics',1);

insert into books(book_id_pk,book_name,author_name,price,publisher,category_book,active) 
values(456,'electronic devices','madhumitha',400,'pallavi','electronics',0);

insert into books(book_id_pk,book_name,author_name,price,publisher,version,category_book,active) 
values(789,'super man','henry',1000,'john',1,'comics',1);

create table orders(
order_id_pk number primary key,
username varchar2(30) not null,
ordered_date timestamp default sysdate not null,
delivered_date timestamp,
total_amount_ck number check(total_amount_ck>=0),
status_ck varchar2(50) check(status_ck in ('PENDING','CANCELLED','DELIVERED','NOT AVAILABLE'))
);
insert into orders (order_id_pk,username,total_amount_ck,status_ck)
values(111,'meg',1200,'DELIVERED');

create table order_items(
item_id number primary key,
order_id number,
book_id number,
quantity_ck number check(quantity_ck>0),
status_check varchar2(50) check(status_check in ('PENDING','CANCELLED','DELIVERED','NOT AVAILABLE')),
constraint book_id_fk foreign key (book_id) references books(book_id_pk),
constraint order_id_fk foreign key (order_id) references orders(order_id_pk)
);
insert into order_items(item_id,order_id,book_id,quantity_ck,status_check)
values(1,111,123,3,'DELIVERED');
drop table book_stock;
drop table order_items;
drop table orders;
drop table books;
create table books( 
book_id_pk number primary key, 
book_name varchar2(30) not null, 
author_name varchar2(40) not null, 
price number not null, 
publisher varchar2(50) not null, 
version number, 
active number check(active in (1,0)), 
category_book varchar2(50) not null, 
constraint price_ck check(price>0) 
);
insert into books(book_id_pk,book_name,author_name,price,publisher,version,category_book,active) 
values(123,'cinderalla','queen',1500,'charuu',2,'comics',1);

insert into books(book_id_pk,book_name,author_name,price,publisher,category_book,active) 
values(456,'electronic devices','madhumitha',400,'pallavi','electronics',0);

insert into books(book_id_pk,book_name,author_name,price,publisher,version,category_book,active) 
values(789,'super man','henry',1000,'john',1,'comics',1);

create table orders(
order_id_pk number primary key,
username varchar2(30) not null,
ordered_date timestamp default sysdate not null,
delivered_date timestamp,
total_amount_ck number check(total_amount_ck>=0),
status_ck varchar2(50) check(status_ck in ('PENDING','CANCELLED','DELIVERED','NOT AVAILABLE'))
);
insert into orders (order_id_pk,username,total_amount_ck,status_ck)
values(111,'meg',1200,'DELIVERED');

insert into orders (order_id_pk,username,total_amount_ck,status_ck)
values(222,'sandhi',2000,'PENDING');

insert into orders (order_id_pk,username,total_amount_ck,status_ck)
values(333,'bharu',3500,'DELIVERED');

create table order_items(
item_id number primary key,
order_id number,
book_id number,
quantity_ck number check(quantity_ck>0),
status_check varchar2(50) check(status_check in ('PENDING','CANCELLED','DELIVERED','NOT AVAILABLE')),
constraint book_id_fk foreign key (book_id) references books(book_id_pk),
constraint order_id_fk foreign key (order_id) references orders(order_id_pk)
);
insert into order_items(item_id,order_id,book_id,quantity_ck,status_check)
values(1,111,123,3,'DELIVERED');

insert into order_items(item_id,order_id,book_id,quantity_ck,status_check)
values(2,222,456,6,'PENDING');

insert into order_items(item_id,order_id,book_id,quantity_ck,status_check)
values(3,333,123,2,'DELIVERED');

create table book_stock(
stock_no number primary key,
book_id_1 number,
quantity_check number check(quantity_check>0)
); 
insert into book_stock(stock_no,book_id_1,quantity_check)
values(1,123,10);
insert into book_stock(stock_no,book_id_1,quantity_check)
values(2,456,8);
insert into book_stock(stock_no,book_id_1,quantity_check)
values(3,789,12);


select *from books;
select *from orders;
select *from order_items;
select *from book_stock;

select *from books;
select *from orders;
select *from order_items;
