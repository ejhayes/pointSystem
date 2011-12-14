
set foreign_key_checks = 0;
drop table if exists points;
drop table if exists users;
drop table if exists asp_sessions;
set foreign_key_checks = 1;

create table asp_sessions (
  session_id   char(32) not null primary key,
  session_data blob,
  created_on   datetime default null,
  modified_on  datetime default null
) engine=innodb charset=utf8;

create table users (
	user_id integer unsigned not null primary key auto_increment,
	name varchar(50) not null
) engine=innodb charset=utf8;

create table points (
	point_id integer unsigned not null primary key auto_increment,
	user_id integer unsigned not null,
	reason varchar(255) not null,
	points integer not null,
	created_on timestamp not null,
	unique(user_id,reason),
	foreign key fk_points_to_users(user_id) references users (user_id) on delete restrict
) engine=innodb charset=utf8;