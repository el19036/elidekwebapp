DROP DATABASE IF EXISTS elidekdb;
CREATE DATABASE elidekdb;
USE elidekdb;

CREATE TABLE program (
  program_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  program_name VARCHAR(90) NOT NULL,
  department VARCHAR(90) DEFAULT NULL,
  PRIMARY KEY (program_id));
   
CREATE TABLE employee(
  employee_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL ,
  PRIMARY KEY (employee_id));
  
  CREATE TABLE organization (
  org_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  org_name VARCHAR(60) NOT NULL,
  city VARCHAR(45) NULL,
  address VARCHAR(45) NULL,
  zip_code INT(5) NULL,
  initials VARCHAR(45) NOT NULL,
  organization_type VARCHAR(15) NOT NULL,
  ministry_funds INT(12) NULL,
  private_funds INT(12) NULL,
  equity INT(12) NULL,
  constraint has_type check(organization_type in ('Research_Center','Firm','University')),
  constraint budget  check((organization_type='Research_Center' AND equity=NULL) OR  (organization_type='University' AND equity=NULL 
AND private_funds=NULL) OR (organization_type='Firm' AND private_funds=NULL AND ministry_funds=NULL) OR 
(equity=NULL AND private_funds=NULL AND ministry_funds=NULL)),
    PRIMARY KEY (org_id)
    );


CREATE TABLE researcher (
  researcher_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NOT NULL,
  sex varchar(6) NOT NULL,
  constraint sex_value check (sex in ('male', 'female', 'other')),
  date_of_birth DATE,
  date_hired DATE,
  PRIMARY KEY (researcher_id),
  org_id int(10) UNSIGNED NOT NULL,
  CONSTRAINT researcher_works_for FOREIGN KEY (org_id) REFERENCES organization (org_id) ON UPDATE CASCADE
) ;

CREATE TABLE project(
  project_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  CONSTRAINT time_continuity CHECK (start_date < end_date),
  duration INT(1) NULL, 			-- tha to doume
  CONSTRAINT min_max_dur CHECK (duration>=1 AND duration<=4),
  funding INT(7) UNSIGNED NOT NULL,
  CONSTRAINT min_max_fund CHECK (funding>=100000 AND funding <= 1000000),
  project_title VARCHAR(45),
  project_description VARCHAR(255),
  employee_id INT(10) UNSIGNED NOT NULL,
  program_id INT(10) UNSIGNED NOT NULL,
  org_id int(10) UNSIGNED NOT NULL,
  researcher_id_sup INT(10) UNSIGNED NOT NULL,
  researcher_id_ev INT(10) UNSIGNED NOT NULL,
  evaluation INT(3) UNSIGNED NOT NULL, 
  CONSTRAINT score CHECK (evaluation >= 0 AND evaluation <= 100),
  evaluation_date DATE NOT NULL,
  CONSTRAINT eval_first CHECK (evaluation_date < start_date),
  CONSTRAINT sup_not_eval CHECK (researcher_id_sup <> researcher_id_ev),
  CONSTRAINT project_emp_id FOREIGN KEY (employee_id) REFERENCES employee (employee_id) ON UPDATE CASCADE,
  CONSTRAINT project_prog_id FOREIGN KEY (program_id) REFERENCES program (program_id) ON UPDATE CASCADE,
  CONSTRAINT project_id_org FOREIGN KEY (org_id) REFERENCES organization (org_id) ON UPDATE CASCADE,
  CONSTRAINT project_res_sup FOREIGN KEY (researcher_id_sup) REFERENCES researcher (researcher_id) ON UPDATE CASCADE,
  CONSTRAINT project_res_ev FOREIGN KEY (researcher_id_ev) REFERENCES researcher (researcher_id) ON UPDATE CASCADE,
  PRIMARY KEY(project_id)
  );
  
  CREATE TABLE research_field(
  project_id int(10) unsigned NOT NULL AUTO_INCREMENT, 
  CONSTRAINT res_field_id FOREIGN KEY (project_id) REFERENCES project (project_id) ON UPDATE CASCADE on delete cascade,
  field_name VARCHAR(100),
  CONSTRAINT pk_research_field PRIMARY KEY (project_id,field_name)
);

CREATE TABLE org_phone(
org_id int(10) unsigned not null,
constraint phone_org_id foreign key (org_id) references organization (org_id) on update cascade on delete cascade,
phone_number char(10) not null,
constraint pk_phone primary key (org_id, phone_number)
);
  
  CREATE TABLE works_on(
  project_id int(10) unsigned NOT NULL,
  researcher_id int(10) UNSIGNED NOT NULL,
  CONSTRAINT works_on_project FOREIGN KEY (project_id) REFERENCES project (project_id) ON UPDATE CASCADE on delete cascade,
  CONSTRAINT res_works_on FOREIGN KEY (researcher_id) REFERENCES researcher (researcher_id) ON UPDATE CASCADE on delete cascade,
  CONSTRAINT pk_works_on PRIMARY KEY (project_id,researcher_id)
  );
  
  CREATE TABLE deliverable(
  project_id int(10) unsigned NOT NULL,
  CONSTRAINT del_project FOREIGN KEY (project_id) REFERENCES project (project_id) ON UPDATE CASCADE on delete cascade,
  deliverable_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  deliverable_title VARCHAR(45) NOT NULL,
  deliverable_summary VARCHAR(255),
  delivery_date DATE NOT NULL,
  KEY (deliverable_id),
  CONSTRAINT pk_delivery PRIMARY KEY (project_id,deliverable_id)
  );


DELIMITER $
CREATE TRIGGER no_insider_evaluators_ins BEFORE INSERT ON project 
FOR EACH ROW
BEGIN
    IF ((SELECT COUNT(*) FROM researcher r
						 WHERE new.org_id = r.org_id AND r.researcher_id = new.researcher_id_ev ) > 0) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on project failed - A researcher cannot evaluate a project for their organization';
    END IF;
END$   
DELIMITER ; 

DELIMITER $
CREATE TRIGGER no_insider_evaluators_upd BEFORE UPDATE ON project 
FOR EACH ROW
BEGIN
    IF ((SELECT COUNT(*) FROM researcher r
						 WHERE new.org_id = r.org_id AND r.researcher_id = new.researcher_id_ev ) > 0) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on project failed - A researcher cannot evaluate a project for their organization';
    END IF;
END$   
DELIMITER ; 

DELIMITER $
CREATE TRIGGER researchers_work_on_their_orgs_projects BEFORE INSERT ON works_on 
FOR EACH ROW
BEGIN
    IF ((SELECT COUNT(*) FROM project p join researcher r
						 on p.org_id=r.org_id
						 WHERE p.project_id = new.project_id AND r.researcher_id = new.researcher_id) <> 1) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on_works on failed - A researcher is loyal and cannot work on foreign projects';
    END IF;
END$   
DELIMITER ; 

DELIMITER $
CREATE TRIGGER researchers_work_on_their_orgs_projects_upd BEFORE UPDATE ON works_on 
FOR EACH ROW
BEGIN
    IF ((SELECT COUNT(*) FROM project p join researcher r
						 on p.org_id=r.org_id
						 WHERE p.project_id = new.project_id AND r.researcher_id = new.researcher_id) <> 1) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on_works on failed - A researcher is loyal and cannot work on foreign projects';
    END IF;
END$   
DELIMITER ; 

DELIMITER $
CREATE TRIGGER project_belongs_to_org BEFORE update ON project 
FOR EACH ROW
BEGIN
    IF ((SELECT COUNT(*) FROM project WHERE old.org_id <> new.org_id) > 0) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint project on failed - the projects organization is unchangeable';
    END IF;
END$   
DELIMITER ; 

DELIMITER $
CREATE TRIGGER researcher_transfer BEFORE update on researcher
FOR EACH ROW
BEGIN
    IF (new.org_id<>old.org_id and( (SELECT COUNT(*) FROM works_on WHERE researcher_id = new.researcher_id) > 0 or
    (select count(*) from project where org_id = new.org_id  and researcher_id_ev = new.researcher_id) > 0)) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on researcher failed - A researcher has to drop his projects before he swaps org';
    END IF;
END$   
DELIMITER ; 

DELIMITER $
CREATE TRIGGER calc_duration_ins before INSERT ON project
FOR EACH ROW
BEGIN
set new.duration= DATEDIFF(new.end_date, new.start_date) / 365.25 ; 
END$   
DELIMITER ;

DELIMITER $
CREATE TRIGGER calc_duration_upd before update ON project
FOR EACH ROW
BEGIN
set new.duration= DATEDIFF(new.end_date, new.start_date) / 365.25 ; 
END$   
DELIMITER ;

DELIMITER $
CREATE TRIGGER deliver_on_time before insert ON deliverable
FOR EACH ROW
BEGIN
IF ((SELECT COUNT(*) FROM project WHERE project_id = new.project_id AND 
(new.delivery_date < start_date OR new.delivery_date > end_date )) > 0) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on deliverable failed - This is not Back to the Future';
    END IF;
END$   
DELIMITER ;

DELIMITER $
CREATE TRIGGER deliver_on_time_upd before update ON deliverable
FOR EACH ROW
BEGIN
IF ((SELECT COUNT(*) FROM project WHERE project_id = new.project_id AND 
(new.delivery_date < start_date OR new.delivery_date > end_date )) > 0) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on deliverable failed - This is not Back to the Future';
    END IF;
END$   
DELIMITER ;

DELIMITER $
CREATE TRIGGER add_supervisor_works_on_INSERT AFTER INSERT ON project 
FOR EACH ROW
BEGIN
    INSERT INTO works_on (project_id, researcher_id) VALUES (new.project_id, new.researcher_id_sup);
END$   
DELIMITER ;

DELIMITER $
CREATE TRIGGER add_supervisor_works_on_UPDATE AFTER UPDATE ON project 
FOR EACH ROW
BEGIN
    REPLACE INTO works_on 
    SET project_id = new.project_id, researcher_id = new.researcher_id_sup;
END$   
DELIMITER ;

DROP VIEW IF EXISTS researchersprojects;
CREATE VIEW researchersprojects AS
select r.researcher_id ,r.first_name, r.last_name, p.project_id, p.project_title
FROM researcher r 
INNER JOIN works_on w
ON r.researcher_id = w.researcher_id
INNER JOIN project p 
ON p.project_id = w.project_id
ORDER BY r.researcher_id;

DROP VIEW IF EXISTS organizationsresearchers;
CREATE VIEW organizationsresearchers AS
SELECT r.researcher_id, r.first_name, r.last_name, r.org_id, org.org_name
FROM researcher r
INNER JOIN
organization org
ON r.org_id = org.org_id
ORDER BY r.org_id ASC;

create index idx_field_name on research_field(field_name);
create index idx_projects_start_date on project(start_date);
create index idx_projects_end_date on project(end_date);
create index idx_researcher_org_id on researcher(org_id);
create index idx_project_org_id on project(org_id);
create index idx_project_researcher_id_ev on project(researcher_id_ev);