-- V1
SELECT DATE_TRUNC(DATE(start_time), DAY), latitude, longitude, AVG(DATETIME_DIFF(DATETIME(end_time), DATETIME(start_time), second))AS duration
FROM `bonza-interview.analyst.telecom_data`
GROUP BY 1,2,3;
 
-- V2 
SELECT DATE_TRUNC(DATE(start_time), DAY), latitude, longitude, AVG(UNIX_SECONDS(end_time)-UNIX_SECONDS(start_time))AS duration
FROM `bonza-interview.analyst.telecom_data`
GROUP BY 1,2,3