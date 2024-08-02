-- Standout Suggestion 1
\echo create EMP_ASSIGNMENTS_W View that not contain SALARY INFORMATION
CREATE OR REPLACE VIEW EMP_ASSIGNMENTS_W AS 
SELECT 
    ID ,
    EMPLOYEE_ID,
    START_DATE,
    END_DATE,
    JOB_ID,
    DEPARTMENT_ID,
    MANAGER_ID,
    LOCATION_ID
FROM 
  EMP_ASSIGNMENTS;

\echo Query from EMP_ASSIGNMENTS_W
SELECT * FROM EMP_ASSIGNMENTS_W LIMIT 10;

-- Standout Suggestion 2
CREATE OR REPLACE FUNCTION GET_EMPLOYEE_INFO()
  RETURNS TABLE (NAME varchar, JOB_TITLE varchar, DEPARTMENT_NAME varchar, MANAGER varchar, START_DATE date, END_DATE date) 
AS
$func$
  SELECT emp1.NAME, job.JOB_TITLE, dep.DEPARTMENT_NAME, emp2.Name MANAGER, asg.START_DATE, asg.END_DATE
        FROM EMP_ASSIGNMENTS asg 
            LEFT JOIN EMPLOYEES emp1 ON asg.EMPLOYEE_ID = emp1.ID
            LEFT JOIN EMPLOYEES emp2 ON asg.MANAGER_ID = emp2.ID
            LEFT JOIN JOBS job ON asg.JOB_ID = job.ID
            LEFT JOIN DEPARTMENTS dep ON asg.DEPARTMENT_ID = dep.ID
            WHERE emp1.NAME = name;
$func$ 
LANGUAGE sql;

SELECT * FROM GET_EMPLOYEE_INFO(emp_name => 'Toni Lembeck');

-- Standout Suggestion 3
----------Non Management level------------------------------------------------------------
-- create non-management Role
CREATE ROLE NoMgr LOGIN PASSWORD 'YourPassword';

-- Grant all read only access to nonManager
GRANT SELECT ON ALL TABLES IN SCHEMA 'mySChema' TO NoMgr;

GRANT SELECT ON EMP_ASSIGNMENTS_W IN SCHEMA 'mySChema' TO NoMgr;

-- Then revoke readonly access to EMP_ASSIGNMENTS table 
REVOKE SELECT ON TABLE EMP_ASSIGNMENTS IN SCHEMA 'schema_name' FROM NoMgr;


----------Management level------------------------------------------------------------
-- Create Management Role
CREATE ROLE Managment LOGIN PASSWORD 'YourPassword';
-- Grant all read only access to nonManager
GRANT SELECT | INSERT | UPDATE | DELETE ON ALL TABLES IN SCHEMA 'mySChema' TO Management;