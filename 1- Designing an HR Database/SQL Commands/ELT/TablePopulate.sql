\echo 1. Populating data to EDUCATIONS table 
INSERT INTO EDUCATIONS (EDUCATION_LEVEL)
   SELECT DISTINCT education_lvl FROM proj_stg;
    
\echo 2. Populating data to STATES table 
INSERT INTO STATES (STATE)
   SELECT DISTINCT STATE FROM proj_stg stg;

\echo 3. Populating data to CITIES table 
INSERT INTO CITIES (CITY, STATE_ID)
   SELECT DISTINCT CITY, (SELECT ID FROM STATES WHERE STATE = stg.state) STATE_ID
            FROM proj_stg stg;

\echo 4. Populating data to LOCATIONS table 
INSERT INTO LOCATIONS (LOCATION, ADDRESS, CITY_ID)
   SELECT DISTINCT LOCATION, ADDRESS, (SELECT ID FROM CITIES WHERE CITY = stg.city) CITY_ID
            FROM proj_stg stg;

\echo 5. Populating data to JOBS table 
INSERT INTO JOBS (JOB_TITLE)
   SELECT DISTINCT job_title FROM proj_stg stg;

\echo 6. Populating data to DEPARTMENTS table 
INSERT INTO DEPARTMENTS (DEPARTMENT_NAME)
   SELECT DISTINCT department_nm
            FROM proj_stg stg;

\echo 7. Populating data to EMPLOYEES table 
INSERT INTO EMPLOYEES (ID, NAME, EMAIL, HIRE_DATE, EDUCATION_ID)
   SELECT DISTINCT
          Emp_ID, 
          Emp_NM, 
          email, 
          hire_dt,
          (SELECT ID FROM EDUCATIONS edu WHERE EDUCATION_LEVEL = stg.education_lvl) EDUCATION_ID
          FROM proj_stg stg;

\echo 8. Populating data to EMP_ASSIGNMENTS table 
INSERT INTO EMP_ASSIGNMENTS (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID, LOCATION_ID, MANAGER_ID, SALARY)
   SELECT Emp_ID, 
          start_dt, 
          end_dt,
          (SELECT ID FROM JOBS WHERE JOB_TITLE = stg.job_title) JOB_ID,
          (SELECT ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = stg.department_nm ) DEPARTMENT_ID,
          (SELECT loc.ID FROM LOCATIONS loc
                     INNER JOIN CITIES cit ON loc.CITY_ID = cit.ID
                     INNER JOIN STATES sta ON cit.STATE_ID = sta.ID
                     WHERE loc.LOCATION = stg.location
                     AND loc.ADDRESS = stg.ADDRESS
                     AND cit.CITY = stg.city
                     AND sta.STATE= stg.state
                     ) LOCATION_ID,
         (SELECT ID FROM EMPLOYEES WHERE NAME = stg.manager) MANAGER_ID,
          salary
          FROM proj_stg stg
          ORDER BY start_dt ASC;
