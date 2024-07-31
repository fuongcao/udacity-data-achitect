-- feed data to EDUCATIONS table 

INSERT INTO EDUCATIONS (EDUCATION_LEVEL)
    SELECT DISTINCT education_lvl from proj_stg;