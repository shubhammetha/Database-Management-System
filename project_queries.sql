-- drop database mydb;
use mydb;
show tables;

select * from student;
CALL insert_student (7,'Shubh','Metha','1994-04-08','M',0029446688,'metha.s@neu.edu');

update student SET student_fname='Shubham' where idstudent=7;

-- delete from student where student_fname='shubh';

select * from staff;
select * from Student_has_Course_schedule;
CALL insert_staff
(444,'Gunter','Centralpark','1960-02-28','M','Program Director',1627384950,'gunter.c@neu.edu');

delete from staff where idstaff=444;
select * from Course_offered;

select * from course_schedule;
delete from Course_offered where Courses_offered_name='ADS';


select *  from Course_offered;
CALL insert_co('AED', 'Application Enginnering Development');
select * from course_offered_has_staff;

select * from student_has_course_schedule;


select * from course_schedule;
delete from course_schedule where idcourse_schedule=1;


select * from Area_of_research;
CALL insert_aor(2,'JAVA', 'Process of checking source code ');
delete from Area_of_research where idArea_of_research=2;

update Area_of_research set staff_idstaff=222 where idArea_of_research=2;

select * from Research_projects;

update Research_projects set project_id=1, project_name='Airliner',project_description=' Airline management system' 
where Area_of_research_Area_of_research_name='JAVA';

select * from Staff_has_Research_projects;
DELETE from Research_projects where Project_ID=1;
UPDATE Staff set Job_title='Dean' WHERE Staff_fname='Emma';

update Research_projects Set Project_ID=1, 
Project_name='Java coding', 
Project_description='Coding a program to design a university app' 
where Area_of_research_idArea_of_research=2;



select * from address_info;
CALL insert_address (405, 'NEU Street', 4,'Boston','MA',-484);
delete from address_info where idaddress=9;

drop trigger address_repeat;
desc address_info;

select now();


select * from department;

-- drop procedure updateCourse_schedule;
CALL updateCourse_schedule ('Sunday','11:30:00','AED');

CALL updateresearch_projects('Climate Data Online (CDO) Data Mining Project','Climate Data online or “CDO” provides access to climate data products through a simple, searchable online web mapping service','Data');

SELECT * From student_address;
SELECT * From Staff_has_Research_projects;

desc student;

select * from university;
select * from department;


call update_department ('Engineering Management', 7370);


select * from course_offered_has_staff;

update course_offered_has_staff set staff_idstaff=111 where Course_offered_Courses_offered_name='DMDD';

select * from student_address where STUDENT_NAME='Ross,Geller';

desc address_info;


update student SET Department_idDepartment= 300,Department_University_idUniversity=2000 where idstudent=3;

     
insert into Student_has_Course_schedule (Student_idStudent,Course_schedule_Course_offered_Courses_offered_name) 
values (4,'DMDD');
		
        
select * from course_student;
 select * from Student_has_Course_schedule;       
call student_courses(4,'DMDD'); 

call student_courses(1,'AED');

desc Staff_has_Area_of_research;

SET FOREIGN_KEY_CHECKS=0;

alter table Area_of_research modify column idArea_of_research int unique;
SET FOREIGN_KEY_CHECKS=1;

alter table Staff_has_Area_of_research modify column staff_idstaff int unique;

call university_info(3000,'Harvard Business School');

delete from department where iddepartment=301;


select * from course_student where course_name='AED';

CREATE USER 'student'@'localhost' IDENTIFIED BY 'student';
GRANT SELECT,INSERT,UPDATE ON mydb.student TO student@'localhost';
GRANT SELECT,INSERT,UPDATE ON mydb.course_offered TO student@'localhost';
GRANT SELECT,INSERT,UPDATE ON mydb.course_schedule TO student@'localhost';
GRANT SELECT,INSERT,UPDATE ON mydb.address_info TO student@'localhost';

-- drop user 'student'@'localhost';

CREATE USER 'staff'@'localhost' IDENTIFIED BY 'staff';
GRANT SELECT,INSERT,UPDATE ON mydb.staff TO staff@'localhost';
GRANT SELECT,INSERT,UPDATE ON mydb.course_offered TO staff@'localhost';
GRANT SELECT,INSERT,UPDATE ON mydb.course_schedule TO staff@'localhost';
GRANT SELECT,INSERT,UPDATE ON mydb.Area_of_research TO staff@'localhost';
GRANT SELECT,INSERT,UPDATE ON mydb.Research_projects TO staff@'localhost';
GRANT SELECT,INSERT,UPDATE ON mydb.address_info TO staff@'localhost';
GRANT SELECT ON mydb.student TO staff@'localhost';



select * from student_audit;
select * from Staff_has_Research_projects;

delete from staff where idstaff=444;

update staff set Department_idDepartment=200  where idstaff= 222;

desc Staff_has_Research_projects;

update Staff_has_Research_projects set Staff_idStaff=222 where Research_projects_Area_of_research_Area_of_research_name='JAVA'; 

update Area_of_research set Staff_idStaff=111 where idArea_of_research=1;

