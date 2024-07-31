
-- EDUCATIONS Table (primary key - ID)
CREATE TABLE IF NOT EXISTS EDUCATIONS(
    ID SERIAL primary key,
    EDUCATION_LEVEL VARCHAR(50)
);

-- JOBS Table (primary key - ID)
CREATE TABLE IF NOT EXISTS JOBS(
    ID SERIAL primary key,
    JOB_TITLE VARCHAR(50)
);

-- STATES Table (primary key - ID)
CREATE TABLE IF NOT EXISTS STATES(
    ID SERIAL primary key,
    STATE VARCHAR(50)
);

-- CITIES Table (primary key - ID)
CREATE TABLE IF NOT EXISTS CITIES(
    ID SERIAL primary key,
    CITY VARCHAR(50),
    STATE_ID INT references STATES(ID)
);

-- LOCATIONS Table (primary key - ID, forein key - CITY_ID)
CREATE TABLE IF NOT EXISTS LOCATIONS(
    ID SERIAL primary key,
    LOCATION VARCHAR(50),
    ADDRESS VARCHAR(100),
    CITY_ID INT references CITIES(ID)
);

-- DEPARTMENTS Table (primary key - ID)
CREATE TABLE IF NOT EXISTS DEPARTMENTS(
    ID SERIAL primary key,
    DEPARTMENT_NAME VARCHAR(50),
    LOCATION_ID INT references LOCATIONS(ID),
    MANAGER_ID VARCHAR(10)
);

-- EMPLOYEES Table (primary key - ID)
CREATE TABLE IF NOT EXISTS EMPLOYEES(
    ID VARCHAR(10) primary key,
    NAME VARCHAR(50),
    EMAIL VARCHAR(50),
    HIRE_DATE DATE,
    JOB_ID INT references JOBS(ID),
    DEPARTMENT_ID INT references DEPARTMENTS(ID),
    MANAGER_ID VARCHAR(10) references EMPLOYEES(ID),
    EDUCATION_ID INT references EDUCATIONS(ID),
    SALARY DECIMAL(12,2)
);

-- JOB_HISTORY Table (primary key - ID)
CREATE TABLE IF NOT EXISTS JOB_HISTORY(
    ID SERIAL primary key,
    EMPLOYEE_ID VARCHAR(10) references EMPLOYEES(ID),
    JOB_ID INT references JOBS(ID),
    START_DATE DATE,
    END_DATE DATE,
    DEPARTMENT_ID INT references DEPARTMENTS(ID)
);

-- Add remaining self reference forein key
ALTER TABLE DEPARTMENTS ADD CONSTRAINT department_employee_id_fkey FOREIGN KEY (MANAGER_ID)
REFERENCES EMPLOYEES(ID);