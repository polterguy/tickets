/*
 * SQLite script creating the primary tickets database.
 */

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
 * Contains all priority types in the system.
 */
create table priorities (
  name varchar(50),
  primary key (name)
);

insert into priorities(name) values ('Low');
insert into priorities(name) values ('Normal');
insert into priorities(name) values ('High');
insert into priorities(name) values ('Critical');

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
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  created datetime not null default current_timestamp,
  user nvarchar(256) not null,
  priority nvarchar(50) not null default 'Normal',
  status varchar(50),
  department varchar(50),
  title varchar(2048) not null,
  description text not null,
  constraint tickets_status_fky foreign key (status) references status (name),
  constraint tickets_departments_fky foreign key (department) references departments (name)
);

/*
 * Contains discussions about tickets in the system.
 */
create table messages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ticket int(11) not null,
  created datetime not null default current_timestamp,
  user nvarchar(256) not null,
  description text not null,
  constraint messages_tickets_fky foreign key (ticket) references tickets (id)
);
