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
order_id number primary key,
username varchar2(30) not null,
book_id_pk number,
ordered_date timestamp default sysdate not null,
delivered_date timestamp,
total_amount_ck number check(total_amount_ck>=0),
quantity_ck number check(quantity_ck>0),
status_ck varchar2(50) check(status_ck in ('PENDING','CANCELLED','DELIVERED','NOT AVAILABLE')),
constraint book_id_fk foreign key (book_id_pk) references books(book_id_pk)
);
insert into orders (order_id,username,book_id_pk,total_amount_ck,quantity_ck,status_ck)
values(111,'meg',123,1200,2,'DELIVERED');

select *from books;
select *from orders;
