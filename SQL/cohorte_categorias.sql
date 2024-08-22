WITH cohort_analysis AS (
  SELECT 
    category_1,
    AVG(adjusted_rating) AS avg_rating,
    COUNTIF(adjusted_rating < 3) / COUNT(*) AS negative_review_ratio
  FROM 
    `proyecto4datalab.amazon.datset`
  GROUP BY 
    category_1
)
SELECT 
  category_1, 
  avg_rating, 
  negative_review_ratio
FROM 
  cohort_analysis
ORDER BY 
  avg_rating DESC;
