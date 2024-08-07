#nulls amazon_review table
SELECT *
FROM (
  SELECT
    'user_id' AS column_name,
    COUNT(*) AS null_count
  FROM
    proyecto4datalab.amazon.amazon_review
  WHERE
    user_id IS NULL

  UNION ALL

  SELECT
    'user_name' AS column_name,
    COUNT(*) AS null_count
  FROM
    proyecto4datalab.amazon.amazon_review
  WHERE
    user_name IS NULL

  UNION ALL

  SELECT
    'review_id' AS column_name,
    COUNT(*) AS null_count
  FROM
    proyecto4datalab.amazon.amazon_review
  WHERE
    review_id IS NULL

  UNION ALL

  SELECT
    'review_title' AS column_name,
    COUNT(*) AS null_count
  FROM
    proyecto4datalab.amazon.amazon_review
  WHERE
    review_title IS NULL

  UNION ALL

  SELECT
    'img_link' AS column_name,
    COUNT(*) AS null_count
  FROM
    proyecto4datalab.amazon.amazon_review
  WHERE
    img_link IS NULL

  UNION ALL

  SELECT
    'product_link' AS column_name,
    COUNT(*) AS null_count
  FROM
    proyecto4datalab.amazon.amazon_review
  WHERE
    product_link IS NULL

  UNION ALL

  SELECT
    'product_id' AS column_name,
    COUNT(*) AS null_count
  FROM
    proyecto4datalab.amazon.amazon_review
  WHERE
    product_id IS NULL

  UNION ALL

  SELECT
    'rating' AS column_name,
    COUNT(*) AS null_count
  FROM
    proyecto4datalab.amazon.amazon_review
  WHERE
    rating IS NULL

  UNION ALL

  SELECT
    'rating_count' AS column_name,
    COUNT(*) AS null_count
  FROM
    proyecto4datalab.amazon.amazon_review
  WHERE
    rating_count IS NULL
) AS combined_results
ORDER BY column_name ASC;


#nulls amazon_product table

SELECT
  'product_id' AS column_name,
  COUNT(*) AS null_count
FROM
  proyecto4datalab.amazon.amazon_product
WHERE
  product_id IS NULL

UNION ALL

SELECT
  'product_name' AS column_name,
  COUNT(*) AS null_count
FROM
  proyecto4datalab.amazon.amazon_product
WHERE
  product_name IS NULL

UNION ALL

SELECT
  'category' AS column_name,
  COUNT(*) AS null_count
FROM
  proyecto4datalab.amazon.amazon_product
WHERE
  category IS NULL

UNION ALL

SELECT
  'discounted_price' AS column_name,
  COUNT(*) AS null_count
FROM
  proyecto4datalab.amazon.amazon_product
WHERE
  discounted_price IS NULL

UNION ALL

SELECT
  'actual_price' AS column_name,
  COUNT(*) AS null_count
FROM
  proyecto4datalab.amazon.amazon_product
WHERE
  actual_price IS NULL

UNION ALL

SELECT
  'discount_percentage' AS column_name,
  COUNT(*) AS null_count
FROM
  proyecto4datalab.amazon.amazon_product
WHERE
  discount_percentage IS NULL

UNION ALL

SELECT
  'about_product' AS column_name,
  COUNT(*) AS null_count
FROM
  proyecto4datalab.amazon.amazon_product
WHERE
  about_product IS NULL;
