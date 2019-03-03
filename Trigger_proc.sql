-- use mydb;
DELIMITER $$
CREATE TRIGGER student_BEFORE_INSERT
BEFORE INSERT ON student
FOR EACH ROW 
BEGIN
SET @Genderr:= NEW.gender;
	IF @Genderr LIKE 'M' OR @Genderr LIKE 'm' THEN
     SET NEW.gender:='M';
     ELSE IF @Genderr LIKE 'F' OR @Genderr LIKE 'f' THEN
     SET NEW.gender:='F';
     
     ELSE 
     signal sqlstinsert_addressate '22012' set message_text="Please enter 'M' for male and 'F' for female";
END IF;
END IF;
END; $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER staff_BEFORE_INSERT
BEFORE INSERT ON staff
FOR EACH ROW 
BEGIN
SET @Genderr:= NEW.gender;
	IF @Genderr LIKE 'M' OR @Genderr LIKE 'm' THEN
     SET NEW.gender:='M';
     ELSE IF @Genderr LIKE 'F' OR @Genderr LIKE 'f' THEN
     SET NEW.gender:='F';
     ELSE 
     signal sqlstate '45000' set message_text="Please enter 'M' for male and 'F' for female";
END IF;
END IF;
END; $$
DELIMITER ;

DESC Address_info;

-- drop trigger address_repeat;

DELIMITER $$
CREATE TRIGGER address_repeat
BEFORE INSERT ON Address_info
FOR EACH ROW
BEGIN
    SET @found = false;
    SELECT TRUE INTO @found from Address_info where Street_number=NEW.Street_number 
    AND Street_name=NEW.Street_name
    AND Apartment_number=NEW.Apartment_number
    AND City=NEW.city
    AND State=NEW.state
    AND Zipcode=NEW.zipcode
	;
    IF @found THEN
	signal sqlstate '45000' set message_text="Address already exists";
	END IF;
    END; $$
    DELIMITER 

DELIMITER $$   
create trigger negative_value 
before insert on address_info
for each row
begin
    SET @Zipcode:= NEW.zipcode;
    IF new.zipcode < 0 then
    signal sqlstate '45000' set message_text = "Trying to insert a negative value in table";
    end if;
end $$
DELIMITER 

DELIMITER $$
CREATE TRIGGER university_repeat
BEFORE INSERT ON University
FOR EACH ROW
BEGIN
    SET @found = false;
    SELECT TRUE INTO @found from University where idUniversity=NEW.idUniversity;
    IF @found THEN
	signal sqlstate '45000' set message_text="University already exsits";
	END IF;
    END; $$
    DELIMITER ;
    
-- drop trigger department_repeat;
    
DELIMITER $$
CREATE TRIGGER department_repeat
BEFORE INSERT ON Department
FOR EACH ROW
BEGIN
    SET @found = false;
    SELECT TRUE INTO @found from Department where Department_name=NEW.Department_name;
    IF @found THEN
	signal sqlstate '45000' set message_text="Department already exsits";
	END IF;
    END; $$
    DELIMITER ;
    
DELIMITER $$
CREATE TRIGGER student_update_info
BEFORE UPDATE ON student
FOR EACH ROW
BEGIN   
 INSERT INTO student_audit
 SET action='Update',
 idstudent= OLD.idstudent,
 student_fname=old.student_fname,
 student_lname=old.student_lname,
 Student_phone=old.Student_phone,
 Student_email=old.Student_email,
 changedate=now();
 END; $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER staff_delete_info
BEFORE DELETE ON staff
FOR EACH ROW
BEGIN   
 INSERT INTO staff_audit
 SET action='Delete',
 idStaff= OLD.idStaff,
 Staff_fname=old.Staff_fname,
 Staff_lname=old.Staff_lname,
 Job_title=old.Job_title,
 Phone_number=old.Phone_number,
 Email_id=old.Email_id,
 changedate=now();
 END; $$
DELIMITER ;

select * from course_student;