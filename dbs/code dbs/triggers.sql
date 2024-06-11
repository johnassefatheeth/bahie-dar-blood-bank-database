use bloodBank

--TO increament donation count			working(wuhu)

CREATE TRIGGER increment_donor_count
ON Blood_info
AFTER INSERT 
AS
BEGIN
    DECLARE @donor_id INT;

    SELECT @donor_id = Donor_id
    FROM Blood_info
    WHERE Blood_id = (SELECT Blood_id FROM inserted);

    UPDATE Donors
    SET Donation_count = Donation_count + 1
    WHERE Donor_ID = @donor_id;
END ;


-------------------------------------------------------------------------------

--to dispaly regeneration peoriod is over	---working(thumbs up)

CREATE TRIGGER auto_notify_donor
ON Blood_info
AFTER INSERT
AS
BEGIN
    DECLARE @donor_id INT;
    DECLARE @donation_date DATE;
    DECLARE @phone_number VARCHAR(255);
    DECLARE @f_name VARCHAR(255);
    DECLARE @l_name VARCHAR(255);

    SELECT @donor_id = Donor_id, @donation_date = Donation_date
    FROM Blood_info
    WHERE Blood_id = (SELECT Blood_id FROM inserted);

    SELECT @phone_number = Phone_Number, @f_name = F_Name, @l_name = L_Name
    FROM Donors
    WHERE Donor_ID = @donor_id;

    IF DATEDIFF(DAY, @donation_date, GETDATE()) >= 90
    BEGIN
        PRINT 'You can now donate blood once again. Phone Number: ' + @phone_number + ', Name: ' + @f_name + ' ' + @l_name;
    END;
END;





---------------------------------------------------------------------------------------------------------

--to update donation status---------fully working

CREATE TRIGGER update_donation_status
ON request_response
AFTER INSERT
AS
BEGIN
    UPDATE blood_info
    SET donation_status = inserted.request_id
    FROM inserted
    WHERE blood_info.blood_id = inserted.blood_id;
END;
-----------------------------------------------------------------------------------------------------------


--to set the final_result column in test table-------------fully working

CREATE TRIGGER update_final_result 
ON Test
AFTER INSERT 
AS
BEGIN
  UPDATE Test
  SET final_result = 
    CASE 
      WHEN Hepetitus_D <> 'p' AND Hepetitus_B <> 'p' AND AIDS <> 'p' AND shyphilis <> 'p' THEN 'clear'
      ELSE 'infected'
    END
 -- WHERE Test.ID = inserted.ID
END;

---------------------------------------------------------------------------------------------------
  

  --to set donation status column in blood info table-------NEEDS A BIT EDITING
  
CREATE TRIGGER set_donation_status
ON test
AFTER INSERT
AS
BEGIN
  UPDATE blood_info
  SET donation_status = 'available'
  FROM blood_info
  INNER JOIN inserted i ON blood_info.blood_id = i.blood_id
  WHERE i.final_result = 'clear'
  AND DATEDIFF(day, blood_info.Donation_date, GETDATE()) < 20;
END


--------------------------------------------------------------------------------------------------------