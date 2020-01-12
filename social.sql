create database if not exists social;

use social;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users (
	username varchar (20) not null,
	email varchar(25) not null,
	password varchar(25) not null,
	first_name varchar(15) not null,
	last_name varchar(20),
	primary key (username)
);

create table posts (
	postid int(10) not null auto_increment,
	username varchar (20) not null,
	ts timestamp not null,
	the_post varchar(255) not null,
	primary key (postid),
	foreign key (username) references users(username)
);

create table comments (
	commentid int(10) not null auto_increment,
	username varchar (20) not null,
	postid int(10) not null,
	ts timestamp not null,
	the_comment varchar(255) not null,
	primary key (commentid),
	foreign key (username) references users(username),
	foreign key (postid) references posts(postid)
);