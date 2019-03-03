use mydb;


-- query to get student information
select u.University_name, d.Department_name, concat_ws(', ',s.student_fname,s.student_lname) 
AS Student_Name, 
concat_ws(', ',a.Street_number, a.Street_name,a.Apartment_number,a.city,a.state,a.zipcode) 
AS Student_Address
from university u 
inner join department d
on u.iduniversity= d.University_idUniversity
inner join student s
on d.iddepartment=s.Department_idDepartment
INNER JOIN address_info a
on s.Address_idAddress=a.idaddress
order by Student_name;


-- query to get student registered for particular courses
select s.idstudent,s.student_fname as First_name,s.student_lname AS Last_name,
sc.Course_schedule_Course_offered_Courses_offered_name AS Course_name
from student s 
INNER JOIN Student_has_Course_schedule sc
on s.idstudent=sc.Student_idStudent;

-- query to get student schedule
select s.student_fname AS First_Name,s.student_lname AS Last_Name, 
sc.Course_schedule_Course_offered_Courses_offered_name AS Course_Name, cs.Week_days ,cs.Timing
from student s
inner join Student_has_Course_schedule sc
on sc.Student_idStudent=s.idstudent
inner join Course_schedule cs
on cs.Course_offered_Courses_offered_name=sc.Course_schedule_Course_offered_Courses_offered_name;

-- query to get staff and subject details
select staff_fname,staff_lname, Courses_offered_name
from staff s
inner join Course_offered_has_staff cos
on s.idstaff = cos.Staff_idStaff
inner join course_offered co
on co.Courses_offered_name=cos.Course_offered_Courses_offered_name;

select * from Course_offered_has_staff;

-- query to get staff details and project details
select staff_fname,staff_lname, Area_of_research_name,Project_name,project_description
from staff s
inner join Area_of_research aor
on s.idstaff=aor.staff_idstaff
inner join Research_projects rp
on  aor.idArea_of_research=rp.Area_of_research_idArea_of_research;

-- Audit table to backup old data for student
create table student_audit
(
   id INT auto_increment primary key,
  `idStudent` INT NOT NULL,
  `Student_fname` VARCHAR(45) NOT NULL,
  `Student_lname` VARCHAR(45) NOT NULL,
  `Student_phone` VARCHAR(10) NOT NULL,
  `Student_email` VARCHAR(45) NOT NULL,
  changedate datetime default null,
  action VARCHAR(45) default null
);

-- Audit table to backup deleted data for staff

create table staff_audit
(
   id INT auto_increment primary key,
  `idStaff` INT NOT NULL,
  `Staff_fname` VARCHAR(45) NOT NULL,
  `Staff_lname` VARCHAR(45) NOT NULL,
  `Job_title` VARCHAR(20) NOT NULL,
  `Phone_number` VARCHAR(10) NOT NULL,
  `Email_id` VARCHAR(45) NOT NULL,
  changedate datetime default null,
  action VARCHAR(45) default null
);


select s.student_fname AS First_Name,s.student_lname AS Last_Name, 
sc.Course_schedule_Course_offered_Courses_offered_name AS Course_Name, cs.Week_days ,cs.Timing
from student s
inner join Student_has_Course_schedule sc
on sc.Student_idStudent=s.idstudent
inner join Course_schedule cs
on cs.Course_offered_Courses_offered_name=sc.Course_schedule_Course_offered_Courses_offered_name;

