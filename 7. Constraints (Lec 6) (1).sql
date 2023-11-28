

###   Constraints
use excelr_session;

desc students;
drop table batch;

create table batch
(sid int unique, 
sname varchar(50) not null, 
age int check(age>21), 
course varchar(50) default "MySQL");

select * from batch;
desc batch;

insert into batch 
(sid, sname, age)
values(1,"Amey",25);

select * from batch;

insert into batch
(sid, sname, age)
values(null, "Arun", 25);

insert into batch
(sid, sname, age)
values(2, null, 25);

insert into batch
(sid, sname, age)
values(3, "Priya", 19);

insert into batch
values(4, "John", 25, "Excel");

select * from batch;


desc students;

select * from students;

##  To create a NOT NULL constraint on the "Sid" column when the "Students" table is already created.

alter table batch
modify column sid int not null;

alter table students
add constraint primary key (s_id) ; 
    
alter table students
add constraint check (age > 18) ; 
    
insert into students
values(4, "John", 15, "Excel");

alter table students
add constraint unique(s_id);

select * from students;

insert into students
values(4, "John", 31, "Excel");


use excelr_session;    
    
create table authors
(aid integer primary key, 
name varchar(70));

insert into authors values(1,"J K Rowling");
insert into authors values(2,"Thomas Hardy");
insert into authors values(3, "Oscar Wilde");
insert into authors values(4, "Sidney Sheldon");
insert into authors values(5, "Alistair Maclean");
insert into authors values(6, "Jane Austen");
insert into authors values(7, "Chetan Bhagat");
insert into authors values(8,"Oscar Wilde");
select * from authors;

create table books(
booksid integer primary key, 
Title varchar(70), 
Authorid integer,foreign key(authorid) references authors(aid)
);

insert into Books values(1, "Harry Potter and the philosophers stone",1);
insert into Books values(2, "Harry Potter and the Chambers of Secrets",1);
insert into Books values(3, "harry Potter and the half blood prince",1);
insert into Books values(4, "Harry Potter and the goblet of fire",1);
insert into Books values(5, "Night Without End", 5);
insert into Books values(6, "Where Eagles Dare", 5);
insert into Books values(7, "Fear is the key",5);
insert into Books values(8, "Sense and Sensibility",6);
insert into Books values(9, "Pride and Prejudice",6);
insert into Books values(10,"Emma",6);
insert into Books values(11, "Five Point Someone",7);
insert into Books values(12, "Two States",7);
insert into Books values(13, "Salome", 8);
insert into Books values(14, "The Happy Prince",8);
insert into Books values(15, "King George",null);



select* from authors;
select * from books;

update authors 
set aid = 15
where aid =1;


delete from authors where aid = 1;
delete from books where booksid = 1;

drop table authors;
drop table books;

create table books(booksid integer primary key, 
Title varchar(70), 
Authorid integer,foreign key(authorid) references authors(aid)
on delete cascade );

create table books(booksid integer primary key, 
Title varchar(70), 
Authorid integer,foreign key(authorid) references authors(aid)
on update cascade);

create table books(booksid integer primary key, 
Title varchar(70), 
Authorid integer,foreign key(authorid) references authors(aid)
on delete set null);
