/*
 * MySQL script creating the primary tickets database.
 */

create database tickets;
use tickets;

/*
 * Contains all status types in system.
 */
create table status (
  name varchar(50),
  primary key (name)
);

insert into status(name) values ('Open');
insert into status(name) values ('Closed');

/*
 * Contains all departments in system.
 */
create table departments(
  name varchar(50),
  primary key (name)
);

insert into departments(name) values ('Tech');
insert into departments(name) values ('Invoicing');


/*
 * Contains all tickets in system.
 */
create table tickets (
  id int(11) not null auto_increment,
  created datetime not null default current_timestamp,
  user nvarchar(256) not null,
  priority int(11) not null default 5,
  status varchar(50),
  department varchar(50),
  title varchar(2048) not null,
  description text not null,
  constraint tickets_status_fky foreign key (status) references status (name),
  constraint tickets_departments_fky foreign key (department) references departments (name),
  primary key (id)
);

/*
 * Contains discussions about tickets in the system.
 */
create table messages (
  id int(11) not null auto_increment,
  created datetime not null default current_timestamp,
  user nvarchar(256) not null,
  description text not null,
  primary key (id)
);
