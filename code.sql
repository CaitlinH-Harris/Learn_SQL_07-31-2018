 SELECT *
 FROM survey
 LIMIT 10;

 SELECT question, COUNT(response) as 'number_responses'
 FROM survey
 GROUP BY question;

 SELECT *
 FROM quiz
 LIMIT 5;
 
 SELECT *
 FROM home_try_on
 LIMIT 5;
 
 SELECT *
 FROM purchase
 LIMIT 5;

 SELECT DISTINCT q.user_id,
  h.user_id IS NOT NULL AS 'is_home_try_on',
  h.number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz q
 LEFT JOIN home_try_on h
  ON q.user_id = h.user_id
 LEFT JOIN purchase p
  ON p.user_id = q.user_id
 LIMIT 10;

WITH combined_data as (SELECT DISTINCT q.user_id,
  h.user_id IS NOT NULL AS 'is_home_try_on',
  h.number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz q
 LEFT JOIN home_try_on h
 	ON q.user_id = h.user_id
 LEFT JOIN purchase p
 	ON p.user_id = q.user_id)
SELECT (100.0 * SUM(is_home_try_on)/COUNT(user_id)) as 'pct_quiz_to_home'
FROM combined_data;

WITH combined_data as (SELECT DISTINCT q.user_id,
  h.user_id IS NOT NULL AS 'is_home_try_on',
  h.number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz q
 LEFT JOIN home_try_on h
 	ON q.user_id = h.user_id
 LEFT JOIN purchase p
 	ON p.user_id = q.user_id)
SELECT (100.0 * SUM(is_purchase)/SUM(is_home_try_on)) as 'pct_home_to_purchase'
FROM combined_data;

WITH combined_data as (SELECT DISTINCT q.user_id,
  h.user_id IS NOT NULL AS 'is_home_try_on',
  h.number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz q
 LEFT JOIN home_try_on h
 	ON q.user_id = h.user_id
 LEFT JOIN purchase p
 	ON p.user_id = q.user_id)
SELECT number_of_pairs,
 (100.0 * SUM(is_purchase)/SUM(is_home_try_on)) as 'pct_home_to_purchase'
FROM combined_data
GROUP BY number_of_pairs;

SELECT style, COUNT(*) AS 'style_count'
FROM quiz
GROUP BY style;

SELECT fit, COUNT(*) AS 'fit_count'
FROM quiz
GROUP BY fit;

SELECT style, fit, COUNT(*) AS 'fit_count'
FROM quiz
GROUP BY style, fit;

SELECT style, fit, COUNT(*) AS 'fit_count'
FROM quiz
GROUP BY fit, style;

SELECT shape, COUNT(*) AS 'shape_count'
FROM quiz
GROUP BY shape;

SELECT fit, shape, COUNT(*) AS 'shape_count'
FROM quiz
GROUP BY fit, shape;

SELECT style, shape, COUNT(*) AS 'shape_count'
FROM quiz
GROUP BY style, shape;

SELECT color, COUNT(*) AS 'color_count'
FROM quiz
GROUP BY color;

SELECT style, COUNT(*) AS 'style_count'
FROM purchase
GROUP BY style;

SELECT model_name, COUNT(*) AS 'model_count'
FROM purchase
GROUP BY model_name;

SELECT price, COUNT(*) AS 'price_count'
FROM purchase
GROUP BY price
ORDER BY price DESC;