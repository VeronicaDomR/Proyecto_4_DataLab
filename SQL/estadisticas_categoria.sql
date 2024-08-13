WITH stats AS (
  SELECT
    category_1,
    discounted_price,
    rating_count_clean,
    PERCENTILE_CONT(discounted_price, 0.25) OVER(PARTITION BY category_1) AS q1,
    PERCENTILE_CONT(discounted_price, 0.5) OVER(PARTITION BY category_1) AS median_price,
    PERCENTILE_CONT(discounted_price, 0.75) OVER(PARTITION BY category_1) AS q3
  FROM `proyecto4datalab.amazon.datset`
),
descriptive_stats_by_category AS (
  SELECT
    category_1,
    MIN(discounted_price) AS min_price,
    MAX(discounted_price) AS max_price,
    AVG(discounted_price) AS mean_price,
    STDDEV(discounted_price) AS stddev_price,
    MAX(q1) AS q1,
    MAX(median_price) AS median_price,
    MAX(q3) AS q3
  FROM stats
  GROUP BY category_1
),
correlation_by_category AS (
  SELECT
    category_1,
    CORR(discounted_price, rating_count_clean) AS correlation
  FROM `proyecto4datalab.amazon.datset`
  GROUP BY category_1
)
SELECT
  d.category_1,
  d.min_price,
  d.max_price,
  d.mean_price,
  d.stddev_price,
  d.q1,
  d.median_price,
  d.q3,
  c.correlation
FROM descriptive_stats_by_category d
JOIN correlation_by_category c
ON d.category_1 = c.category_1;
