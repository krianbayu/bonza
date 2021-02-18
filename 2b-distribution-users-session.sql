-- Query complete (10.8 sec elapsed, 331.5 MB processed)
-- The Longest Duration is 40877 - Data is splitted into 6 bins *roundup(40877/(40877/5))
 
SELECT RANGE_BUCKET(DATETIME_DIFF(DATETIME(end_time), DATETIME(start_time), second), GENERATE_ARRAY(shortest_duration , longest_duration, longest_duration/5))AS bucket,
   MIN(DATETIME_DIFF(DATETIME(end_time), DATETIME(start_time), second))AS shortest_duration,
   MAX(DATETIME_DIFF(DATETIME(end_time), DATETIME(start_time), second))AS longest_duration,
   COUNT(user_id)AS total_user
FROM `bonza-interview.analyst.telecom_data`
INNER JOIN
   (SELECT MAX(DISTINCT(DATETIME_DIFF(DATETIME(end_time), DATETIME(start_time), second)))AS longest_duration,
       MIN(DISTINCT(DATETIME_DIFF(DATETIME(end_time), DATETIME(start_time), second)))AS shortest_duration,
   FROM `bonza-interview.analyst.telecom_data`
   ORDER BY 1)mnmxd ON TRUE
GROUP BY 1