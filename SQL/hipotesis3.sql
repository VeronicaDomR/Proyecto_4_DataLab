WITH product_metrics AS (
  SELECT
    product_id,
    AVG(adjusted_rating) AS avg_rating, -- Calificación promedio por producto
    SUM(total_positive_count) AS total_positive_reviews -- Suma del conteo de reseñas positivas por producto
  FROM
    `proyecto4datalab.amazon.dummies_conteo_feelings`
  GROUP BY
    product_id
)

-- Cálculo de la correlación
SELECT
  CORR(total_positive_reviews, avg_rating) AS correlation_positive_reviews_avg_rating
FROM
  product_metrics;

  WITH product_metrics AS (
  SELECT
    product_id,
    AVG(adjusted_rating) AS avg_rating,  -- Calificación promedio por producto
    SUM(total_positive_count) AS total_positive_reviews -- Suma del conteo de reseñas positivas por producto
  FROM
    `proyecto4datalab.amazon.dummies_conteo_feelings`
  GROUP BY
    product_id
),
ranked_metrics AS (
  SELECT
    product_id,
    avg_rating,
    total_positive_reviews,
    RANK() OVER (ORDER BY avg_rating) AS rank_avg_rating, -- Rango de calificación promedio
    RANK() OVER (ORDER BY total_positive_reviews) AS rank_positive_reviews -- Rango de número de reseñas positivas
  FROM
    product_metrics
)

-- Cálculo de la correlación de Spearman
SELECT
  CORR(rank_positive_reviews, rank_avg_rating) AS spearman_correlation
FROM
  ranked_metrics;

--Aqui inicia para calcular el modelo de regresion lineal
CREATE OR REPLACE TABLE `proyecto4datalab.amazon.product_metrics` AS
WITH product_metrics AS (
  SELECT
    product_id,
    AVG(adjusted_rating) AS avg_rating,
    SUM(total_positive_count) AS total_positive_reviews
  FROM
    `proyecto4datalab.amazon.dummies_conteo_feelings`
  GROUP BY
    product_id
)
SELECT * FROM product_metrics;

CREATE OR REPLACE MODEL `proyecto4datalab.amazon.positive_reviews_regression_model`
OPTIONS
  (model_type='linear_reg', input_label_cols=['avg_rating']) AS
SELECT
  total_positive_reviews,
  avg_rating
FROM
  `proyecto4datalab.amazon.product_metrics`;
  SELECT
  *
FROM
  ML.WEIGHTS
  (MODEL `proyecto4datalab.amazon.positive_reviews_regression_model`);

SELECT
  *
FROM
  ML.EVALUATE
  (MODEL `proyecto4datalab.amazon.positive_reviews_regression_model`);

