use bloodBank


--login for the system admin


CREATE LOGIN sysadmin WITH PASSWORD = '#12$%';
USE oth;
CREATE USER sysadmin FOR LOGIN sysadmin;
EXEC sp_addrolemember 'db_owner', 'sysadmin';

---------------------------------------------------------------------------------
--login for recorders


CREATE LOGIN recorder WITH PASSWORD = '#12$%', DEFAULT_DATABASE = 'oth';

CREATE SCHEMA donor_schema;
CREATE SCHEMA donation_state_schema;

ALTER SCHEMA donor_schema TRANSFER dbo.Donors;
ALTER SCHEMA donation_state_schema TRANSFER dbo.Donor_donation_state;

CREATE USER recorder FOR LOGIN recorder;

GRANT INSERT ON SCHEMA::donor_schema TO recorder;
GRANT SELECT ON SCHEMA::donor_schema TO recorder;
GRANT INSERT ON SCHEMA::donation_state_schema TO recorder;


---------------------------------------------------------------------------------

--login for councilers

-- Creating login for the councilor
CREATE LOGIN councilor WITH PASSWORD = '#12$%';

-- Setting default database for the councilor
USE [oth]
GO
EXEC sp_defaultdb @loginame = N'councilor', @defdb = N'oth'
GO

-- Creating schema to group related objects
CREATE SCHEMA health_info AUTHORIZATION dbo;

-- Creating view infected_people in the health_info schema
CREATE VIEW health_info.infected_people AS
SELECT *
FROM Blood_spec
WHERE Blood_spec.state = 'infected';

-- Granting SELECT privilege on the infected_people view to councilor
GRANT SELECT ON health_info.infected_people TO councilor;


------------------------------------------------------------------------------------

--login for mannagers

USE [master];
GO
CREATE LOGIN [manager] WITH PASSWORD = '#12$%', 
                 DEFAULT_DATABASE = [oth];
GO
USE [oth];
GO
CREATE USER [manager] FOR LOGIN [manager];
GO
GRANT ALTER ON [dbo].[request] TO [manager];
GRANT SELECT ON SCHEMA :: [dbo] TO [manager];
GO



