use bloodBank



--to add donor info and donation info

BEGIN TRANSACTION

INSERT INTO Donors (Donor_ID, F_Name, L_Name, Birthdate, Sex, Blood_group, Phone_Number, Donation_count)
VALUES (7, 'derbe', 'sme', '1990-01-01', 'Male', 'A+', '+2519567890', 0);

INSERT INTO Blood_info (Blood_id, Donor_id, Donation_date, Donor_Weight, Donor_BMI, Donor_Blood_pressure, Amount_of_collected, City_id, Recorder_id, Donation_status)
VALUES (8, 7, '2022-01-01', 75, 25, 120, 100, 1, 1, 'testing');

IF (
SELECT COUNT()
FROM Donors
WHERE Donor_ID = 7
) = 1 AND (
SELECT COUNT()
FROM Blood_info
WHERE Blood_id = 7
) = 1
BEGIN
COMMIT;
END;
ELSE
BEGIN
ROLLBACK;
END;

COMMIT TRANSACTION--------------------------------------------------------------------------------------------------