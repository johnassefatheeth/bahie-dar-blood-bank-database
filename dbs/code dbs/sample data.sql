use bloodBank


INSERT INTO City (City_id, Location_name) VALUES
(1, 'kebele 02'),
(2, 'kebele 03'),
(3, 'kebele 04'),
(4, 'kebele 05'),
(5, 'kebele 06');

INSERT INTO Hospital_info (Hospital_id, Name, City_id) VALUES
(1, 'gambiy Hospital', 1),
(2, 'tbebe giyon Hospital', 2),
(3, 'kidane mhret clinic', 3),
(4, 'Bahir Dar University Referral Hospital', 4),
(5, 'mekelakeya Hospital', 5);

INSERT INTO Managerial_staff (Managing_staff_ID, F_Name, L_Name, Phone_Number) VALUES
(1, 'Habtamu', 'Alemu', '0911123456'),
(2, 'Tekalign', 'Tadesse', '0922234567'),
(3, 'Eskedar', 'Tefera', '0933345678'),
(4, 'Bizuayehu', 'Abate', '0944456789'),
(5, 'Mesfin', 'Wakjira', '0955678901');

INSERT INTO Recording_staff (Recording_staff_ID, F_Name, L_Name, Phone_Number, city_ID) VALUES
(1, 'Dawit', 'Tekle', '0911123456', 1),
(2, 'Abenezer', 'Tadesse', '0922234567', 2),
(3, 'Sara', 'Gebre', '0933345678', 3),
(4, 'Amsalu', 'Abera', '0944456789', 4),
(5, 'Liya', 'Tadesse', '0955678901', 5);

INSERT INTO Donors (Donor_ID, F_Name, L_Name, Birthdate, Sex, Blood_group, Phone_Number, Donation_count) VALUES
(1, 'Daniel', 'Alemu', '1995-01-01', 'Male', 'O+', '0911123456', 3),
(2, 'Fikre', 'Tadesse', '1997-02-02', 'Male', 'A-', '0922234567', 2),
(3, 'Aster', 'Gebre', '1999-03-03', 'Female', 'B+', '0933345678', 1),
(4, 'Solomon', 'Abera', '2000-04-04', 'Male', 'AB-', '0944456789', 4),
(5, 'Dina', 'Tadesse', '1998-05-05', 'Female', 'O-', '0955678901', 5);

-- Table: Blood_info
INSERT INTO Blood_info (Blood_id, Donor_id, Donation_date, Donor_Weight, Donor_BMI, Donor_Blood_pressure, Amount_of_collected, City_id, Recorder_id, Donation_status)
VALUES

(7,5,'2022-08-08',50,25,120,500,2,2,'testing');
(6,3,'2022-08-08',50,25,120,500,2,2,'testing');
(1, 1, '2022-01-01', 60, 22, 120, 500, 1, 1, 'available'),
(2, 2, '2022-02-01', 70, 24, 130, 550, 1, 2, 'available'),
(3, 3, '2022-03-01', 65, 23, 125, 525, 2, 3, 'testing'),
(4, 4, '2022-04-01', 75, 25, 135, 575, 2, 4, '4'),
(5, 5, '2022-05-01', 63, 21, 119, 495, 3, 5, 'outdated');

-- Table: Request
INSERT INTO Request (Request_id, Hospital_id, request_date, Amount_of_A_plus, Amount_of_A_minus, Amount_of_B_plus, Amount_of_B_minus, Amount_of_AB_plus, Amount_of_AB_minus, Amount_of_O_plus, Amount_of_O_minus, request_state)
VALUES
(1, 1, '2022-06-01', 50, 40, 30, 20, 10, 5, 25, 15, 'Accepted'),
(2, 2, '2022-07-01', 45, 35, 25, 15, 5, 2, 20, 10, 'Accepted'),
(3, 3, '2022-08-01', 40, 30, 20, 10, 3, 1, 15, 5, 'Pending'),
(4, 4, '2022-09-01', 35, 25, 15, 5, 2, 1, 10, 3, 'Accepted'),
(5, 5, '2022-10-01', 30, 20, 10, 3, 1, 1, 5, 2, 'Pending');

-- Table: Test
INSERT INTO Test (Specimen_ID, Donor_id, Blood_group, Manager_id, Hepetitus_D, Hepetitus_B, AIDS, shyphilis, final_result)
VALUES

(6, 4, 'A+', 2, 'p', 'N', 'N', 'N', 'Clear'),
(1, 1, 'A+', 1, 'N', 'N', 'N', 'N', 'Clear'),
(2, 2, 'B-', 2, 'N', 'N', 'N', 'N', 'Clear'),
(3, 3, 'AB+', 3, 'N', 'N', 'P', 'N', 'infected'),
(4, 4, 'O-', 4, 'N', 'N', 'N', 'N', 'Clear'),
(5, 5, 'A-', 5, 'N', 'N', 'N', 'N', 'Clear');

-- Table: blood_spec
INSERT INTO blood_spec (blood_id, Specimen_id)
VALUES
(15, 6);
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO request_response (blood_id ,request_id)
VALUES

(2,2);
(4,4);
