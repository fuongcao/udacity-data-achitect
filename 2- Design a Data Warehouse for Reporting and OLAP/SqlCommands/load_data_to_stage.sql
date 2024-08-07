USE DATABASE UDACITY;
USE SCHEMA STAGING;

-- create csv file format
CREATE OR REPLACE FILE FORMAT mycsvformat
TYPE = 'CSV' 
COMPRESSION = 'auto' 
FIELD_DELIMITER = ',' 
RECORD_DELIMITER = '\n' 
SKIP_HEADER = 1 
ERROR_ON_COLUMN_COUNT_MISMATCH = true 
NULL_IF = ('NULL', 'null') 
EMPTY_FIELD_AS_NULL = true;

-- create json file format
CREATE OR REPLACE FILE FORMAT myjsonformat
TYPE = 'JSON' 
STRIP_OUTER_ARRAY = true;

-- create stage area for climate
CREATE OR REPLACE STAGE CLIMATE_DATA_STAGE file_format=mycsvformat;

-- create stage area for yeld
CREATE OR REPLACE STAGE YELP_DATA_STAGE file_format=myjsonformat;

-- create stage tables
/ *Drop if exists* /
DROP TABLE IF EXISTS STG_TEMPERATURE;
DROP TABLE IF EXISTS STG_PRECIPITATION;

DROP TABLE IF EXISTS STG_YELP_BUSINESS;
DROP TABLE IF EXISTS STG_YELP_USER;
DROP TABLE IF EXISTS STG_YELP_CHECKIN;
DROP TABLE IF EXISTS STG_YELP_REVIEW;
DROP TABLE IF EXISTS STG_YELP_TIP;
DROP TABLE IF EXISTS STG_YELP_COVID;

CREATE TABLE STG_TEMPERATURE ("DATE" STRING, "MIN" STRING, "MAX" STRING, "NORMAL_MIN" STRING, "NORMAL_MAX" STRING);
CREATE TABLE STG_PRECIPITATION ("DATE" STRING, "PRECIPITATION" STRING, "PREPICITATION_NORMAL" STRING);


CREATE TABLE STG_YELP_BUSINESS (BUSINES_INFO VARIANT);
CREATE TABLE STG_YELP_REVIEW (REVIEW_INFO VARIANT);
CREATE TABLE STG_YELP_USER (USER_INFO VARIANT);
CREATE TABLE STG_YELP_CHECKIN (CHECKIN_INFO VARIANT);
CREATE TABLE STG_YELP_TIP (TIP_INFO VARIANT);
CREATE TABLE STG_YELP_COVID (COVID_INFO VARIANT);

-- Put the file from local to the staging area
put file://climate/usw00023169-temperature-degreef.csv @climate_data_stage auto_compress=true;
put file://climate/usw00023169-las-vegas-mccarran-intl-ap-precipitation-inch.csv @climate_data_stage auto_compress=true;

put file://yelp_dataset/yelp_academic_dataset_business.json @yelp_data_stage auto_compress=true parallel=4;
put file://yelp_dataset/yelp_academic_dataset_review.json @yelp_data_stage auto_compress=true parallel=4;
put file://yelp_dataset/yelp_academic_dataset_user.json @yelp_data_stage auto_compress=true parallel=4;
put file://yelp_dataset/yelp_academic_dataset_checkin.json @yelp_data_stage auto_compress=true parallel=4;
put file://yelp_dataset/yelp_academic_dataset_tip.json @yelp_data_stage auto_compress=true parallel=4;
put file://yelp_dataset/yelp_academic_dataset_covid_features.json @yelp_data_stage auto_compress=true parallel=4;


-- LOAD file from STAGES to Tables
COPY INTO STG_TEMPERATURE FROM @climate_data_stage/usw00023169-temperature-degreef.csv.gz file_format=mycsvformat ON_ERROR = 'CONTINUE';
COPY INTO STG_PRECIPITATION FROM @climate_data_stage/usw00023169-las-vegas-mccarran-intl-ap-precipitation-inch.csv.gz file_format=mycsvformat ON_ERROR = 'CONTINUE';

COPY INTO STG_YELP_BUSINESS FROM @yelp_data_stage/yelp_academic_dataset_business.json.gz file_format=myjsonformat ON_ERROR = 'CONTINUE';
COPY INTO STG_YELP_REVIEW FROM @yelp_data_stage/yelp_academic_dataset_review.json.gz file_format=myjsonformat ON_ERROR = 'CONTINUE';
COPY INTO STG_YELP_USER FROM @yelp_data_stage/yelp_academic_dataset_user.json.gz file_format=myjsonformat ON_ERROR = 'CONTINUE';
COPY INTO STG_YELP_CHECKIN FROM @yelp_data_stage/yelp_academic_dataset_checkin.json.gz file_format=myjsonformat ON_ERROR = 'CONTINUE';
COPY INTO STG_YELP_TIP FROM @yelp_data_stage/yelp_academic_dataset_tip.json.gz file_format=myjsonformat ON_ERROR = 'CONTINUE';
COPY INTO STG_YELP_COVID FROM @yelp_data_stage/yelp_academic_dataset_covid_features.json.gz file_format=myjsonformat ON_ERROR = 'CONTINUE';


-- Cleaning by replacing T with NULL in PRECIPITATION colum in STG_PRECIPITATION table 
UPDATE STG_PRECIPITATION SET PRECIPITATION = NULL WHERE PRECIPITATION = 'T';