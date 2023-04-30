create database bloodBank

use bloodBank

CREATE TABLE City (
  City_id INT PRIMARY KEY,
  Location_name VARCHAR(255)
);

CREATE TABLE Managerial_staff (
  Managing_staff_ID INT PRIMARY KEY,
  F_Name VARCHAR(255),
  L_Name VARCHAR(255),
  Phone_Number VARCHAR(255)
);

CREATE TABLE Recording_staff (
  Recording_staff_ID INT PRIMARY KEY,
  F_Name VARCHAR(255),
  L_Name VARCHAR(255),
  Phone_Number VARCHAR(255),
  city_ID int,
  foreign key(city_ID) references City(City_id)
);

CREATE TABLE Hospital_info (
  Hospital_id INT PRIMARY KEY,
  Name VARCHAR(255),
  City_id INT,
  FOREIGN KEY (City_id) REFERENCES City(City_id)
);

CREATE TABLE Donors (
  Donor_ID INT PRIMARY KEY,
  F_Name VARCHAR(255),
  L_Name VARCHAR(255),
  Birthdate DATE,
  Sex VARCHAR(255),
  Blood_group VARCHAR(255),
  Phone_Number VARCHAR(255),
  Donation_count INT,
);


CREATE TABLE Blood_info (
  Blood_id INT PRIMARY KEY,
  Donor_id INT,
  Donation_date DATE,
  Donor_Weight INT,
  Donor_BMI INT,
  Donor_Blood_pressure INT,
  Amount_of_collected INT,
  City_id INT,
  Recorder_id INT,
  Donation_status varchar(40),
  FOREIGN KEY (Recorder_id) REFERENCES Recording_staff(Recording_staff_ID),
  FOREIGN KEY (Donor_id) REFERENCES Donors(Donor_ID),
  FOREIGN KEY (City_id) REFERENCES City(City_id)
);

CREATE TABLE Request (
  Request_id int PRIMARY KEY,
  Hospital_id INT ,
  request_date DATE,
  Amount_of_A_plus float,
  Amount_of_A_minus INT,
  Amount_of_B_plus INT,
  Amount_of_B_minus INT,
  Amount_of_AB_plus INT,
  Amount_of_AB_minus INT,
  Amount_of_O_plus INT,
  Amount_of_O_minus INT,
  request_state varchar(50),
  foreign key (Hospital_id) references Hospital_info(Hospital_id)
);


CREATE TABLE Test (
  Specimen_ID INT PRIMARY KEY,
  Donor_id INT,
  Blood_group VARCHAR(255),
  Manager_id INT,
  Hepetitus_D VARCHAR(1),
  Hepetitus_B VARCHAR(1),
  AIDS VARCHAR(1),
  shyphilis VARCHAR(1),
  final_result VARCHAR(255),
  foreign key(Manager_id) references Managerial_staff(Managing_staff_ID),
  foreign key(Donor_id) references Donors(Donor_ID));

  CREATE TABLE blood_spec(
	blood_id INT PRIMARY KEY,
    Specimen_id INT,
	foreign key(Specimen_id )references test(Specimen_ID),
	foreign key(blood_id )references blood_info(blood_ID)
  );

  CREATE TABLE request_response (
  blood_id INT PRIMARY KEY,
  request_id INT,
  FOREIGN KEY (blood_id) REFERENCES blood_info(Blood_id),
  FOREIGN KEY (request_id) REFERENCES Request(Request_id)
);




select * from City
select * from Blood_info
select * from Donors
select * from Managerial_staff
select * from Recording_staff
select * from Test
select * from request_response
select * from Request
select * from blood_spec
select * from Hospital_info





  /*
  City table
Hospital_info table
Managerial_staff table
Recording_staff table
Donors table
Blood_info table
Test table
Request table
blood_spec table
request state*/
