## Data Warehouse DWH for the purpose of reporting and online analytical processing (OLAP)

### Sumary:

In this project scenario, we will use the actual YELP and climate datasets in order to analyze the effects the weather has on customer reviews of restaurants. The data for temperature and precipitation observations are from the Global Historical Climatology Network-Daily (GHCN-D) database. We will architect and design a Data Warehouse DWH for the purpose of reporting and online analytical processing (OLAP) using a leading industry cloud-native data warehouse system called Snowflake.

### Dataset:

- In this project, you will merge two massive, real-world datasets in order to draw conclusions about how weather affects Yelp reviews.

#### 1. YELP DATA (https://www.yelp.com/dataset/download)

- 1 .tgz file compressed, after uncompressed includes: 1 .pdf file and 5 .json files.
  1. [Dataset_User_Agreement.pdf](data/yelp_sample/Dataset_User_Agreement.pdf)
  2. [yelp_academic_dataset_business.json](data/yelp_sample/yelp_academic_dataset_business.json)
  3. [yelp_academic_dataset_checkin.json](data/yelp_sample/yelp_academic_dataset_checkin.json)
  4. [yelp_academic_dataset_review.json](data/yelp_sample/yelp_academic_dataset_review.json)
  5. [yelp_academic_dataset_tip.json](data/yelp_sample/yelp_academic_dataset_tip.json)
  6. [yelp_academic_dataset_user.json](yelp_academic_dataset_user.json)

#### 2. CLIMATE DATA

The data files contain historical weather data for the city of Las Vegas (Nevada) (Weather Station - USW00023169), and were obtained from Climate Explorer(opens in a new tab).

- **Precipitation Data**: [USW00023169-LAS VEGAS MCCARRAN INTL AP-PRECIPITATION-INCH](data/climate/usw00023169-las-vegas-mccarran-intl-ap-precipitation-inch.csv)
- **Temperature Data**: [USW00023169-TEMPERATURE-DEGREEF](data/climate/usw00023169-temperature-degreef.csv)

### Project Instructions:

1. Create a data architechure digram.
2. Create a Staging environment schema in snowflake.
3. Upload all YELP and CLIMATE data to the STAGING environment.
4. Create an OSD environment schema.
5. Draw an entity-relationship (ER) diagram.
6. Migrate the data into ODS environment.
7. Draw a STAR schema for Data Warehouse (DWH) environment.
8. Migration the data to the DWH.
9. Query the DWH.
