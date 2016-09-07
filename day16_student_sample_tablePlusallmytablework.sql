drop table if exists assignment;

drop table if exists student;

create table student (
	id int primary key,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	years_of_experience int not null,
	start_date date not null
);

insert student values(100,'Eric','Ephram',2,'2016-03-31');
insert student values(110,'Greg','Gould',6,'2016-09-30');
insert student values(120,'Adam','Ant',5,'2016-06-02');
insert student values(130,'Howard','Hess',1,'2016-02-28');
insert student values(140,'Charles','Caldwell',7,'2016-05-07');
insert student values(150,'James','Joyce',9,'2016-08-27');
insert student values(160,'Doug','Dumas',13,'2016-07-04');
insert student values(170,'Kevin','Kraft',3,'2016-04-15');
insert student values(180,'Frank','Fountain',8,'2016-01-31');
insert student values(190,'Brian','Biggs',4,'2015-12-25');

create table assignment (
	id int primary key, 
	student_id int not null,
	assignment_nbr int not null,
	grade_id int not null, 
	index student_id_idx (student_id), 
	foreign key (student_id) references student(id)
	foreign key (grade_id) references grade(gid)
);
create table grade (
	gid int primary key NOT NULL,
	description varchar(30), 
	FOREIGN KEY (gid) REFERENCES assignment(grade_id)
	--says that the foreign key needs to poin to a prim key in another table not any key
);
create table grade (
	gid int primary key,
	description varchar(30)
	);
alter table assignment add foreign key (grade_id) references grade(gid);
CREATE TABLE Orders
(
O_Id int NOT NULL,
OrderNo int NOT NULL,
P_Id int,
PRIMARY KEY (O_Id),
FOREIGN KEY (P_Id) REFERENCES Persons(P_Id)
)
--==============================
insert grade values(1,'Incomplete');
insert grade values(2,'Complete and unsatisfactory');
insert grade values(3,'Complete and satisfactory');
insert grade values(4,'Exceeds expectations');
insert grade values(5,'Not graded');

--=================================

insert assignment values(11,100,9,2);
insert assignment values(12,110,9,1);
insert assignment values(13,120,9,4);
insert assignment values(14,130,9,5);
insert assignment values(15,140,9,3);
	insert assignment values(16,100,11,4);
insert assignment values(17,110,11,3);
insert assignment values(18,120,11,2);
insert assignment values(19,130,11,5);
insert assignment values(20,140,11,5);
-- ncomplete
-- Complete and unsatisfactory
-- Complete and satisfactory
-- Exceeds expectations
-- Not graded
--========================
-- Pro Challenge

-- Add the contraint to the assignment table that prohibits creating an assignment without an associated student row;

-- Hint!: In MySql, for foreign keys to be enforced, there must be an index on the column that is the forgeign key.
-- insert assignment values(21,200,11,4); fails
-- 	===================
-- 	Pro+ Challenge

-- Create the major table for students to declare their major. Modify the student to hold the major they've delared.

-- Create the classToMajor table with classes like English 101, Algebra 117, History 218, etc. The create a relationship of class required for a particular major.

-- Create a relationship between student and class to hold the classes that a student has taken.

-- Produce a report showing a student the classes required by the major that (s)he has has not taken.

create table major (
	mid int primary key,
	majorname varchar(30) 
);
insert major values(1,"TIY-lvlA");
insert major values(2,"TIY-lvlB");
insert major values(3,"TIY-lvlC");
insert major values(4,"TIY-lvlD");
alter table student add column major_id int;
alter table student add foreign key (major_id) references major(mid);
create table class (
	classid int primary key,
	description varchar(30) NOT NULL
);
insert class values(1,"Intro");
insert class values(2,"4 week");
insert class values(3,"12 week");
insert class values(4,"16 week");
create table classToMajor (
	id int NOT NULL AUTO_INCREMENT,
	majorid int NOT NULL,
	classid int NOT NULL,
	FOREIGN KEY (majorid) REFERENCES major(mid),
	FOREIGN KEY (classid) REFERENCES class(classid),
	PRIMARY KEY (id)
);
insert into classToMajor (majorid,classid) values(1,1);
insert classToMajor values(2,2);
insert classToMajor values(2,1);
insert classToMajor values(3,3);
insert classToMajor values(3,1);
insert classToMajor values(4,4);
insert classToMajor values(4,1);
insert classToMajor values(4,2); 
	--this doesn't work
---this works
	insert into classToMajor (majorid,classid) values (1,1),(2,2),(2,1),(3,3),(3,1),(4,4),(4,1),(4,2);

create table studentToClass (
	id int NOT NULL AUTO_INCREMENT,
	studentid int NOT NULL,
	class_id int NOT NULL,
	FOREIGN KEY (studentid) REFERENCES student(id),
	FOREIGN KEY (class_id ) REFERENCES class(classid),
	PRIMARY KEY (id)
);
insert into studentToClass (studentid,class_id) values (100,1),(110,1),(120,1),(130,1),(140,1),(150,1),(150,2),(160,1),(160,3),(170,1),(180,1),(190,2);
select class_id from classesTaken where student_id = 190
select class_id from studentToClass where studentid = 150;
select classid from classToMajor where majorid = 4;