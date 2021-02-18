SELECT acu.first_online, acu.month_number, ROUND(100-((acu.total_user/tu.total_user)*100),2) AS churn_rate  FROM
(select ft.first_online,
   FLOOR((DATE_DIFF(mt.month_online,ft.first_online, DAY))/30)AS month_number,
   COUNT(DISTINCT mt.user_id)as total_user
FROM
   (SELECT user_id, MIN(DATE_TRUNC(DATE(start_time), MONTH))AS first_online
   FROM `bonza-interview.analyst.telecom_data`
   GROUP BY 1)ft
INNER JOIN
   (SELECT DISTINCT user_id, DATE_TRUNC(DATE(start_time), MONTH)AS month_online
   FROM `bonza-interview.analyst.telecom_data`
   ORDER BY 1)mt on mt.user_id=ft.user_id
GROUP BY 1,2)acu
INNER JOIN
(SELECT first_online, COUNT(DISTINCT user_id)AS total_user
FROM
   (SELECT user_id, MIN(DATE_TRUNC(DATE(start_time), MONTH))as first_online
   FROM `bonza-interview.analyst.telecom_data`
   GROUP BY 1)fo
GROUP BY 1)tu ON tu.first_online = acu.first_online
ORDER BY 1,2