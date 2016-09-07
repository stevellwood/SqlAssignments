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
Above from Day 16
=====================================================================================================================================
In our educational institution, like many colleges, we have a number of majors that we offer. Each of these majors has a minimum sat score that a student needs in order to enroll in this major. The sat score ranges from 400 to 1600. Students with a SAT score below the minimum for the major cannot enroll in that major.

Here are the names of all the majors offered and the minimum SAT score needed to enroll in them.

General Business (800)
Accounting (1000)
Finance (1100)
Math (1300)
Engineering (1350)
Education (900)
General Studies (500)
insert major values("gbs","General Business",800);
insert major values('acc',"Accounting",1000);
insert major values('fin','Finance',1100);
	insert major values('mat','Math',1300);
insert major values('eng','Engineering',1350);
	insert major values('fin','Education',900);
		insert major values('gen','General Studies',500);
create table major (
	id varchar (10) primary key,
	majorname varchar(30) NOT NULL,
	maj_minsat int,
	-- PRIMARY KEY (mid)
);
alter table major drop foreign key major
alter table student add foreign key (major_id) references major(mid);
alter table major change mid id varchar(10); -- doesn't work because of 2 foreign keys
http://stackoverflow.com/questions/838354/mysql-removing-some-foreign-keys
show create table of offending table with fk
ALTER TABLE classToMajor drop FOREIGN KEY classtomajor_ibfk_1,
  drop KEY classtomajor_ibfk_1;
-- We have a number of instructors that teach the classes. Information about instructors include first and last name (both varchar(30)),
--  which major they teach (fk to major), years of experience (int > 0), and whether they are tenured or not (tinyint: 0 or 1).
create table instructor (
	-- id int primary key AUTO_INCREMENT=1000,no work
	id int primary key AUTO_INCREMENT,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	specialty varchar(10),
	years_of_experience int, -- default null,
	tenured tinyint(1) default null,	
	-- FOREIGN KEY (id) REFERENCES major(id)
	FOREIGN KEY (specialty) REFERENCES major(id)
	-- PRIMARY KEY (id)
);
insert instructor values(1,'Von','Reich','eng',10,1);
	insert instructor values(null,'Tim','Sachs','fin',1,1); autoassigned 3
insert instructor values(3,"Count","Chalk",'acc',3,0);failed due to 3
insert instructor values(2,"Count","Chalk",'acc',3,0);
	insert instructor values(5,'Matthew','Calc','mat',25,0);
		insert instructor values(null,'Amy','Shriver','gbs',35,0);amy skipped over 4 and assigned 6
			insert instructor values(null,'Almsa','Wool','gen',1,0);
				insert instructor values(null,'Ernest','Hemingway','gen',6,0);
Create the new 'class' table
-- The institution offers a number of classes students can take. The classes are offered to fulfill the requirements
--  of the majors and include miscellaneous classes. There should be a foreign key in this table for the instructor who will teach the class.
-- Here are the classes offered:
-- English 101, 102, 103, 201, 202, 203, 301, 302, 303Math 201, 202, 203, 204, 301, 302, 303, 304History 101, 201, 301
-- Computer Science 311, 312, 313, 441, 442, 443History 101, 102, 231, 232Education 221, 222, 223, 351, 352, 353
create table class (
	id varchar(10) primary key,
	department varchar(30),
	instructor int,
	level int NOT NULL,
	FOREIGN KEY (instructor) REFERENCES instructor(id));
ALTER TABLE studentToClass drop FOREIGN KEY studenttoclass_ibfk_1,
alter table class change classid id varchar(10); 
alter table class change description department;//failed
alter table class change description department varchar(30);
alter table class add instructor int?? varchar;
foreign key (instructor) references instructor(id);
foreign key ('instructor') references instructor('id');//this did not work at first how did fix?
I dropped table then created at once

insert class values('e101','Eng',null,101); -- this just adds null and doesn't connect up even though I've already added instructor
	-- need to select id from instrcutor where last name = xyz
insert class values('e101','Eng',null,101);


-- Create the new major_class_relationionship table
-- Because a single major will have multiple classes required for it, and any one class may be required for multiple majors, it means there is 
-- a 'many-to-many' relationship between majors and classes. To model that relationship requires the creation of a new table. It is
--  traditional when creating this relationship table to use the names of both tables being related in the name. In this case, it could be named majorclassrelationship table. These types of table typcially have a primary key and the foreign keys from both tables. This table allows navigating by either table's data. It would typically be created like this:

-- id int primary key
-- major_id int not null
-- class_id int not null
-- Both the majorid and classid are foreign keys to their base tables.
create table classToMajor (
	id int NOT NULL primary key AUTO_INCREMENT,
	majorid varchar (10) NOT NULL,
	classid varchar (10) NOT NULL,
	FOREIGN KEY (majorid) REFERENCES major(id),
	FOREIGN KEY (classid) REFERENCES class(id)
	-- PRIMARY KEY (id)
	);
-- student_class_relationship table Students enroll in classes so they can get a grade for the class. Many of those classes are in their major. We need a way to indicate that a student 
-- has enrolled in a class. We can do that with this table.This table will show a relationship between a student and a class indicating that
--  the student has enrolled in that class. This table will look very similar to the majorclassrelationship table except that instead of major, 
--  it will be student. The class part will be the same.
create table studentToClass (
	id int PRIMARY KEY AUTO_INCREMENT,
	studentid int NOT NULL,
	class_id varchar (10) NOT NULL,
	FOREIGN KEY (studentid) REFERENCES student(id),
	FOREIGN KEY (class_id ) REFERENCES class(id),
	-- PRIMARY KEY (id)
);
insert into studentToClass (studentid,class_id) values (100,1),(110,1),(120,1),(130,1),(140,1),(150,1),(150,2),(160,1),(160,3),(170,1),(180,1),(190,2);

Changes to the 'student' table  In an effort to make this more of an typical education database, we're going to start with the student table and not 
assume that each student is a SSA employee. So will not track the years of experience anymore. Students do have a GPA so we'll add a column to 
calculate GPA which will have to handle a number with one decimal place.

Things to do to student: 
add gpa decimal(5.1) add sat int (range 400 to 1600) add major_id int (fk to major) remove yearsofexperience
-- alter table student add major_id int;
alter table student add gpa decimal(5.1);
-- 5 is the total precision and 1 is the numbers after decimal
alter table student add major_id varchar(10);
alter table student add foreign key (major_id) references major(id);
alter table student drop years_of_experience;

Changes to the 'assignment' table   Assignments are tied to a class. We need to add the foreign key to the class that the student has enrolled in.
add a foreign key to the 'class' table
-- asdf
alter table assignment add foreign key (forclass) references class(id);
-- or 
create table assignment (
	id int primary key, 
	student_id int not null,
	assignment_nbr int,
	grade_id int,
	forclass varchar (10),
	index student_id_idx (student_id), 
	foreign key (student_id) references student(id),
	-- foreign key (grade_id) references grade(id)
	foreign key (forclass) references class(id)
);
Advanced Challenge

-- Many of the classes have prerequisites that must be taken before certain classes. For example, it is likely 
-- that Math 201 must be taken before Math 202 and Math 202 must be taken before Math 203.
-- Enhance the database to include the prerequisites for the classes and assume that when classes in the same 
-- area are consequtively numbered, the lower numbered classes are prereqs to higher number classes.

create table prerequisites ( 
	id int NOT NULL primary key AUTO_INCREMENT,
	classfocus varchar (10),
	prerequisites varchar(10),
	foreign key (classfocus) references class(id)
	--foreign key (prerequisites ) references class(id)
	-- amsal says that this is not nec bc only one fk is needed to establish data consistency between tables.
	-- amsal: indexing is only  needed when the fk relationship can' be created manually like this I read it also establishes additional requirements when one tries to delete
)










select class_id from classesTaken where student_id = 190
select class_id from studentToClass where studentid = 150;
select classid from classToMajor where majorid = 4;