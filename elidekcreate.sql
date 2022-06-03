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
CREATE TRIGGER evaluator_doesnt_Work_On_INSERT BEFORE INSERT ON works_on 
FOR EACH ROW
BEGIN
    IF ((SELECT COUNT(*) FROM project WHERE project_id = new.project_id AND researcher_id_ev = new.researcher_id) > 0) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on works_on failed - A researcher cannot evaluate and work on the same project';
    END IF;
END$   
DELIMITER ;

DELIMITER $
CREATE TRIGGER evaluator_doesnt_Work_On_UPDATE BEFORE UPDATE ON works_on 
FOR EACH ROW
BEGIN
    IF ((SELECT COUNT(*) FROM project WHERE project_id = new.project_id AND researcher_id_ev = new.researcher_id) > 0) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on works_on failed - A researcher cannot evaluate and work on the same project';
    END IF;
END$   
DELIMITER ;

DELIMITER $
CREATE TRIGGER evaluator_doesnt_Work_UPDATE BEFORE UPDATE ON project 
FOR EACH ROW
BEGIN
    IF ((SELECT COUNT(*) FROM works_on WHERE project_id = new.project_id AND researcher_id = new.researcher_id_ev) > 0) THEN 
    SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on project failed - A researcher cannot evaluate and work on the same project';
    END IF;
END$   
DELIMITER ;

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
    IF (new.org_id<>old.org_id and (SELECT COUNT(*) FROM works_on WHERE researcher_id = new.researcher_id) > 0) THEN 
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

INSERT INTO employee (employee_id, first_name, last_name)
	VALUES (1, 'Νικόλαος', 'Παπαδόπουλος'), 
    (2, 'Ιωάννης', 'Γιαννόπουλος'), 
    (3, 'Χαρίδημος', 'Γεωργίου'),
    (4, 'Ευάγγελος', 'Αγγελίδης'),
    (5, 'Κρέων', 'Αλιβιζάτος'),
    (6, 'Κίρκη', 'Δημαρά'),
    (7, 'Ήρα', 'Διαμαντοπούλου'),
    (8, 'Λήδα', 'Κατράκη'),
    (9, 'Ορέστης', 'Κοφινάς'),
    (10, 'Υακίνθη', 'Μυλωνά'),
    (11, 'Πάμελα', 'Μυλωνά'),
    (12, 'Φαίδρα', 'Πάνου'),
    (13, 'Φοίβος', 'Παπαχρήστος'),
    (14, 'Φαίδων', 'Σταύρου'),
    (15, 'Άδωνης', 'Γεωργιάδης'),
    (16, 'Βρασίδας', 'Οικονόμου'),
    (17, 'Δημήτριος', 'Θεοδοσίου');

INSERT INTO program(program_id, program_name, department) 
VALUES 
(1,'Ε.Σ.Π.Α. 2014-2020','Αναπτυξιακά Προγράμματα'),
 (2,'Ε.Σ.Π.Α. 2021-2027','Αναπτυξιακά Προγράμματα'),
 (3,'Ορίζοντας 2020','Ευρωπαϊκά Προγράμματα'),
 (4,'Ορίζοντας Ελλάδα','Ευρωπαϊκά Προγράμματα'),
 (5,'ΠΡΑΣΙΝΟ ΤΑΜΕΙΟ - ΦΥΣΙΚΟ ΠΕΡΙΒΑΛΛΟΝ & ΚΑΙΝΟΤΟΜΕΣ ΔΡΑΣΕΙΣ 2022','Περιβαλλοντικά Προγράμματα'),
 (6,'ERASMUS+ 2021-2027','Εκπαιδευτικά Προγράμματα'),
 (7,'ΤΑΜΕΙΟ ΕΡΕΥΝΩΝ ΓΙΑ ΑΝΘΡΑΚΑ & ΧΑΛΥΒΑ2021-2027','Περιβαλλοντικά Προγράμματα'),
 (8,'Επιχειρησιακό Πρόγραμμα «ΣΤΕΡΕΑ ΕΛΛΑΔΑ» 2014 – 2020','Αναπτυξιακά Προγράμματα'),
 (9,'Ερευνώ – Δημιουργώ – Καινοτομώ 2018-2020','Αναπτυξιακά Προγράμματα'),
 (10,'ΣΥΝΕΡΓΑΣΙΑ 2009 (ΓΓΕΤ)','Τεχνολογικά Προγράμματα'),
 (11,'ΣΥΝΕΡΓΑΣΙΑ 2011 (ΓΓΕΤ)','Τεχνολογικά Προγράμματα'),
 (12,'International grant by Nokia Corporation','Τεχνολογικά Προγράμματα');
 

INSERT INTO organization (org_id, org_name, initials, city, address, zip_code, organization_type, equity, ministry_funds, private_funds)
VALUES 
(1, 'ΕΘΝΙΚΟ ΜΕΤΣΟΒΙΟ ΠΟΛΥΤΕΧΝΕΙΟ', 'ΕΜΠ', 'Αθήνα', 'Ηρώων Πολυτεχνείου 9', 15780,'University', NULL, 100000, NULL),
(2, 'ΕΘΝΙΚΟ και ΚΑΠΟΔΙΣΤΡΙΑΚΟ ΠΑΝΕΠΙΣΤΗΜΙΟ ΑΘΗΝΩΝ', 'ΕΚΠΑ', 'Αθήνα', 'Κιλκίς 18' , 17562, 'University', NULL, 230000, NULL),
(3, 'Πανεπιστήμιο Πειραιώς', 'ΠΑΠΕΙ', 'Πειραιάς', 'Γρηγορίου Λαμπράκη 21', 18534, 'University', NULL, 190000, NULL),
(4, 'Stanford University', 'SU', 'Stanford', '450 Jane Stanford Way' , 94305, 'University', NULL, 1900000, NULL),
(5, 'ΑΝΩΝΥΜΗ ΝΑΥΤΙΛΙΑΚΗ ΕΤΑΙΡΙΑ ΚΡΗΤΗΣ Α.Ε.', 'ΑΝΕΚ', 'Χανιά', 'Ασπροποτάμου 47' , 01928, 'Firm', 1209832, NULL, NULL),
(6, 'ΒΙΟΜΗΧΑΝΙΚΑ ΤΕΧΝΙΚΑ ΕΡΓΑ ΒΙΟΤΕΡ Α.Ε.', 'ΒΙΟΤ', 'Θεσσαλονίκη', 'Τσιμισκή 139' , 12328, 'Firm', 198974, NULL, NULL),
(7, 'ΒΟΓΙΑΤΖΟΓΛΟΥ SYSTEMS Α.Ε.', 'ΒΟΣΥΣ', 'Αθήνα', 'Ιωνίας 103' , 29871, 'Firm', 875382, NULL, NULL),
(8, 'JUMBO ΑΝΩΝΥΜΗ ΕΜΠΟΡΙΚΗ ΕΤΑΙΡΙΑ', 'ΜΠΕΛΑ', 'Αθήνα', 'Θέμου Ανίνου 17' , 87216, 'Firm', 97543, NULL, NULL),
(9, 'Π.Γ. ΝΙΚΑΣ Α.Β.Ε.Ε.', 'ΝΙΚΑΣ', 'Κόρινθος', 'Ελευθερίου Βενιζέλου 26' , 73460, 'Firm', 238193, NULL, NULL),
(10, 'Logismos ΣΥΣΤΗΜΑΤΑ ΠΛΗΡΟΦΟΡΙΚΗΣ Α.Ε.', 'ΛΟΓΟΣ', 'Πάτρα', 'Μουργκάνας 6' , 17343, 'Firm', 347432, NULL, NULL),
(11, 'ΠΑΠΟΥΤΣΑΝΗΣ ΑΒΕΕ ΚΑΤΑΝΑΛΩΤΙΚΩΝ ΑΓΑΘΩΝ', 'ΠΑΠ', 'Καλαμάτα', 'Ρόδου 13' , 98312, 'Firm', 693511, NULL, NULL),
(12, 'ΦΙΕΡΑΤΕΞ ΑΦΟΙ ΑΝΕΖΟΥΛΑΚΗ Α.Ε.', 'ΦΙΕΡ', 'Ρέθυμνο', 'Θράκης 24' , 67890, 'Firm', 65139, NULL, NULL),
(13, 'LAVIPHARM Α.Ε.', 'ΛΑΒΙ', 'Κωνσταντινούπολη', 'Αγίας Σοφίας 78' , 69213, 'Firm', 881291, NULL, NULL),
(14, 'ΙΝΤΕΡΤΕΚ Α.Ε. ΔΙΕΘΝΕΙΣ ΤΕΧΝ/ΓΙΕΣ', 'ΙΝΤΕΤ', 'Καμπούλ', 'Νήσου Ρω 16' , 17562, 'Firm', 52182, NULL, NULL),
(15, 'ΝΟΒΑΛ ΠΡΟΠΕΡΤΥ ΑΕΕΑΠ', 'ΝΟΒΑΛΟ1', 'Τζακάρτα', 'Κουμυνδούρου 96Α' , 15565, 'Firm', 744190, NULL, NULL),
(16, 'ΕΛΒΑΛΧΑΛΚΟΡ ΕΛΛΗΝΙΚΗ ΒΙΟΜΗΧΑΝΙΑ ΧΑΛΚΟΥ ΚΑΙ ΑΛΟΥΜΙΝΙΟΥ Α.Ε.', 'ΕΛΧΑ', 'Όσλο', 'Τσισάνη 38' , 91711, 'Firm', 98127, NULL, NULL),
(17, 'ΠΑΕ ΠΑΝΑΘΗΝΑΪΚΟΣ', 'ΠΑΟ', 'Αθήνα', 'Λεωφόρος Κηφισίας 296' , 16902, 'Firm', 500135000, NULL, NULL),
(18, 'BRIQ PROPERTIES Α.Ε.Ε.Α.Π.', 'ΜΠΡΙΚ', 'Πρέβεζα', 'Σούδας 16' , 76223, 'Firm', 100639, NULL, NULL),
(19, 'ΕΛΤΟΝ ΔΙΕΘΝΟΥΣ ΕΜΠΟΡΙΟΥ ΑΕΒΕ', 'ΕΛΤΟΝ', 'Πεκίνο', 'Αιγαίου 27' , 12345, 'Firm', 30071, NULL, NULL),
(20, 'ΟΡΓΑΝΙΣΜΟΣ ΠΡΟΓΝΩΣΤΙΚΩΝ ΑΓΩΝΩΝ ΠΟΔΟΣΦΑΙΡΟΥ Α.Ε.', 'ΟΠΑΠ', 'Μπραζίλια', 'Κυπρίων Αγωνιστών 47' , 83998, 'Firm', 150098, NULL, NULL),
(21, 'ΔΗΜΟΣΙΑ ΕΠΙΧΕΙΡΗΣΗ ΗΛΕΚΤΡΙΣΜΟΥ ΑΕ', 'ΔΕΗ', 'Βερολίνο', 'Θεμιστοκλέους 36' , 27499, 'Firm', 2000473, NULL, NULL),
(22, 'ALPHA ΥΠΗΡΕΣΙΩΝ ΚΑΙ ΣΥΜΜΕΤΟΧΩΝ ΑΝΩΝΥΜΗ ΕΤΑΙΡΕΙΑ', 'ΑΛΦΑ', 'Κομοτηνή', 'Παναγιώτου Ασημακοπούλου 3' , 19223, 'Firm', 500821, NULL, NULL),
(23, 'EUROBANK ERGASIAS ΥΠΗΡΕΣΙΩΝ ΚΑΙ ΣΥΜΜΕΤΟΧΩΝ Α.Ε.', 'ΕΥΡΩΒ', 'Αγρίνιο', 'Καλαμακίου 10' , 44028, 'Firm', 664827, NULL, NULL),
(24, 'ΕΛ. Δ. ΜΟΥΖΑΚΗΣ Α.Ε.Β.Ε.Μ. & Ε.', 'ΜΟΥΖΚ', 'Ακράτα', 'Ακροπόλεως 10' , 88721, 'Firm', 9902, NULL, NULL),
(25, 'ΙΝΤΡΑΚΟΜ Α.Ε. ΣΥΜΜΕΤOΧΩΝ', 'ΙΝΤΚΑ', 'Φιλιατρά', 'Νηρηίδων 13' , 76223, 'Firm', 100639, NULL, NULL),
(26, 'ΑΡΤΟΒΙΟΜΗΧΑΝΙΑ ΚΑΡΑΜΟΛΕΓΚΟΣ Α.Ε.', 'ΚΜΟΛ', 'Χαλκίδα', 'Αρτάκης 32' , 11223, 'Firm', 5000, NULL, NULL),
(27, 'Smithsonian Environmental Research Center', 'SERC', 'Καρδίτσα', 'Λήμνου 46' , 92381, 'Research_Center', NULL, 100000, 200000),
(28, 'Texas A&M AgriLife Research', 'TAMAR', 'Χίουστον', 'Wall St 99' , 17771, 'Research_Center', NULL, 34022, 9900),
(29, 'Pew Research Center', 'PEWRC', 'Λονδίνο', 'Ναυάρχου Βότση 13' , 88277, 'Research_Center', NULL, 13920, 6700),
(30, 'Wellcome Trust Sanger Institute ', 'WTSI', 'Λάρισα', 'Αγίου Δημητρίου 44' , 08318, 'Research_Center', NULL, 771329, 10000)
;
-- res_org_id:prwtoi 10 sto noumero tous, mexri 69 sto noumero twn dekadwn, meta tyxaia, id=100 default evaluator
INSERT INTO researcher (researcher_id, first_name, last_name, sex, date_of_birth, date_hired, org_id)
VALUES
(1, 'Giannis', 'Antetokoumbo', 'Male', '1998-12-17', '2021-05-17', 1),
(2, 'Maria', 'DB', 'Female', '1997-12-17', '2021-06-20', 2),
(3, 'Stefanos', 'Tsitsipas', 'Other', '1995-06-10', '2021-06-20', 3),
(4, 'Tania', 'Sawnwy' , 'Female', '1940-07-12', '2021-11-07', 4),
(5, 'Walton', 'Deinhardt', 'Male', '1999-09-29', '2014-03-11', 5),
(6, 'Antony','Riggert','Male', '1932-06-11', '2014-07-21', 6),
(7, 'Doe','Woolfenden','Female','1973-09-18','2002-07-17', 7),
(8, 'Tommie','Hampson','Male','1928-12-25','2012-11-12', 8),
(9, 'Adina','Draycott','Female','1938-06-28','2002-06-06', 9),
(10, 'Erin','Lytell','Female','1959-07-09','2012-11-09', 1),
(11, 'Zarah','Pietri','Female','1959-01-28','2020-12-23', 1),
(12, 'Maria', 'Sakkari', 'Female', '1993-02-12', '2021-06-20', 1),
(13, 'Anstice','Spellard','Female','1981-08-13','2009-08-04', 1),
(14, 'North','Madsen','Male','1945-09-19','2013-06-11', 1),
(15, 'Ransom','Gawne','Male','1985-01-13','2012-07-21', 1),
(16, 'Leisha','Billinge','Female','1923-09-09','2019-04-30', 1),
(17, 'Renee', 'Mackro', 'Female', '1976-06-02', '2015-02-02', 1),
 (18, 'Gena', 'Lago', 'Female', '1998-08-27', '2015-11-11', 1),
 (19, 'Nana', 'Libby', 'Female', '1951-05-18', '2001-06-14', 1),
 (20,'Clayson', 'Nester', 'Male', '1987-01-07', '2018-03-24', 2),
 (21,'Cornall', 'Hartland', 'Male', '1997-07-15', '2020-12-24', 2),
 (22,'Darby', 'Shanahan', 'Female', '1982-10-12', '2010-01-04', 2),
 (23,'Melita', 'Allot', 'Female', '1965-06-21', '2010-01-02', 2),
 (24,'Vernor', 'Rodden', 'Male', '1967-12-23', '2001-12-03', 2),
 (25,'Gusti', 'Coombs', 'Female', '1969-12-05', '2013-02-24', 2),
 (26,'Izaak', 'Godilington', 'Other', '1990-12-10', '2002-01-28', 2),
 (27,'Constantin', 'Clurow', 'Male', '1984-05-12', '2006-07-14', 2),
 (28,'Yolande', 'Lordon', 'Female', '1930-04-12', '2010-09-14', 2),
 (29,'Bartie', 'Klimsch', 'Other', '1940-05-08', '2019-08-16', 2),
 (30,'Killian', 'Coombes', 'Other', '1924-06-20', '2016-01-03', 3),
 (31,'Dominica', 'Toplin', 'Female', '1945-08-27', '2013-07-30', 3),
 (32,'Antonetta', 'Cosins', 'Female', '1924-08-08', '2015-01-01', 3),
 (33,'Merilyn', 'Lochead', 'Female', '1993-11-12', '2007-06-22', 3),
 (34,'Miguelita', 'Buckbee', 'Female', '1983-01-27', '2009-01-26', 3),
  (35,'Reggi', 'Whitcombe', 'Female', '1941-06-16', '2005-08-28', 3),
 (36,'Griffie', 'Verissimo', 'Male', '1935-07-08', '2001-04-04', 3),
 (37,'Dionisio', 'Strathearn', 'Male', '1983-11-29', '2010-07-08', 3),
 (38,'Peggi', 'O''Shevlan', 'Female', '1991-12-07', '2017-11-17', 3),
 (39,'Timi', 'Bysouth', 'Female', '1971-05-27', '2008-04-20', 3),
 (40,'Tallie', 'Waldera', 'Female', '1941-11-29', '2004-08-28', 4),
 (41,'Rem', 'Windas', 'Male', '1989-08-10', '2008-08-17', 4),
 (42,'Arnaldo', 'Easton', 'Male', '1958-08-19', '2012-08-24', 4),
 (43,'Antonina', 'Meany', 'Female', '1989-02-20', '2009-06-18', 4),
 (44,'Alejoa', 'Riddles', 'Male', '1941-10-30', '2010-06-17', 4),
 (45,'Redd', 'McGurk', 'Male', '1994-12-15', '2014-03-20', 4),
 (46,'Jaime', 'Farron', 'Female', '1938-12-04', '2006-02-13', 4),
 (47,'Arthur', 'Calloway', 'Male', '1924-08-08', '2014-12-28', 4),
 (48,'Addie', 'Svanini', 'Male', '1973-10-08', '2004-11-11', 4),
 (49,'Sandye', 'Carbry', 'Female', '1974-03-30', '2005-01-27', 4),
 (50,'Fallon', 'Beldon', 'Female', '1984-01-31', '2007-08-17', 5),
 (51,'Meta', 'Darrigrand', 'Female', '1926-07-09', '2017-07-30', 5),
 (52,'Ravid', 'Grimwood', 'Other', '1985-11-26', '2004-11-07', 5),
 (53,'Oates', 'Richichi', 'Male', '1931-03-03', '2008-03-06', 5),
 (54,'Austen', 'Bisco', 'Male', '1964-03-30', '2006-01-17', 5),
 (55,'Melantha', 'Rigglesford', 'Female', '1973-12-10', '2002-06-14', 5),
 (56,'Micheal', 'Vedyashkin', 'Male', '1980-11-07', '2010-02-01', 5),
 (57,'Colleen', 'Radcliffe', 'Female', '1960-02-27', '2015-11-28', 5),
 (58,'Joelle', 'Cowley', 'Female', '1934-01-22', '2019-06-17', 5),
 (59,'Zaccaria', 'Sibary', 'Male', '1969-01-14', '2002-01-10', 5),
  (60,'Justinn', 'Jacmar', 'Female', '1993-03-03', '2001-12-01', 6),
 (61,'Alejandrina', 'Timewell', 'Female', '1987-12-17', '2019-09-30', 6),
 (62,'Sydney', 'Moylan', 'Male', '1957-11-08', '2016-03-24', 6),
 (63,'Phylys', 'Borrowman', 'Female', '1983-09-28', '2008-08-23', 6),
 (64,'Nevins', 'Bensusan', 'Male', '1950-01-16', '2005-04-04', 6),
 (65,'Elsa', 'Ebsworth', 'Female', '1963-02-05', '2019-09-29', 6),
 (66,'Lani', 'Grundwater', 'Other', '1973-09-16', '2003-08-10', 6),
 (67,'Guenna', 'Simacek', 'Female', '1986-12-09', '2006-05-26', 6),
 (68,'Heloise', 'Clouter', 'Female', '1983-05-12', '2012-09-13', 6),
 (69,'Jeth', 'Artingstall', 'Male', '1978-07-09', '2016-12-14', 6),
 (70,'Reece', 'Fretson', 'Male', '1961-08-10', '2011-09-28', 7),
 (71,'Rafa', 'Strode', 'Female', '1927-06-19', '2011-10-12', 8),
 (72,'Jarrad', 'Cridlon', 'Male', '1950-10-30', '2018-03-30', 9),
 (73,'Abel', 'Haucke', 'Other', '1934-12-09', '2000-12-25', 10),
 (74,'Inger', 'Rotham', 'Male', '1998-08-07', '2003-12-06', 11),
  (75,'Darsey', 'Cuttles', 'Female', '1996-01-20', '2009-09-01', 12),
  (76,'Candy', 'Bentje', 'Female', '1925-11-02', '2006-05-19', 13),
(77,'Milo', 'Spellman', 'Male', '1992-09-17', '2009-06-01',14),
 (78,'Jessie', 'Dowbiggin', 'Male', '1957-04-12', '2009-02-05',15),
 (79,'Gerry', 'Eastridge', 'Male', '1942-05-19', '2007-12-30', 16),
 (80,'Alisha', 'Koch', 'Female', '1980-11-28', '2006-10-24', 17),
 (81,'Pepita', 'Clabburn', 'Other', '1932-09-08', '2002-02-09', 18),
 (82,'Kipp', 'Hallad', 'Female', '1936-10-14', '2007-07-18', 19),
 (83,'Ammamaria', 'MacCosty', 'Female', '1923-01-01', '2002-12-30', 20),
 (84,'Gianina', 'Leel', 'Female', '1928-10-12', '2011-09-06', 21),
 (85,'Minda', 'Braybrooks', 'Female', '1948-09-02', '2001-04-22', 22),
 (86,'Ariela', 'Braidley', 'Female', '1927-11-11', '2000-10-20', 23),
 (87,'Stanford', 'Dibden', 'Male', '1933-03-28', '2018-07-24', 24),
 (88,'Alexandra', 'Govett', 'Female', '1987-09-21', '2006-08-16', 25),
 (89,'Jorrie', 'Shillington', 'Female', '1952-09-22', '2017-05-10', 26),
 (90,'Odette', 'Gerlts', 'Female', '1943-05-04', '2009-06-09', 27),
 (91,'Johnathan', 'Calltone', 'Male', '1931-07-24', '2014-08-01', 28),
 (92,'Rowan', 'Pearde', 'Male', '1987-02-13', '2013-08-28', 29),
 (93,'Emilia', 'Picton', 'Female', '1940-11-19', '2012-10-27', 30),
 (94,'Thain', 'McFaul', 'Male', '1925-08-21', '2020-03-28', 6),
 (95,'Fanya', 'Croizier', 'Female', '1969-01-10', '2016-07-03', 7),
 (96,'Rosa', 'Rafe', 'Female', '1945-06-22', '2007-01-13', 15),
 (97,'Elfie', 'Gentner', 'Female', '1958-11-20', '2019-11-28', 19),
 (98,'Phebe', 'Yerson', 'Female', '1951-10-03', '2003-12-03', 23),
 (99,'Torrin', 'Naulls', 'Male', '1952-05-29', '2010-11-02', 29),
 (100,'Dasie', 'Wilde', 'Other', '1984-08-09', '2000-08-29', 30),
(101,'Emmye', 'Skedgell', 'Female', '1992-08-15', '2004-07-14', 4),
(102,'Kevyn', 'Scanlan', 'Female', '1974-04-01', '2006-02-18', 6),
(103,'Afton', 'Autrie', 'Female', '1932-08-08', '2017-11-10', 5),
(104,'Cynthea', 'Tarbet', 'Female', '1986-03-26', '2001-09-18', 16),
(105,'Georgette', 'Valentine', 'Female', '1941-06-10', '2020-07-03', 25),
(106,'Sydel', 'Burbury', 'Other', '1970-03-06', '2007-12-02', 9),
(107,'Inessa', 'Brennand', 'Female', '1923-03-18', '2020-04-21', 4),
(108,'Ariella', 'Parkinson', 'Female', '1977-05-27', '2013-10-20', 3),
(109,'Malcolm', 'Clarycott', 'Male', '1925-06-23', '2006-06-13', 2),
(110,'Rosalia', 'Saywood', 'Female', '1935-01-03', '2017-03-29', 1);
-- 17 emplpoyees,12 programs, 110 researchers
INSERT INTO project (project_id,start_date,end_date,funding,project_title,employee_id,program_id,org_id,researcher_id_sup,researcher_id_ev,evaluation,evaluation_date)
VALUES (1, '2022-02-06','2022-09-05',100000,'Peirama Astrofysikhs',1,1,1,1,100,80,'2019-05-25'),
(2, '2022-01-09', '2025-03-19',898411,'XXX',5,10,2,29,100,55,'2012-12-12'),
(3, '2021-08-11','2025-04-02',838747,'Peirama Astrofysikhs',4,9,3,37,100,98,'2008-02-18'),
(4, '2021-08-10','2024-09-02',634366,'xxxx',5,2,4,44,100,40,'2005-12-03'),
(5, '2022-01-25','2024-03-30',274907,'xxxx',8,1,5,55,100,67,'2007-02-21'),
(6, '2020-07-19','2023-03-24',823772,'xxxx',2,3,6,65,100,90,'2010-09-05'),
(7,'2021-11-18','2025-05-15',958032,'XXXX',12,3,1,13,100,98,'2016-07-14'),
(8,'2022-03-15','2023-08-18',706306,'XXX',11,10,1,18,100,67,'2009-04-06'),
(9,'2022-04-03','2023-02-09',489443,'xxxx',9,7,1,12,100,68,'2007-12-19'),
(10,'2021-11-30','2024-06-23',604087,'xxxx',13,9,1,19,100,72,'2008-06-26'),
(11,'2021-10-31','2024-08-13',574862,'xxxx',1,12,1,10,100,11,'2015-08-21'),
(12,'2022-01-07','2023-03-01',380996,'xxxx',2,2,2,24,100,22,'2004-09-03'),
(13,'2021-05-20','2022-12-17',530026,'xxxx',16,4,3,31,100,73,'2002-09-14'),
(14,'2021-08-28','2024-12-30',464916,'xxxx',2,10,4,46,100,58,'2010-11-21'),
(15,'2021-11-02','2025-09-11',700048,'xxxx',8,6,5,57,100,27,'2016-07-24'),
(16,'2022-12-12','2024-10-25',122959,'xxxx',14,4,6,61,100,17,'2011-06-07'),
(17,'2021-06-15','2024-02-22',246465,'xxxx',3,8,7,70,100,97,'2012-01-29'),
(18,'2018-11-14','2022-08-13',105127,'xxxx',11,3,8,71,100,62,'2003-02-26'),
(19,'2019-12-25','2023-11-13',373044,'xxxx',8,7,9,72,100,49,'2014-04-14'),
(20,'2022-05-13','2024-02-06',575215,'xxxx',14,2,2,20,100,100,'2004-05-14'),
(21,'2022-09-17','2025-07-24',400958,'xxxx',12,12,2,21,100,73,'2003-08-09'),
(22,'2021-03-22','2023-06-21',738734,'xxxx',1,1,2,22,100,79,'2014-07-02'),
(23,'2021-07-08','2024-11-24',752726,'xxxx',14,9,2,23,100,70,'2012-06-12'),
(24,'2021-05-31','2023-07-27',340832,'xxxx',2,11,2,24,100,61,'2012-06-08'),
(25,'2022-10-11','2024-03-11',978862,'xxxx',5,12,2,25,100,20,'2008-05-02'),
(26,'2021-04-16','2023-12-28',487583,'xxxx',5,2,2,26,100,76,'2015-04-02'),
(27,'2022-04-29','2025-07-26',215934,'xxxx',12,10,2,27,100,78,'2006-05-30'),
(28,'2022-05-01','2026-03-06',483545,'xxxx',10,1,2,28,100,86,'2010-03-22'),
(29,'2021-02-28','2024-07-28',719318,'xxxx',15,9,2,29,100,65,'2009-04-12'),
(30,'2021-01-10','2023-11-12',250069,'xxxx',7,10,1,1,100,23,'2016-05-10'),
(31,'2022-05-14','2024-03-27',254924,'xxxx',11,5,1,11,100,100,'2018-12-29'),
(32,'2021-11-20','2022-11-07',510993,'xxxx',8,12,1,12,100,62,'2003-02-19'),
(33,'2021-08-15','2023-02-06',433537,'xxxx',5,6,1,13,100,94,'2013-07-07'),
(34,'2021-09-11','2024-11-13',169781,'xxxx',8,6,1,14,100,82,'2018-01-03'),
(35,'2022-02-14','2024-10-29',747722,'xxxx',5,9,1,15,100,36,'2003-12-14'),
(36,'2022-01-31','2025-11-17',890793,'xxxx',16,1,1,16,100,46,'2015-06-15'),
(37,'2021-06-16','2023-04-14',743706,'xxxx',4,1,1,17,100,79,'2008-12-28'),
(38,'2021-03-25','2025-07-09',974344,'xxxx',2,1,1,18,100,26,'2010-03-06'),
(39,'2022-04-21','2023-11-18',729418,'xxxx',7,9,1,19,100,90,'2018-11-06'),
(40,'2022-03-26','2025-12-03',997025,'xxxx',13,9,1,14,100,6,'2018-04-06'),
(41,'2022-01-02','2025-09-14',449238,'xxxx',15,10,1,11,100,57,'2017-12-19'),
(42,'2022-02-17','2025-06-11',705219,'xxxx',5,2,1,12,100,9,'2014-11-09'),
(43,'2021-08-07','2024-01-10',737333,'xxxx',4,3,1,13,100,51,'2011-09-17'),
(44,'2022-04-01','2026-02-04',722163,'xxxx',15,11,21,84,100,80,'2006-08-20'),
(45,'2019-11-21','2022-07-25',602888,'xxxx',15,3,21,84,100,69,'2017-07-20'),
(46,'2018-12-22','2022-12-07',279794,'xxxx',15,5,21,84,100,56,'2009-09-30'),
(47,'2021-09-09','2025-02-09',104002,'xxxx',5,7,6,64,100,62,'2012-03-23'),
(48,'2018-10-05','2022-08-07',182961,'xxxx',17,5,6,68,100,79,'2012-08-19'),
(49,'2022-05-06','2025-09-29',449519,'xxxx',10,2,17,80,100,51,'2002-02-08'),
(50,'2022-04-27','2026-03-09',332118,'xxxx',4,9,21,84,100,85,'2017-07-06'),
(51,'2012-12-12','2014-11-07',572160,'xxxx',13,8,18,81,18,97,'2007-04-12'),
(52,'2017-01-18','2019-03-22',312698,'xxxx',6,1,19,97,100,66,'2010-10-08'),
(53,'2015-01-04','2016-02-06',302526,'xxxx',9,1,20,83,100,24,'2007-03-26'),
(54,'2013-08-15','2015-01-29',793722,'xxxx',3,5,1,110,100,48,'2011-02-15'),
(55,'2014-04-22','2015-01-10',951028,'xxxx',14,5,2,2,100,66,'2008-11-03');

INSERT INTO works_on (project_id, researcher_id)
VALUES
(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),
(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),
(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,38),
(4,41),(4,42),(4,43),(4,40),(4,45),(4,46),(4,47),
(5,51),(5,52),(5,53),(5,54),(5,56),(5,57),
(6,61),(6,62),(6,63),(6,64),(6,69),(6,66),(6,67),
(7,12),(7,14),(7,15),(7,16),(7,17),(7,18),(7,19),
(8,13),(8,14),(8,15),(8,16),(8,17),(8,11),(8,19),
(9,13),(9,14),(9,15),(9,16),(9,17),(9,18),(9,19),
(10,13),(10,14),(10,15),(10,16),(10,17),(10,18),
(11,13),(11,14),(11,15),
(12,23),(12,29),(12,26),(12,25),(12,22),
(13,3),(13,39),(13,33),(13,34),(13,38),(13,36),(13,37),
(14,4),(14,42),(14,49),(14,48),(14,45),(14,41),(14,47),
(15,103),(15,50),(15,59),(15,54),(15,58),(15,5),(15,55),
(16,102),(16,94),(16,6),(16,60),(16,65),(16,66),(16,69),
(17,7),(17,95),
(18,8),
(19,9),(19,106),
(20,109),(20,21),(20,22),(20,27),
(21,109),(21,25),(21,24),(21,28),
(22,2),(22,21),(22,28),(22,24),(22,20),
(23,2),(23,20),(23,24),(23,25),
(24,109),(24,27),(24,29),(24,26),(24,28),
(25,23),(25,29),(25,26),(25,20),(25,22),
(26,27),(26,29),(26,23),
(27,23),(27,21),
(28,25),(28,2),(28,109),
(29,22),(29,23),(29,109),
(30,15),(30,16),(30,18),(30,110),
(31,14),(31,17),(31,12),(31,110),
(32,13),(32,14),(32,15),(32,19),
(33,11),(33,14),(33,15),(33,16),
(34,10),(34,11),(34,12),
(35,10),(35,11),(35,12),
(36,15),(36,11),(36,19),
(37,14),(37,10),(37,18),
(38,16),(38,10),(38,15),
(39,12),(39,10),(39,1),
(40,15),(40,16),(40,18),(40,110),
(41,14),(41,17),(41,12),(41,110),
(42,13),(42,14),(42,15),(42,19),
(43,17),(43,14),(43,15),(43,16),
(47,102),(47,94),(47,63),(47,62),(47,65),(47,68),(47,69),
(48,6),(48,60),(48,61),(48,66),(48,69),(48,64),
(52,82),
(54,10),(54,11),(54,12),
(55,109),(55,27),(55,29),(55,26),(55,28)
;



INSERT INTO research_field (project_id, field_name)
VALUES
(1, 'X'),
(1, 'Y'),
(1, 'C'),
(2, 'A'),
(2, 'B'),
(3, 'C'),
(3, 'D'),
(4, 'X'),
(5, 'Y'),
(6, 'X'),
(6, 'Y'),
(7, 'X'),
(7, 'Y'),
(8, 'A'),
(8, 'B'),
(9, 'E'),
(9, 'F'),
(10, 'E'),
(10, 'F');

INSERT INTO deliverable (project_id, deliverable_title, delivery_date)
VALUES
(38,'xx', '2024-10-09'),
(47,'xx', '2022-06-01'),
(19,'xx', '2020-03-24'),
(20,'xx', '2023-11-17'),
(38,'xx', '2025-02-14'),
(33,'xx', '2021-12-21'),
(37,'xx', '2022-05-26'),
(22,'xx', '2021-10-13'),
(33,'xx', '2022-08-07'),
(20,'xx', '2023-01-23'),
(14,'xx', '2024-06-02'),
(45,'xx', '2019-12-05')
;

insert into org_phone (org_id, phone_number) values (30, 7418445624),(30, 7516188912),(11, 4563737283),(16, 3333263288)
,(8, 1029284520),(13, 6950493388),(9, 2176682443),(17, 1151036952),(9, 6512300934),(22, 4200793473),(3, 7083927766)
,(4, 1977765414),(5, 1695111109),(17, 9610683299),(29, 3131304808),(11, 3062377906),(28, 8739473218),(9, 6047065368)
,(5, 6478977002),(11, 9767553033),(20, 6697057393),(14, 7862870353),(11, 9059165347),(4, 8863146958),(23, 5216223507)
,(26, 6778434133),(4, 2298357123),(17, 3813381760),(23, 2019355728),(25, 5335660794),(13, 3342504626),(2, 7059496767)
,(24, 4497188502),(7, 1674248463),(6, 8565985481),(16, 9934056280),(8, 1383231924),(18, 1362418717),(23, 8729382957)
,(17, 5132641015),(16, 9698133776),(20, 6714893770),(13, 2960156308),(17, 2570115924),(18, 1349528118),(21, 5518798490)
,(10, 5752417536),(24, 7086076488),(10, 2528367113),(18, 4081246454),(27, 3075062960),(13, 7859176560),(6, 6568099863)
,(21, 5085320239),(29, 1434245603),(25, 8915868303),(9, 9411619681),(1, 7296198313),(2, 2192559548),(25, 5038991717)
, (12, 6833509626),(27, 7074624239),(4, 7796751069),(20, 4391137289),(23, 6967291032), (5, 2798709761),(27, 7031038547)
,(18, 2669960419),(12, 3212268326),(14, 4279706755),(26, 4603704352),(6, 8778576043),(5, 3561377537), (12, 8303019829)
,(16, 1608357081),(3, 5638576909),(20, 2718837665),(14, 4556879981),(9, 3442261704),(12, 2961969125),(10, 5244548926)
,(28, 1280387573),(12, 5959043084),(19, 2185611831),(19, 9928970588),(20, 8806996121),(8, 5414214757),(7, 9023465653)
,(14, 7488718870),(8, 4960956820),(8, 9198527848),(19, 3186270557),(20, 8375224029);

DROP VIEW IF EXISTS researchersprojects;
CREATE VIEW researchersprojects AS
select r.researcher_id ,r.first_name, r.last_name,p.project_id
FROM researcher r 
INNER JOIN works_on w
ON r.researcher_id = w.researcher_id
INNER JOIN project p 
ON p.project_id = w.project_id
ORDER BY r.researcher_id;

DROP VIEW IF EXISTS organizationsresearchers;
CREATE VIEW organizationsresearchers AS
SELECT r.researcher_id, r.first_name, r.last_name, r.org_id
FROM researcher r
INNER JOIN
organization org
ON r.org_id = org.org_id
ORDER BY r.org_id ASC;