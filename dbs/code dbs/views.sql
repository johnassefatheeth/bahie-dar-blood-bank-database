use bloodBank

--to display available blood			WORKING

CREATE VIEW availble_blood AS
SELECT *
FROM blood_info
WHERE donation_status='availble' ;


drop view availble_blood

SELECT * FROM availble_blood


INSERT INTO Blood_info (Blood_id, Donor_id, Donation_date, Donor_Weight, Donor_BMI, Donor_Blood_pressure, Amount_of_collected, City_id, Recorder_id, Donation_status)
VALUES

(23,2,'2023-02-20',50,25,120,400,1,1,'availble');
---------------------------------------------------------------------------------------------

--TO display outdated blood				working

CREATE VIEW outdated_blood AS
SELECT *
FROM blood_info 
WHERE Donation_status='outdated';

select* from outdated_blood

---------------------------------------------------------------------------------------------

--to display number of donors by area			 WORKING

CREATE VIEW number_of_donors_by_area AS
SELECT 
    City_id, 
    COUNT(donor_id) AS number_of_donors
FROM 
    Blood_info
WHERE 
    donation_date BETWEEN '04-03-2022' AND GETDATE()
GROUP BY 
    City_id;


	select * from number_of_donors_by_area
	---------------------------------------------------------------------------------------------

