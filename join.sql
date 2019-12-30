drop table order_items;
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

insert into books(book_id_pk,book_name,author_name,price,publisher,version,category_book,active) 
values(156,'mario','wordworth',1200,'berlin',2,'thriller',0);


create table order_items(
item_id number primary key,
order_id number,
book_id number,
quantity_ck number check(quantity_ck>0),
status_check varchar2(50) check(status_check in ('PENDING','CANCELLED','DELIVERED','NOT AVAILABLE'))
--constraint book_id_fk foreign key (book_id) references books(book_id_pk)
);
insert into order_items(item_id,order_id,book_id,quantity_ck,status_check)
values(1,123,3,3,'DELIVERED');

insert into order_items(item_id,order_id,book_id,quantity_ck,status_check)
values(2,456,6,8,'PENDING');

insert into order_items(item_id,order_id,book_id,quantity_ck,status_check)
values(3,NULL,1,4,'DELIVERED');

insert into order_items(item_id,order_id,book_id,quantity_ck,status_check)
values(4,877,9,2,'DELIVERED');

-------------------JOINS------------------------

select * from books b,order_items o where b.book_id_pk=o.order_id;

--------------DISPLAY NECCESSARY DATA FIELDS IN ONE TABLE-------------------

select b.book_name,b.book_id_pk,b.author_name from books b,order_items o where b.book_id_pk=o.order_id;

-----------------------DISPLAY NECCESSARY FIELDS IN TWO TABLES---------

select b.book_name,b.book_id_pk,b.author_name, (select quantity_ck from order_items where b.book_id_pk=order_id)as orders from books b;

-----------------------DISPLAY NULL FIELDS-----------

select * from order_items where order_id is NULL;

---------------------LEFT OUTER JOIN-------------

select * from order_items o left outer join books b on book_id_pk=order_id;

---------------------RIGHT OUTER JOIN-------------

select * from order_items o right outer join books b on book_id_pk=order_id;

---------------------FULL OUTER JOIN-----------------------------------

select * from order_items o full outer join books b on book_id_pk=order_id;

 ------------------CROSS JOIN--------------------------------
 
 select *from books b,order_items o;
 

