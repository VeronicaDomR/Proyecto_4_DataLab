#correlacion rating con palabras negativas
SELECT
  CORR(total_negative_count, adjusted_rating) AS correlation
FROM
  proyecto4datalab.amazon.dummies_conteo_sentimientos

#correlación promedio de rating con palabras negativas 
SELECT
  CORR(total_negative_count, avg_adjusted_rating) AS correlation
FROM
  proyecto4datalab.amazon.dummies_conteo_sentimientos

#spearman

WITH ranked_data AS (
  SELECT
    total_negative_count,
    adjusted_rating,
    RANK() OVER (ORDER BY total_negative_count) AS rank_neg_count,
    RANK() OVER (ORDER BY adjusted_rating) AS rank_rating
  FROM
    proyecto4datalab.amazon.dummies_conteo_sentimientos
)
, differences AS (
  SELECT
    total_negative_count,
    adjusted_rating,
    rank_neg_count,
    rank_rating,
    (rank_neg_count - rank_rating) AS d,
    POWER(rank_neg_count - rank_rating, 2) AS d_squared
  FROM
    ranked_data
)
, sum_d_squared AS (
  SELECT
    SUM(d_squared) AS sum_d2,
    COUNT(*) AS n
  FROM
    differences
)
SELECT
  1 - (6 * sum_d2) / (n * (POWER(n, 2) - 1)) AS spearman_coefficient
FROM
  sum_d_squared
