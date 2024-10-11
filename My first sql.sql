-- creating students table
create table Students(
StudentID integer Primary Key,
FirstName Varchar (50),
LastName Varchar (50),
DateOfBirth Date,
EnrollmentDate Date,
Email Varchar(100),
Age Integer
);

-- creating Courses table
create table Courses(
CourseID integer Primary Key,
CourseName Varchar (100),
Credits Integer,
Department Varchar(50)
);

--creating enrollments table 
create table Enrollments (
EnrollmentID integer primary key,
StudentID integer Foreign Key  references Students ,
CourseID integer Foreign Key  references Courses ,
Grade Char (2),
Semester Varchar (10)
);

--creating professors table
create table Professors(
ProfessorID integer Primary Key ,
FirstName Varchar (50),
LastName Varchar (50),
Department Varchar (50),
Email Varchar (100)
);

--creating CourseAssignments table
create table CourseAssignments(
AssignmentID integer Primary Key ,
ProfessorID integer Foreign Key  references Professors ,
CourseID integer Foreign Key  references Courses ,
Semester Varchar (10)
);

--inserting data to students table
insert into Students (StudentID,FirstName,LastName,DateOfBirth,EnrollmentDate,Email,Age)
values
(1, 'John', 'Doe', '2000-01-01', '2018-09-01', 'john.doe@example.com',25),
(2, 'Jane', 'Smith', '1999-05-15', '2017-09-01', 'jane.smith@example.com',21),
(3, 'Robert', 'Brown', '2001-11-21', '2019-09-01', 'robert.brown@example.com',25),
(4, 'Emily', 'Jones', '2002-03-03', '2020-09-01', 'emily.jones@example.com',22),
(5, 'Michael', 'Davis', '1998-07-22', '2016-09-01', 'michael.davis@example.com',23),
(6, 'Linda', 'Wilson', '2000-12-12', '2018-09-01', 'linda.wilson@example.com',21),
(7, 'James', 'Taylor', '2001-03-14', '2019-09-01', 'james.taylor@example.com',22),
(8, 'Sarah', 'Lee', '2002-07-07', '2020-09-01', 'sarah.lee@example.com',23),
(9, 'David', 'Martin', '1999-11-11', '2017-09-01', 'david.martin@example.com',24),
(10, 'Susan', 'Clark', '2001-05-05', '2019-09-01', 'susan.clark@example.com',22);

--inserting data to Courses table
insert into Courses (CourseID,CourseName,Credits,Department)
values
(1, 'Introduction to SQL', 3, 'Computer Science'),
(2, 'Data Structures', 4, 'Computer Science'),
(3, 'Database Management Systems', 3, 'Information Technology'),
(4, 'Algorithms', 4, 'Computer Science'),
(5, 'Operating Systems', 3, 'Information Technology'),
(6, 'Web Development', 3, 'Computer Science'),
(7, 'Computer Networks', 3, 'Information Technology');

--inserting data into enrollments table
insert into Enrollments (EnrollmentID,StudentID,CourseID,Grade,Semester)
values
(1, 1, 2, 'A', 'Fall2020'),
(2, 2, 3, 'B+', 'Spring2021'),
(3, 3, 2, 'A-', 'Fall2021'),
(4, 4, 3, 'B', 'Spring2022'),
(5, 2, 2, 'A', 'Fall2020'),
(6, 5, 1, 'B+', 'Fall2020'),
(7, 6, 4, 'A', 'Spring2021'),
(8, 7, 5, 'B', 'Fall2021'),
(9, 8, 6, 'A-', 'Spring2022'),
(10, 9, 7, 'B+', 'Fall2020'),
(11, 10, 1, 'A', 'Spring2021'),
(12, 1, 3, 'B', 'Spring2021'),
(13, 2, 4, 'A-', 'Fall2021'),
(14, 3, 5, 'B+', 'Spring2022'),
(15, 4, 6, 'A', 'Fall2020');

--inserting date to Professors table
insert into  Professors (ProfessorID,FirstName,LastName,Department,Email)
values
(1, 'Dr. Alice', 'Johnson', 'Computer Science', 'alice.johnson@example.com'),
(2, 'Dr. Bob', 'Miller', 'Information Technology', 'bob.miller@example.com'),
(3, 'Dr. Carol', 'Williams', 'Computer Science', 'carol.williams@example.com'),
(4, 'Dr. David', 'Jones', 'Information Technology', 'david.jones@example.com'),
(5, 'Dr. Emma', 'Brown', 'Computer Science', 'emma.brown@example.com');

--inserting data to CourseAssinments Table
insert into CourseAssignments (AssignmentID,ProfessorID,CourseID,Semester)
values
(1, 1, 1, 'Fall2020'),
(2, 1, 2, 'Spring2021'),
(3, 2, 3, 'Fall2020'),
(4, 3, 2, 'Spring2022'),
(5, 4, 4, 'Fall2021'),
(6, 5, 5, 'Spring2022'),
(7, 1, 6, 'Fall2020'),
(8, 2, 7, 'Spring2021');

update Students
	set Email = 'MennaSelim@gmail.com'
	where StudentID = 1
	

delete from Students
where StudentID = 5 

select * from Students

select FirstName,LastName
from Students
where EnrollmentDate>'2018-01-01'

select COUNT(StudentID) as Number_of_Students
from Students

select * from Courses

select CourseName,Credits 
from Courses
where Department='Computer Science'

Select Sum(Credits) as TotalCredits
from Courses
where Department='Information Technology'

select S.FirstName,S.LastName,C.CourseName
from Students S, Courses C

select S.firstName,s.LastName,c.CourseName
from Students S
inner join Enrollments E
on s.StudentID=e.StudentID
inner join Courses C
on c.CourseID=e.CourseID


select C.CourseName, count(E.StudentID)
from Courses C
inner join Enrollments E
on C.CourseID=E.CourseID
group by c.CourseName
having count(E.StudentID) >1

select *
from Students
order by EnrollmentDate desc

select FirstName,LastName,StudentID
from Students
where StudentID not in (select distinct StudentID from Enrollments)

select Department ,AVG(Credits) as AverageCredits
from Courses
group by Department

select Students.FirstName,Students.LastName,Courses.CourseName,Enrollments.Grade
from  Students
left join Enrollments on Enrollments.StudentID=Students.StudentID
left join Courses on Enrollments.CourseID= Courses.CourseID
where Enrollments.Semester='Fall2020'

select C.CourseName, count(E.StudentID) as NumberOfStudents
from Courses C
left join Enrollments E
on C.CourseID=E.CourseID
group by C.CourseName

select S.FirstName,s.LastName,C.CourseName,E.Grade
from Students S
left join Enrollments E
on S.StudentID=E.StudentID
left join Courses C
on E.CourseID= C.CourseID
where E.Grade >'B'

select s.FirstName,s.LastName,count(e.EnrollmentID) as NumberOFENrollments
from Students S
Left join Enrollments E
on S.StudentID=E.StudentID
group by s.FirstName,s.LastName

select C.CourseName ,count(e.EnrollmentID) as NumberOFENrollments
from Courses C
Left join Enrollments E
on C.CourseID=E.CourseID
--where E.EnrollmentID is Null
group by C.CourseName
having count(e.EnrollmentID) <1


select top 3 S.StudentID,S.FirstName,S.LastName,Count(E.EnrollmentID) as Number_Of_Students
from Students S
left join Enrollments E
on S.StudentID =E.StudentID
group by S.StudentID,S.FirstName,S.LastName
order by Count(E.EnrollmentID) Desc

select p.FirstName,p.LastName,c.CourseName
from Professors P
left join CourseAssignments CA
on P.ProfessorID = CA.ProfessorID
left join Courses C
on CA.CourseID = C.CourseID

select Department,count (distinct ProfessorID) AS Number_OF_Professors
from Professors 
Group by Department

select *
from Courses
order by Credits asc

select p.FirstName,p.LastName,count( ca.CourseID) as Number_of_Courses
from Professors P
left Join CourseAssignments CA
on P.ProfessorID=ca.ProfessorID
group by p.FirstName,p.LastName
having count( ca.CourseID)>1

select s.FirstName,s.LastName,c.CourseName,p.FirstName,p.LastName
from Students S
inner join Enrollments E
on S.StudentID= E.StudentID
inner Join Courses C
on C.CourseID=E.CourseID
inner join CourseAssignments CA
on CA.CourseID=C.CourseID
inner Join Professors P
on P.ProfessorID=CA.ProfessorID
where P.FirstName='Dr. Alice' and P.LastName='Johnson'

select S.StudentID,sum(c.Credits) as TotalCreidts
from Students S
left join Enrollments  E
on S.StudentID=E.StudentID
left join Courses C
on E.CourseID=C.CourseID
group by  S.StudentID
having sum(c.Credits) >0


select c.CourseName, count(e.StudentID) as Student_Count
from Courses C
left Join Enrollments E
on C.CourseID= E.CourseID
where e.Semester='Spring2021'
group by c.CourseName

select c.CourseName,c.Department
from Courses C
left join Enrollments E
on C.CourseID = E.CourseID
where e.Semester='Spring2021'

select S.FirstName,S.LastName,max(S.EnrollmentDate) as Last_Enrollment_Date
from Students S
left join Enrollments E
on S.StudentID=E.StudentID
group by S.FirstName,S.LastName

--Q31
select S.FirstName,S.LastName,C.CourseName
from Students S
left join Enrollments E
on S.StudentID=E.StudentID
left Join Courses C
on E.CourseID=C.CourseID
where C.CourseName='Data Structures'

--Q32
--repeated

--Q33
Select s.FirstName,s.LastName,c.CourseName,e.Grade
from Students S
left join Enrollments E
on S.StudentID=E.StudentID
left join Courses C
on C.CourseID=e.CourseID
where e.Grade is not Null

--Q35
create view EnrollmentSummary as
select S.StudentID,S.FirstName,S.LastName,C.CourseName,C.CourseID,E.Grade
from Students S
inner Join Enrollments E
on S.StudentID=E.StudentID
inner Join Courses C
on C.CourseID=E.CourseID
select * from EnrollmentSummary

--Q36
Select E.CourseID,C.CourseName,Avg(S.Age) as Average_Age
from Students S
inner join Enrollments E
on S.StudentID=E.StudentID
inner join Courses C
on C.CourseID=E.CourseID
Group by E.CourseID,C.CourseName

--Q37
Select C.CourseName , min(E.Grade) AS max_grade,MAX(E.grade) as Min_Grade
from Courses C
inner join Enrollments E
on C.CourseID=E.CourseID
Group By C.CourseName 

--Q38
Select C.CourseName ,avg( case when E.Grade like '%A%' then 4
when E.Grade like '%B%' then 3
when E.Grade like '%C%' then 2
when E.Grade like '%D%' then 1
else 0
end) AS Average_GPA
from Courses C
inner join Enrollments E
on C.CourseID=E.CourseID
Group by C.CourseName

--Q39
Select C.CourseName ,Sum( case when E.Grade like '%A%' then 4
when E.Grade like '%B%' then 3
when E.Grade like '%C%' then 2
when E.Grade like '%D%' then 1
else 0
end) AS Total_Grades
from Courses C
inner join Enrollments E
on C.CourseID=E.CourseID
Group by C.CourseName






