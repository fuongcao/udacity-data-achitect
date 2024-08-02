--Populating data to EDUCATIONS table 
INSERT INTO EDUCATIONS (EDUCATION_LEVEL)
   SELECT DISTINCT education_lvl FROM proj_stg;
    
--Populating data to STATES table 
INSERT INTO STATES (STATE)
SELECT DISTINCT STATE FROM proj_stg stg;

--Populating data to CITIES table 
INSERT INTO CITIES (CITY, STATE_ID)
SELECT DISTINCT CITY, (SELECT ID FROM STATES WHERE STATE = stg.state) STATE_ID
            FROM proj_stg stg;

--Populating data to LOCATIONS table 
INSERT INTO LOCATIONS (LOCATION, ADDRESS, CITY_ID)
SELECT DISTINCT LOCATION, ADDRESS, (SELECT ID FROM CITIES WHERE CITY = stg.city) STATE_ID
            FROM proj_stg stg;

