 
--to display donation history  WORKS PERFECTLY

CREATE FUNCTION donor_history (@donor_id INT)
RETURNS TABLE
AS
RETURN 
SELECT *
FROM Blood_info
WHERE Donor_id = @donor_id;

drop function donor_history

SELECT * FROM donor_history(7)
--------------------------------------------------------------------------------------------------

--to display total amount of blood available			working
CREATE FUNCTION total_blood()
RETURNS INT
AS
BEGIN
  DECLARE @total INT;

  SET @total = (SELECT SUM(Amount_of_collected)
                FROM Blood_info
                WHERE Donation_status='availble');

  RETURN @total;
END;

DROP FUNCTION total_blood;

print('the total blood availble is')
print(dbo.total_blood());



---------------------------------------------------------------------------------------------
--to display rank of area by donors			 working
CREATE FUNCTION rank_donors_by_area()
RETURNS @RES TABLE (location_name VARCHAR(255), number_of_donors INT)
AS
BEGIN
  WITH CTE AS (
    SELECT c.Location_name, COUNT(*) AS number_of_donors
    FROM Blood_info b
    JOIN Donors d ON b.Donor_id = d.Donor_ID
    JOIN City c ON b.City_id = c.City_id
    GROUP BY c.Location_name
  )
  INSERT INTO @RES
  SELECT location_name, number_of_donors
  FROM CTE
  ORDER BY number_of_donors DESC;
  
  RETURN;
END;
SELECT * FROM dbo.rank_donors_by_area();

---------------------------------------------------------------------------------------------------
--to dispaly infected people				 works fine
CREATE FUNCTION get_infected_donors ()
RETURNS @result TABLE (Donor_ID INT, F_Name VARCHAR(255), L_Name VARCHAR(255), Phone_Number VARCHAR(255), Positive_Test VARCHAR(255))
AS
BEGIN
    INSERT INTO @result
    SELECT D.Donor_ID, D.F_Name, D.L_Name, D.Phone_Number,
        (CASE 
            WHEN T.Hepetitus_D = 'p' THEN 'Hepetitus D'
            WHEN T.Hepetitus_B = 'p' THEN 'Hepetitus B'
            WHEN T.AIDS = 'p' THEN 'AIDS'
            WHEN T.shyphilis = 'p' THEN 'Syphilis'
            ELSE 'No positive test'
        END) AS Positive_Test
    FROM Donors D
    INNER JOIN Test T ON D.Donor_ID = T.Donor_ID
    WHERE T.final_result = 'INFECTED'
    RETURN;
END;

select * from get_infected_donors()

drop function get_infected_donors

--------------------------------------------------------------------------------------------------