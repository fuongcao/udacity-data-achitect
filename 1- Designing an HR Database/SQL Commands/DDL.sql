
\echo 1. Creating EDUCATIONS Table (primary key - ID)
CREATE TABLE IF NOT EXISTS EDUCATIONS(
    ID SERIAL primary key,
    EDUCATION_LEVEL VARCHAR(50)
);

\echo 2. Creating JOBS Table (primary key - ID)
CREATE TABLE IF NOT EXISTS JOBS(
    ID SERIAL primary key,
    JOB_TITLE VARCHAR(50)
);

\echo 3. Creating STATES Table (primary key - ID)
CREATE TABLE IF NOT EXISTS STATES(
    ID SERIAL primary key,
    STATE VARCHAR(50)
);

\echo 4. Creating CITIES Table (primary key - ID)
CREATE TABLE IF NOT EXISTS CITIES(
    ID SERIAL primary key,
    CITY VARCHAR(50),
    STATE_ID INT references STATES(ID)
);

\echo 5. Creating LOCATIONS Table (primary key - ID, forein key - CITY_ID)
CREATE TABLE IF NOT EXISTS LOCATIONS(
    ID SERIAL primary key,
    LOCATION VARCHAR(50),
    ADDRESS VARCHAR(100),
    CITY_ID INT references CITIES(ID)
);

\echo 6. Creating DEPARTMENTS Table (primary key - ID)
CREATE TABLE IF NOT EXISTS DEPARTMENTS(
    ID SERIAL primary key,
    DEPARTMENT_NAME VARCHAR(50)
);

\echo 7. Creating EMPLOYEES Table (primary key - ID)
CREATE TABLE IF NOT EXISTS EMPLOYEES(
    ID VARCHAR(10) primary key,
    NAME VARCHAR(50),
    EMAIL VARCHAR(50),
    HIRE_DATE DATE,
    EDUCATION_ID INT references EDUCATIONS(ID)
);

\echo 8. Creating EMP_ASSIGNMENTS Table (primary key - ID, forein key - EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID, MANAGER_ID, LOCATION_ID)
CREATE TABLE IF NOT EXISTS EMP_ASSIGNMENTS(
    ID SERIAL primary key,
    EMPLOYEE_ID VARCHAR(10) references EMPLOYEES(ID),
    START_DATE DATE,
    END_DATE DATE,
    JOB_ID INT references JOBS(ID),
    DEPARTMENT_ID INT references DEPARTMENTS(ID),
    MANAGER_ID VARCHAR(10) references EMPLOYEES(ID),
    LOCATION_ID INT references LOCATIONS(ID),
    SALARY DECIMAL(12,2),
    UNIQUE (EMPLOYEE_ID, START_DATE) 
);