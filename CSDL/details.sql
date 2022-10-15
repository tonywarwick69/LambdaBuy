create database details;
use details;
create table student_data(
	id int not null primary key,
    name nvarchar(100) null,
    branch nvarchar(100) null,
    percentage int null,
    email nvarchar(100) null
)
