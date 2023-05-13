use bloodBank

-- to add donation				working

CREATE PROCEDURE donations (@blood_id INT, @donor_id INT, @donation_date DATE,@weight INT,@BMI INT,@blood_p int, @amount FLOAT,@city_id int,@recprder_id int ,@donoation_status varchar(40))
AS
BEGIN
  INSERT INTO blood_info (Blood_id,Donor_id,Donation_date,Donor_Weight,Donor_BMI,Donor_Blood_pressure,Amount_of_collected ,City_id ,Recorder_id ,Donation_status )
  VALUES (@blood_id , @donor_id , @donation_date ,@weight ,@BMI ,@blood_p , @amount ,@city_id ,@recprder_id,@donoation_status);
END;

EXEC donations @blood_id =13, @donor_id =5, @donation_date ='2022-11-11',@weight =67,@BMI=24,@blood_p =120, @amount =350,@city_id=2,@recprder_id=3 ,@donoation_status='testing'
--------------------------------------------------------------------------------------------------


--to add test result					WORKING



CREATE PROCEDURE updateTest(@specimen_ID INT, @Hepetitus_D VARCHAR(1), @Hepetitus_B VARCHAR(1), @AIDS VARCHAR(1), @shyphilis VARCHAR(1))
AS
BEGIN
    UPDATE Test
    SET Hepetitus_D = @Hepetitus_D,
        Hepetitus_B = @Hepetitus_B,
        AIDS = @AIDS,
        shyphilis = @shyphilis
    WHERE Specimen_ID = @specimen_ID;
END ;

EXEC updateTest @specimen_ID=2,@Hepetitus_D='N',@Hepetitus_B='N',@AIDS='N',@shyphilis='N'
------------------------------------------------------------------------------------------------------


--to add new manager				WORKING


CREATE PROCEDURE addManagerialStaff(@Managing_staff_ID INT,
                                     @F_Name VARCHAR(255),
                                     @L_Name VARCHAR(255),
                                     @Phone_Number VARCHAR(255))
AS
BEGIN
  INSERT INTO Managerial_staff (Managing_staff_ID, F_Name, L_Name, Phone_Number)
  VALUES (@Managing_staff_ID, @F_Name, @L_Name, @Phone_Number);
END ;

EXEC addManagerialStaff @Managing_staff_ID=7,@F_Name='semere',@L_Name='berhe',@Phone_Number='0958563412'

------------------------------------------------------------------------------------------------------


--to add new recorder				WORKING


CREATE PROCEDURE add_recording_staff (
@Recording_staff_ID INT,
@F_Name VARCHAR(255),
@L_Name VARCHAR(255),
@Phone_Number VARCHAR(255),
@city_ID INT
)
AS
BEGIN
  INSERT INTO Recording_staff (Recording_staff_ID, F_Name, L_Name, Phone_Number, city_ID)
  VALUES (@Recording_staff_ID, @F_Name, @L_Name, @Phone_Number, @city_ID);
END ;


EXEC add_recording_staff @Recording_staff_ID=7,@F_Name='derbe',@L_Name='debele',@Phone_Number='0978564323',@city_ID=3

------------------------------------------------------------------------------------------------------

--to grant request					WORKS

CREATE PROCEDURE grant_request (@blood_id INT, @request_id INT)
AS
BEGIN
  INSERT INTO request_response (blood_id, request_id)
  VALUES (@blood_id, @request_id);
END ;


EXEC grant_request @blood_id=1,@request_id=2
----------------------------------------------------------------------------------------------------


--to display the top donors     TOTALLY WORKS


CREATE PROCEDURE GetDonorCounts
AS
BEGIN
  SELECT F_Name, L_Name, Donation_count 
  FROM Donors 
  ORDER BY Donation_count DESC;
END

EXEC GetDonorCounts

---------------------------------------------------------------------------------------------------

