DROP DATABASE IF EXISTS Drugs_R_Us;
CREATE DATABASE Drugs_R_Us;
-- Selecting Drugs R Us
USE Drugs_R_Us;

-- Creating table doctor
CREATE TABLE doctor (
 doctorssn CHAR(11) NOT NULL,
 doctorname CHAR(25) NOT NULL,
 doctortitle CHAR(3) NOT NULL,
 doctoryears CHAR(2) NOT NULL,
 PRIMARY KEY (doctorssn)
);
-- Creating table patient
CREATE TABLE patient (
 patientssn CHAR(11) NOT NULL,
 patientname CHAR(25) NOT NULL,
 patientage CHAR(3) NOT NULL,
 patientaddress CHAR(25) NOT NULL,
 doctorssn char(11) NOT NULL,
 PRIMARY KEY (patientssn),
 FOREIGN KEY (doctorssn) REFERENCES doctor(doctorssn)
);
-- Creating table pharmacy company
CREATE TABLE pharmacompany (
 pharmacompid CHAR(3) NOT NULL,
 pharmacompname CHAR(25) NOT NULL,
 pharmacompphone CHAR(9) NOT NULL,
 PRIMARY KEY (pharmacompid)
);
-- Creating table pharmacy
CREATE TABLE pharmacy (
 pharmacyid CHAR(3) NOT NULL,
 pharmacyname CHAR(25) NOT NULL,
 pharmacyphone CHAR(9) NOT NULL,
 PRIMARY KEY (pharmacyid)
);
-- Creating table drugs
CREATE TABLE drugs (
 drugid CHAR(3) NOT NULL,
 drugtradename VARCHAR(25) NOT NULL,
 drugformula VARCHAR(25) NOT NULL,
 pharmacompid CHAR(3) NOT NULL,
 PRIMARY KEY (drugid),
 FOREIGN KEY (pharmacompid) REFERENCES pharmacompany(pharmacompid)
);
-- Creating table stock
CREATE TABLE stock (
 stockdatakey CHAR(3) NOT NULL,
 drugid CHAR(3) NOT NULL,
 pharmadrugprice NUMERIC(7, 2) NOT NULL,
 pharmacyid CHAR(3) NOT NULL,
 PRIMARY KEY (stockdatakey),
 FOREIGN KEY (drugid) REFERENCES drugs(drugid),
 FOREIGN KEY (pharmacyid) REFERENCES pharmacy(pharmacyid)
);
 
-- Creating table prescription
CREATE TABLE prescription (
 prescriptiondatakey CHAR(3) NOT NULL,
 patientssn CHAR(9) NOT NULL,
 doctorssn CHAR(9) NOT NULL,
 drugid CHAR(3) NOT NULL,
 PRIMARY KEY (prescriptiondatakey),
 FOREIGN KEY (drugid) REFERENCES drugs(drugid),
 FOREIGN KEY (patientssn) REFERENCES patient(patientssn),
 FOREIGN KEY (doctorssn) REFERENCES doctor(doctorssn)
);
 
-- Creating table filled prescription
CREATE TABLE filledprescription (
 prescriptiondatakey CHAR(3) NOT NULL,
 filldate DATE NOT NULL,
 pharmacyid CHAR(3) NOT NULL,
 PRIMARY KEY (prescriptiondatakey),
 FOREIGN KEY (prescriptiondatakey) REFERENCES prescription(perscriptiondatakey),
 FOREIGN KEY (pharmacyid) REFERENCES pharmacy(pharmacyid)
);
 
-- creating table contracts
CREATE TABLE contracts (
 contracttext TEXT,
 supervisorid CHAR(3) NOT NULL,
 startdate DATE,
 enddate DATE,
 pharmacyid CHAR(3) NOT NULL,
 pharmacompid CHAR(3) NOT NULL,
 FOREIGN KEY (pharmacyid) REFERENCES pharmacy(pharmacyid),
 FOREIGN KEY (pharmacompid) REFERENCES pharmacompany(pharmacompid)
);



-- doctorssn, doctorname, doctortitle, doctoryears
INSERT INTO doctor VALUES ('420-06-1964','Harvey Birdman','Ornithologist','23');
INSERT INTO doctor VALUES ('624-12-1544','Charles Xavier','Allergist','14');
INSERT INTO doctor VALUES ('943-23-8532','Chesed Davian','Cardiologist','9');
-- patientssn, patientname, patientname, patientage, patientaddress, doctorssn
INSERT INTO patient VALUES ('579-36-3267','Carmen Sandy','32','8618 Bay Ave. Laguna Niguel, CA 92677','943-23-8532');
INSERT INTO patient VALUES ('601-51-9530','Barbie Russ','51','398 Second Lane Fountain Valley, CA 92708','624-12-1544');
INSERT INTO patient VALUES ('526-96-6122','Raine Selwyn','67','7764 Gartner Street Tracy, CA 95376','420-06-1964');
INSERT INTO patient VALUES ('047-44-8361','Deziree Royalty','25','131 Old York Lane Los Angeles, CA 90063','624-12-1544');
INSERT INTO patient VALUES ('764-09-9179','Vikki Tyrrell','35','473 Bridle Drive Corona, CA 92882','943-23-8532');
INSERT INTO patient VALUES ('600-20-0733','Petra Roy','24','8439 Cooper Road San Jose, CA 95122','943-23-8532');
-- pharmacompid, pharmacompname, pharmacompphone
INSERT INTO pharmacompany VALUES ('120','Lobotomy Corporation','202-555-0171');
INSERT INTO pharmacompany VALUES ('453','Geneco Development','518-555-6545');
INSERT INTO pharmacompany VALUES ('542','Umbrella Corporation','410-555-0106');
-- pharmacyid, pharmacyname, pharmacyphone
INSERT INTO pharmacy VALUES ('349','Pills Here!','207-555-0117');
INSERT INTO pharmacy VALUES ('954','Medic''s Cabnet','237-555-9447');
INSERT INTO pharmacy VALUES ('332','Good and Proper RX','451-555-3931');
INSERT INTO pharmacy VALUES ('753','Unstoppable Drugs','543-555-6082');
INSERT INTO pharmacy VALUES ('021','Scarlet Medicine','934-555-2317');
-- drugid, drugtradename, drugformula, pharmacompid
-- As I lack information on what the hell a formula is, I will be using a template.
INSERT INTO drugs VALUES ('012','Enkephalin','FORUMLA132','120');
INSERT INTO drugs VALUES ('403','Prescript Ink','FORUMLA024','120');
INSERT INTO drugs VALUES ('054','Penetic Acid','FORUMLA049','453');
INSERT INTO drugs VALUES ('432','Bicardine','FORUMLA423','453');
INSERT INTO drugs VALUES ('008','T Anti-Virus','FORUMLA534','542');
INSERT INTO drugs VALUES ('605','Kelotane','FORUMLA954','542');
INSERT INTO drugs VALUES ('346','KoolKoff','FORUMLA543','542');
-- stockdatakey, drugid, pharmadrugprice, pharmacyid
INSERT INTO stock VALUES ('221','346','15.99','332');
INSERT INTO stock VALUES ('548','012','50.99','349');
INSERT INTO stock VALUES ('856','432','26.99','332');
INSERT INTO stock VALUES ('034','346','20.99','021');
INSERT INTO stock VALUES ('961','008','66.99','954');
INSERT INTO stock VALUES ('603','403','85.99','753');
INSERT INTO stock VALUES ('542','346','25.99','349');
INSERT INTO stock VALUES ('194','054','42.99','753');
INSERT INTO stock VALUES ('459','012','13.99','332');
INSERT INTO stock VALUES ('742','012','12.99','021');
-- presecriptiondatakey, patientssn, doctorssn, drugid
INSERT INTO prescription VALUES ('547','526-96-6122','624-12-1544','403');
INSERT INTO prescription VALUES ('234','526-96-6122','943-23-8532','012');
INSERT INTO prescription VALUES ('653','526-96-6122','624-12-1544','012');
INSERT INTO prescription VALUES ('873','526-96-6122','943-23-8532','054');
INSERT INTO prescription VALUES ('658','526-96-6122','420-06-1964','605');
INSERT INTO prescription VALUES ('554','526-96-6122','943-23-8532','605');
INSERT INTO prescription VALUES ('247','526-96-6122','420-06-1964','054');
-- prescriptiondatakey, filledate, pharmacyid
INSERT INTO filledprescription VALUES ('234','2020-11-30','349');
-- contracttext, supervisorid, startdate, enddate, pharmacyid, pharmacompid
INSERT INTO contracts VALUES ('This is the text of the contract','430','2020-01-30','2020-01-30','954','542');


-- The 5 Questions.

-- 1. Adding a new contract that Drugs R Us signed to the database.
INSERT INTO contracts VALUES ('This is the text of the contract','SUPERVISORID','STARTDATE','ENDDATE','PHARMACYID','PHARMACOMPID');

-- 2. Removing all of a type of drug from stock.
DELETE stock
FROM stock
INNER JOIN drugs
ON drugs.drugid=stock.drugid
WHERE drugtradename='KoolKoff';

-- 3. Getting lowest price among multiple locations
SELECT drugtradename, pharmadrugprice, pharmacyname
FROM ((stock
INNER JOIN drugs ON drugs.drugid = stock.drugid)
INNER JOIN pharmacy ON pharmacy.pharmacyid = stock.pharmacyid)
WHERE drugtradename = 'Enkephalin'
ORDER BY 2
LIMIT 1;

-- 4. Show all prescriptions for a user
SELECT patientname, drugtradename, doctorname
FROM ((prescription
INNER JOIN drugs ON drugs.drugid = prescription.drugid) INNER JOIN patient ON patient.patientssn = prescription.patientssn)INNER JOIN doctor ON doctor.doctorssn = prescription.doctorssn
WHERE patientname = 'Raine Selwyn';

-- 5. List all patients over 50 and their doctors.
SELECT patientname, patientage, doctorname
FROM patient
INNER JOIN doctor ON doctor.doctorssn = patient.doctorssn
WHERE patientage > 50;




