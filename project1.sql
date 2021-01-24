-- Creating Database for Drugs R Us
DROP DATABASE IF EXISTS Drugs_R_Us;
CREATE DATABASE Drugs_R_Us;
--Selecting Drugs R Us
USE Drugs_R_Us;
-- Creating table patient
CREATE TABLE patient (
  patientssn CHAR(9) NOT NULL,
  patientname CHAR(25) NOT NULL,
  patientage CHAR(3) NOT NULL,
  patientaddress CHAR(25) NOT NULL,
  doctorssn char(9) NOT NULL,
  PRIMARY KEY (patientssn),
  FOREIGN KEY (doctorssn) REFERENCES doctor(doctorssn)
);
-- Creating table doctor
CREATE TABLE doctor (
  doctorssn CHAR(9) NOT NULL,
  doctorname CHAR(25) NOT NULL,
  doctortitle CHAR(3) NOT NULL,
  doctoryears CHAR(2) NOT NULL,
  PRIMARY KEY (doctorssn)
);
-- Creating table pharmacy company
CREATE TABLE pharmacompany (
  pharmacompid CHAR(3) NOT NULL,
  PharmaCompname CHAR(25) NOT NULL,
  Pharmacompphone CHAR(9) NOT NULL,
  PRIMARY KEY (pharmacompid)
);
-- Creating table pharmacy
CREATE TABLE pharmacy (
  pharmacyid CHAR(3) NOT NULL,
  Pharmacyname CHAR(25) NOT NULL,
  Pharmacyphone CHAR(9) NOT NULL,
  PRIMARY KEY (pharamacyid)
);
-- Creating table drugs
CREATE TABLE drugs (
  drugid CHAR(3) NOT NULL,
  drugtradename VARCHAR(25) NOT NULL,
  drugformula VARCHAR(25) NOT NULL,
  pharamacompid CHAR(3) NOT NULL,
  PRIMARY KEY (drugid),
  FOREIGN KEY (pharmacompid) REFERENCES pharmacycompany(pharmacompid)
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
-- Creating table perscription
CREATE TABLE perscription (
  perscriptiondatakey CHAR(3) NOT NULL,
  patientssn CHAR(9) NOT NULL,
  doctorssn CHAR(9) NOT NULL,
  drugid CHAR(3) NOT NULL,
  PRIMARY KEY (perscriptiondatakey),
  FOREIGN KEY (drugid) REFERENCES drugs(drugid),
  FOREIGN KEY (patientssn) REFERENCES patient(patientssn),
  FOREIGN KEY (doctorssn) REFERENCES doctor(doctorssn)
);
-- Creating table filledperscription
CREATE TABLE filledperscription (
  perscriptiondatakey CHAR(3) NOT NULL,
  filldate DATE NOT NULL,
  pharmacyid CHAR(3) NOT NULL,
  PRIMARY KEY (perscriptiondatakey),
  FOREIGN KEY (pharmacyid) REFERENCES pharmacy(pharmacyid)
);
-- creating table contracts
CREATE TABLE contracts (
  contracttext CHAR(5000),
  supervisorid CHAR(3) NOT NULL,
  startdate DATE,
  enddate DATE,
  pharmacyid CHAR(3) NOT NULL,
  pharmacompid CHAR(3) NOT NULL,
  FOREIGN KEY (pharmacyid) REFERENCES pharmacy(pharmacyid),
  FOREIGN KEY (pharmacompid) REFERENCES pharmacycompany(pharmacompid)
);