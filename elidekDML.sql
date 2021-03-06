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

insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 36);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 18);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 31);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 25);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 19);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 27);
insert into research_field (field_name, project_id) values ('ECONOMICS', 12);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 9);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 19);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 12);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 52);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 51);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 28);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 13);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 19);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 3);
insert into research_field (field_name, project_id) values ('ECONOMICS', 29);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 52);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 51);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 52);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 20);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 25);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 10);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 35);
insert into research_field (field_name, project_id) values ('ECONOMICS', 41);
insert into research_field (field_name, project_id) values ('ECONOMICS', 45);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 48);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 27);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 49);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 6);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 55);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 31);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 47);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 47);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 53);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 38);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 46);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 23);
insert into research_field (field_name, project_id) values ('ECONOMICS', 20);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 12);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 55);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 49);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 37);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 26);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 32);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 40);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 7);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 29);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 1);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 4);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 14);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 48);
insert into research_field (field_name, project_id) values ('ECONOMICS', 32);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 20);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 39);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 22);
insert into research_field (field_name, project_id) values ('ECONOMICS', 17);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 16);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 12);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 50);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 47);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 49);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 1);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 15);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 53);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 43);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 4);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 3);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 43);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 49);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 31);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 14);
insert into research_field (field_name, project_id) values ('ECONOMICS', 11);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 17);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 48);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 31);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 53);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 45);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 41);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 2);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 42);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 51);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 40);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 31);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 36);
insert into research_field (field_name, project_id) values ('ECONOMICS', 6);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 48);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 52);
insert into research_field (field_name, project_id) values ('ECONOMICS', 42);
insert into research_field (field_name, project_id) values ('ECONOMICS', 54);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 17);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 54);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 55);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 50);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 6);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 52);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 35);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 54);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 2);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 32);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 11);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 25);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 24);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 1);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 50);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 43);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 11);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 8);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 52);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 3);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 27);
insert into research_field (field_name, project_id) values ('ECONOMICS', 14);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 33);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 45);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 35);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 15);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 36);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 48);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 49);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 35);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 16);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 20);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 2);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 6);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 2);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 17);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 31);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 46);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 7);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 54);
insert into research_field (field_name, project_id) values ('ECONOMICS', 46);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 18);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 28);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 6);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 21);
insert into research_field (field_name, project_id) values ('ECONOMICS', 21);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 27);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 21);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 38);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 42);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 8);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 24);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 34);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 1);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 30);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 55);
insert into research_field (field_name, project_id) values ('ECONOMICS', 31);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 23);
insert into research_field (field_name, project_id) values ('APPLIED MATHEMATICS', 23);
insert into research_field (field_name, project_id) values ('COMPUTER SCIENCES', 23);
insert into research_field (field_name, project_id) values ('MATERIALS ENGINEERING', 6);
insert into research_field (field_name, project_id) values ('ORGANIC CHEMISTRY', 38);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 50);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 21);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 23);
insert into research_field (field_name, project_id) values ('HUMAN GENETICS', 53);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 13);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 30);
insert into research_field (field_name, project_id) values ('ASTROPHYSICS', 17);
insert into research_field (field_name, project_id) values ('ENTOMOLOGY', 49);
insert into research_field (field_name, project_id) values ('ANTHROPOLOGY', 1);

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


UPDATE project set project_title = 'metus aenean fermentum' WHERE project_id=1;
UPDATE project set project_title = 'in' WHERE project_id=2;
UPDATE project set project_title = 'habitasse' WHERE project_id=3;
UPDATE project set project_title = 'at nunc commodo' WHERE project_id=4;
UPDATE project set project_title = 'penatibus et magnis' WHERE project_id=5;
UPDATE project set project_title = 'enim' WHERE project_id=6;
UPDATE project set project_title = 'amet turpis' WHERE project_id=7;
UPDATE project set project_title = 'dapibus at' WHERE project_id=8;
UPDATE project set project_title = 'luctus nec' WHERE project_id=9;
UPDATE project set project_title = 'sit amet nunc' WHERE project_id=10;
UPDATE project set project_title = 'primis' WHERE project_id=11;
UPDATE project set project_title = 'praesent blandit nam' WHERE project_id=12;
UPDATE project set project_title = 'amet cursus id' WHERE project_id=13;
UPDATE project set project_title = 'vitae mattis' WHERE project_id=14;
UPDATE project set project_title = 'volutpat eleifend' WHERE project_id=15;
UPDATE project set project_title = 'felis eu' WHERE project_id=16;
UPDATE project set project_title = 'morbi quis' WHERE project_id=17;
UPDATE project set project_title = 'imperdiet nullam orci' WHERE project_id=18;
UPDATE project set project_title = 'id' WHERE project_id=19;
UPDATE project set project_title = 'lacinia' WHERE project_id=20;
UPDATE project set project_title = 'rhoncus aliquam' WHERE project_id=21;
UPDATE project set project_title = 'turpis enim blandit' WHERE project_id=22;
UPDATE project set project_title = 'ultrices posuere cubilia' WHERE project_id=23;
UPDATE project set project_title = 'amet' WHERE project_id=24;
UPDATE project set project_title = 'condimentum' WHERE project_id=25;
UPDATE project set project_title = 'cursus' WHERE project_id=26;
UPDATE project set project_title = 'bibendum morbi non' WHERE project_id=27;
UPDATE project set project_title = 'eu massa donec' WHERE project_id=28;
UPDATE project set project_title = 'nunc viverra' WHERE project_id=29;
UPDATE project set project_title = 'vestibulum aliquet' WHERE project_id=30;
UPDATE project set project_title = 'pretium iaculis' WHERE project_id=31;
UPDATE project set project_title = 'enim' WHERE project_id=32;
UPDATE project set project_title = 'egestas' WHERE project_id=33;
UPDATE project set project_title = 'lacinia sapien quis' WHERE project_id=34;
UPDATE project set project_title = 'pede posuere' WHERE project_id=35;
UPDATE project set project_title = 'nulla tempus vivamus' WHERE project_id=36;
UPDATE project set project_title = 'quis' WHERE project_id=37;
UPDATE project set project_title = 'aliquam augue' WHERE project_id=38;
UPDATE project set project_title = 'vel accumsan' WHERE project_id=39;
UPDATE project set project_title = 'ullamcorper augue' WHERE project_id=40;
UPDATE project set project_title = 'non' WHERE project_id=41;
UPDATE project set project_title = 'pretium quis' WHERE project_id=42;
UPDATE project set project_title = 'magna' WHERE project_id=43;
UPDATE project set project_title = 'eu magna vulputate' WHERE project_id=44;
UPDATE project set project_title = 'scelerisque' WHERE project_id=45;
UPDATE project set project_title = 'id luctus nec' WHERE project_id=46;
UPDATE project set project_title = 'lacus morbi' WHERE project_id=47;
UPDATE project set project_title = 'donec semper sapien' WHERE project_id=48;
UPDATE project set project_title = 'nam congue risus' WHERE project_id=49;
UPDATE project set project_title = 'nunc vestibulum' WHERE project_id=50;
UPDATE project set project_title = 'parturient montes nascetur' WHERE project_id=51;
UPDATE project set project_title = 'vel dapibus at' WHERE project_id=52;
UPDATE project set project_title = 'eu felis fusce' WHERE project_id=53;
UPDATE project set project_title = 'risus dapibus augue' WHERE project_id=54;
UPDATE project set project_title = 'vestibulum ac est' WHERE project_id=55;

UPDATE project set project_description = 'phasellus sit amet erat nulla tempus vivamus in felis eu sapien' WHERE project_id=1;
UPDATE project set project_description = 'eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis' WHERE project_id=2;
UPDATE project set project_description = 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu' WHERE project_id=3;
UPDATE project set project_description = 'nulla facilisi cras non velit nec nisi vulputate nonummy' WHERE project_id=4;
UPDATE project set project_description = 'libero nam dui proin leo odio porttitor id consequat in consequat' WHERE project_id=5;
UPDATE project set project_description = 'pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula' WHERE project_id=6;
UPDATE project set project_description = 'magna ac consequat metus sapien ut nunc vestibulum' WHERE project_id=7;
UPDATE project set project_description = 'adipiscing molestie hendrerit at vulputate vitae nisl aenean' WHERE project_id=8;
UPDATE project set project_description = 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna' WHERE project_id=9;
UPDATE project set project_description = 'non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum' WHERE project_id=10;
UPDATE project set project_description = 'in hac habitasse platea dictumst maecenas ut massa' WHERE project_id=11;
UPDATE project set project_description = 'morbi vestibulum velit id pretium iaculis diam' WHERE project_id=12;
UPDATE project set project_description = 'bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt' WHERE project_id=13;
UPDATE project set project_description = 'vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus' WHERE project_id=14;
UPDATE project set project_description = 'pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie' WHERE project_id=15;
UPDATE project set project_description = 'cubilia curae mauris viverra diam vitae quam' WHERE project_id=16;
UPDATE project set project_description = 'at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla' WHERE project_id=17;
UPDATE project set project_description = 'ridiculus mus etiam vel augue vestibulum' WHERE project_id=18;
UPDATE project set project_description = 'convallis duis consequat dui nec' WHERE project_id=19;
UPDATE project set project_description = 'rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa' WHERE project_id=20;
UPDATE project set project_description = 'odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est' WHERE project_id=21;
UPDATE project set project_description = 'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum' WHERE project_id=22;
UPDATE project set project_description = 'non mi integer ac neque duis bibendum' WHERE project_id=23;
UPDATE project set project_description = 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus' WHERE project_id=24;
UPDATE project set project_description = 'consequat in consequat ut nulla sed' WHERE project_id=25;
UPDATE project set project_description = 'primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus' WHERE project_id=26;
UPDATE project set project_description = 'nibh quisque id justo sit amet sapien' WHERE project_id=27;
UPDATE project set project_description = 'penatibus et magnis dis parturient' WHERE project_id=28;
UPDATE project set project_description = 'suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam' WHERE project_id=29;
UPDATE project set project_description = 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris' WHERE project_id=30;
UPDATE project set project_description = 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum' WHERE project_id=31;
UPDATE project set project_description = 'dis parturient montes nascetur ridiculus mus' WHERE project_id=32;
UPDATE project set project_description = 'justo in hac habitasse' WHERE project_id=33;
UPDATE project set project_description = 'posuere cubilia curae duis faucibus accumsan odio curabitur' WHERE project_id=34;
UPDATE project set project_description = 'vestibulum sagittis sapien cum sociis natoque' WHERE project_id=35;
UPDATE project set project_description = 'lobortis convallis tortor risus dapibus augue' WHERE project_id=36;
UPDATE project set project_description = 'elit proin interdum mauris non ligula pellentesque ultrices phasellus' WHERE project_id=37;
UPDATE project set project_description = 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis' WHERE project_id=38;
UPDATE project set project_description = 'iaculis diam erat fermentum justo nec' WHERE project_id=39;
UPDATE project set project_description = 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum' WHERE project_id=40;
UPDATE project set project_description = 'massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras' WHERE project_id=41;
UPDATE project set project_description = 'nullam orci pede venenatis non sodales sed' WHERE project_id=42;
UPDATE project set project_description = 'amet sem fusce consequat nulla' WHERE project_id=43;
UPDATE project set project_description = 'nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac' WHERE project_id=44;
UPDATE project set project_description = 'augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse' WHERE project_id=45;
UPDATE project set project_description = 'nulla ac enim in tempor' WHERE project_id=46;
UPDATE project set project_description = 'eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla' WHERE project_id=47;
UPDATE project set project_description = 'vulputate nonummy maecenas tincidunt lacus at' WHERE project_id=48;
UPDATE project set project_description = 'vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent' WHERE project_id=49;
UPDATE project set project_description = 'posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis' WHERE project_id=50;
UPDATE project set project_description = 'dapibus duis at velit eu est congue elementum in' WHERE project_id=51;
UPDATE project set project_description = 'erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc' WHERE project_id=52;
UPDATE project set project_description = 'vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum' WHERE project_id=53;
UPDATE project set project_description = 'duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend' WHERE project_id=54;
UPDATE project set project_description = 'et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin' WHERE project_id=55;

UPDATE deliverable set deliverable_title = 'pede venenatis non sodales' WHERE deliverable_id=1;
UPDATE deliverable set deliverable_title = 'eget congue eget semper' WHERE deliverable_id=2;
UPDATE deliverable set deliverable_title = 'metus' WHERE deliverable_id=3;
UPDATE deliverable set deliverable_title = 'fusce congue diam' WHERE deliverable_id=4;
UPDATE deliverable set deliverable_title = 'interdum eu' WHERE deliverable_id=5;
UPDATE deliverable set deliverable_title = 'risus semper' WHERE deliverable_id=6;
UPDATE deliverable set deliverable_title = 'adipiscing lorem' WHERE deliverable_id=7;
UPDATE deliverable set deliverable_title = 'iaculis justo in' WHERE deliverable_id=8;
UPDATE deliverable set deliverable_title = 'lacinia nisi' WHERE deliverable_id=9;
UPDATE deliverable set deliverable_title = 'pretium quis lectus suspendisse' WHERE deliverable_id=10;
UPDATE deliverable set deliverable_title = 'non mi integer ac' WHERE deliverable_id=11;
UPDATE deliverable set deliverable_title = 'amet consectetuer' WHERE deliverable_id=12;

UPDATE deliverable set deliverable_summary = 'pede malesuada in imperdiet et commodo vulputate justo in blandit' WHERE deliverable_id=1;
UPDATE deliverable set deliverable_summary = 'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin' WHERE deliverable_id=2;
UPDATE deliverable set deliverable_summary = 'odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus' WHERE deliverable_id=3;
UPDATE deliverable set deliverable_summary = 'nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac' WHERE deliverable_id=4;
UPDATE deliverable set deliverable_summary = 'leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel' WHERE deliverable_id=5;
UPDATE deliverable set deliverable_summary = 'tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus' WHERE deliverable_id=6;
UPDATE deliverable set deliverable_summary = 'adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue' WHERE deliverable_id=7;
UPDATE deliverable set deliverable_summary = 'eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus' WHERE deliverable_id=8;
UPDATE deliverable set deliverable_summary = 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem' WHERE deliverable_id=9;
UPDATE deliverable set deliverable_summary = 'rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam' WHERE deliverable_id=10;
UPDATE deliverable set deliverable_summary = 'hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel' WHERE deliverable_id=11;
UPDATE deliverable set deliverable_summary = 'libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti' WHERE deliverable_id=12;