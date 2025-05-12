--create the department table
create table Departments(
departmentID int auto_increment primary key,
departmentName varchar(100) not null unique
);
--create the student table
create table Students (
studentID int auto_increment primary key,
fullName varchar(100) not null,
email varchar(100) not null unique,
phoneNumber varchar(20),
dateofBirth date,
gender enum('male','female') not null,
departmentID int,
foreign key(departmentID) references Departments(departmentID)
);

--create the instructor table
create table Instructors(
instructorID int auto_increment primary key,
fullName varchar(100) not null,
email varchar (100) not null unique,
hireDate date,
departmentId int,
foreign key(departmentID) references Departments(departmentID)
);

--create the courses table
create table Courses(
courseId int auto_increment primary key,
courseName varchar(100) not null,
credits int not null check(credits > 0),
departmentID int,
instructorID int,
foreign key(departmentID) references Departments(departmentID),
foreign key(instructorID) references Instructors(instructorID)
);

--create the enrollment table
create table Enrollments (
enrollmentID int auto_increment primary key,
studentID int,
courseID int,
enrollmentDate datetime not null default current_timestamp,
foreign key(studentID) references students(departmentID)
on delete cascade,
foreign key(courseID) references Courses(departmentID)
on delete cascade,
unique(studentID, courseID)
);

--create the grade table
create table grades (
gradeID int auto_increment primary key,
enrollmentId int,
grade enum('A','B','C','D','F','Incomplete') not null,
gradeDate datetime default current_timestamp,
foreign key(enrollmentID) references Enrollments(enrollmentID)
);
