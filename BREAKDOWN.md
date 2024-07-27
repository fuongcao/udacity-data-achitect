## I. Gather business requirements for a new database request and create a non-technical proposal document.

1. Business purpose for creating the database

```
- Converting the current HR shared Excel file into a datbase to manage the company growing up from 10 employees to 200.
```

2. Outline data to be stored

```
- All databases are given a standard partition of 1 GB by the server group. Ask users about the expected
growth of data. Databases larger than or expected to exceed 10K rows of data in the next year should
ask for a large partition space.
- Databases are stored on spinning disk by default.
```

3. List estimate size of the database and growth rate

```
- 10 employees to 200 in only 6 months. (projecting a 20% growth a year for the next 5 years)
- 1 location (Dallas - Texas) to 4 other locations nationwide (New York City - NY, San Francisco - CA, Minneapolis - MN, and Nashville - TN).
- The curent shared Excel file contain 15 columns and 205 rows
```

4. Who will own/manage data

```
- HR Managment and employees.
```

5. Who will be able to access the data

```
- Any employee with a domain login to be have read only access the database.
```

6. Sensitive/restricted data

```
- HR and management level employees only access to salary information.
- Management and HR employees should also be the only ones with write access. 90% of users will be read only.
```

7. Outline data retention and backup requirements

```
- Retention: least 7 years
- Backup (considered business critical data):
  - Standard: Backup schedule is a full backup 1x per week.
  - Archive: Backup schedule is a full backup 1x per month.
  - Critical: Backup schedule is full backup 1x per week, incremental backup daily.
```
