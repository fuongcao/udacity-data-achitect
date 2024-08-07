-- SQL queries to generate a correlation report between climate data and Yelp data that clearly includes business name, temperature, precipitation, and ratings.

USE DATABASE UDACITY;
USE SCHEMA DWH;

SELECT 
    bus.NAME,
    cli.MIN TEMPERATURE_MIN,
    cli.MAX TEMPERATURE_MAX,
    cli.PRECIPITATION,
    rvw.STARS
FROM FACT_REVIEW rvw
    INNER JOIN DIM_BUSINESS bus ON rvw.BUSINESS_ID = bus.BUSINESS_ID
    INNER JOIN DIM_CLIMATE cli ON rvw.DATE = cli.DATE
    WHERE rvw.STARS >= 4;

