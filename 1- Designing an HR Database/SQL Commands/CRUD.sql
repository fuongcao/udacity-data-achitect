\echo Question 1: Return a list of employees with Job Titles and Department Names
SELECT emp.NAME, job.JOB_TITLE, dep.DEPARTMENT_NAME FROM EMP_ASSIGNMENTS asg 
         LEFT JOIN EMPLOYEES emp ON asg.EMPLOYEE_ID = emp.ID
         LEFT JOIN JOBS job ON asg.JOB_ID = job.ID
         LEFT JOIN DEPARTMENTS dep ON asg.DEPARTMENT_ID = dep.ID
         WHERE asg.END_DATE >= '2100-01-01'::date;

\echo Question 2: Insert Web Programmer as a new job title
INSERT INTO JOBS (JOB_TITLE) VALUES('Web Programmer');

SELECT * FROM JOBS;

\echo Question 3: Correct the job title from Web Programmer to Web Developer
UPDATE JOBS SET JOB_TITLE = 'Web Developer' WHERE JOB_TITLE = 'Web Programmer';

SELECT * FROM JOBS;

\echo Question 4: Delete the job title Web Developer from the database
DELETE FROM JOBS WHERE JOB_TITLE = 'Web Developer';

SELECT * FROM JOBS;

\echo Question 5: How many employees are in each department?
SELECT dep.DEPARTMENT_NAME, COUNT(1) NUMBER_OF_EMPLOYEE FROM EMP_ASSIGNMENTS asg
            INNER JOIN DEPARTMENTS dep on asg.DEPARTMENT_ID = dep.ID
            WHERE asg.END_DATE >= '2100-01-01'::date
            GROUP BY dep.DEPARTMENT_NAME;

\echo Question 6: Write a query that returns current and past jobs (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.
SELECT emp1.NAME, job.JOB_TITLE, dep.DEPARTMENT_NAME, emp2.Name MANAGER, asg.START_DATE, asg.END_DATE
    FROM EMP_ASSIGNMENTS asg 
         LEFT JOIN EMPLOYEES emp1 ON asg.EMPLOYEE_ID = emp1.ID
         LEFT JOIN EMPLOYEES emp2 ON asg.MANAGER_ID = emp2.ID
         LEFT JOIN JOBS job ON asg.JOB_ID = job.ID
         LEFT JOIN DEPARTMENTS dep ON asg.DEPARTMENT_ID = dep.ID
         WHERE emp1.NAME = 'Toni Lembeck';


 