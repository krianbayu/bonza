-- Start Time
SELECT DATE_TRUNC(DATE(start_time), MONTH)AS start_time, COUNT(DISTINCT user_id)AS active_users
FROM `bonza-interview.analyst.telecom_data`
GROUP BY 1
ORDER BY 1 DESC;
 
-- End Time
SELECT DATE_TRUNC(DATE(start_time), MONTH)AS start_time, COUNT(DISTINCT user_id)AS active_users
FROM `bonza-interview.analyst.telecom_data`
GROUP BY 1
ORDER BY 1 DESC;
