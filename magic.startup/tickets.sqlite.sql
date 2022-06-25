/*
 * SQLite script creating the primary tickets database.
 */

PRAGMA foreign_keys = ON;

/*
 * Contains all status types in system.
 */
create table status (
  name varchar(50) primary key
);

insert into status(name) values ('Open');
insert into status(name) values ('Closed');

/*
 * Contains all priority types in the system.
 */
create table priorities (
  name varchar(50) primary key
);

insert into priorities(name) values ('Low');
insert into priorities(name) values ('Normal');
insert into priorities(name) values ('High');
insert into priorities(name) values ('Critical');

/*
 * Contains all departments in system.
 */
create table departments(
  name varchar(50) primary key
);

insert into departments(name) values ('Tech');
insert into departments(name) values ('Invoicing');


/*
 * Contains all tickets in system.
 */
create table tickets (
  id integer primary key autoincrement,
  created datetime not null default current_timestamp,
  user nvarchar(256) not null,
  priority varchar(50) not null,
  status varchar(50) not null,
  department varchar(50) not null,
  title varchar(2048) not null,
  description text not null,
  foreign key (status) references status (name),
  foreign key (department) references departments (name),
  foreign key (priority) references priorities (name)
);

/*
 * Contains discussions about tickets in the system.
 */
create table messages (
  id integer primary key autoincrement,
  ticket int(11) not null,
  created datetime not null default current_timestamp,
  user nvarchar(256) not null,
  description text not null,
  foreign key (ticket) references tickets (id)
);
