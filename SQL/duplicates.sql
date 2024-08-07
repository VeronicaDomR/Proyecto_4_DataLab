#duplicates_review
WITH duplicates AS (
  SELECT 
    'user_id' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    user_id 
  HAVING 
    COUNT(*) > 1

  UNION ALL

  SELECT 
    'user_name' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    user_name 
  HAVING 
    COUNT(*) > 1

  UNION ALL

  SELECT 
    'review_id' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    review_id 
  HAVING 
    COUNT(*) > 1

  UNION ALL

  SELECT 
    'review_title' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    review_title 
  HAVING 
    COUNT(*) > 1

  UNION ALL

  SELECT 
    'img_link' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    img_link 
  HAVING 
    COUNT(*) > 1

  UNION ALL

  SELECT 
    'product_link' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    product_link 
  HAVING 
    COUNT(*) > 1

  UNION ALL

  SELECT 
    'product_id' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    product_id 
  HAVING 
    COUNT(*) > 1

  UNION ALL

  SELECT 
    'rating' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    rating 
  HAVING 
    COUNT(*) > 1

  UNION ALL

  SELECT 
    'rating_count' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    rating_count 
  HAVING 
    COUNT(*) > 1

  UNION ALL

  SELECT 
    'review_content' AS column_name, 
    COUNT(*) AS duplicate_count 
  FROM 
    proyecto4datalab.amazon.amazon_review 
  GROUP BY 
    review_content 
  HAVING 
    COUNT(*) > 1
)
SELECT 
  column_name, 
  SUM(duplicate_count) AS total_duplicates 
FROM 
  duplicates
GROUP BY 
  column_name
ORDER BY 
  column_name ASC;


#duplicates_product 
-- Contar valores duplicados en la columna 'product_id'
SELECT 
    'product_id' AS column_name, 
    COUNT(*) AS duplicate_count 
FROM (
    SELECT 
        product_id 
    FROM 
        proyecto4datalab.amazon.amazon_product 
    GROUP BY 
        product_id 
    HAVING 
        COUNT(*) > 1
) AS duplicates

UNION ALL

-- Contar valores duplicados en la columna 'product_name'
SELECT 
    'product_name' AS column_name, 
    COUNT(*) AS duplicate_count 
FROM (
    SELECT 
        product_name 
    FROM 
        proyecto4datalab.amazon.amazon_product 
    GROUP BY 
        product_name 
    HAVING 
        COUNT(*) > 1
) AS duplicates

UNION ALL

-- Contar valores duplicados en la columna 'category'
SELECT 
    'category' AS column_name, 
    COUNT(*) AS duplicate_count 
FROM (
    SELECT 
        category 
    FROM 
        proyecto4datalab.amazon.amazon_product 
    GROUP BY 
        category 
    HAVING 
        COUNT(*) > 1
) AS duplicates

UNION ALL

-- Contar valores duplicados en la columna 'discounted_price'
SELECT 
    'discounted_price' AS column_name, 
    COUNT(*) AS duplicate_count 
FROM (
    SELECT 
        discounted_price 
    FROM 
        proyecto4datalab.amazon.amazon_product 
    GROUP BY 
        discounted_price 
    HAVING 
        COUNT(*) > 1
) AS duplicates

UNION ALL

-- Contar valores duplicados en la columna 'actual_price'
SELECT 
    'actual_price' AS column_name, 
    COUNT(*) AS duplicate_count 
FROM (
    SELECT 
        actual_price 
    FROM 
        proyecto4datalab.amazon.amazon_product 
    GROUP BY 
        actual_price 
    HAVING 
        COUNT(*) > 1
) AS duplicates

UNION ALL

-- Contar valores duplicados en la columna 'discount_percentage'
SELECT 
    'discount_percentage' AS column_name, 
    COUNT(*) AS duplicate_count 
FROM (
    SELECT 
        discount_percentage 
    FROM 
        proyecto4datalab.amazon.amazon_product 
    GROUP BY 
        discount_percentage 
    HAVING 
        COUNT(*) > 1
) AS duplicates

UNION ALL

-- Contar valores duplicados en la columna 'about_product'
SELECT 
    'about_product' AS column_name, 
    COUNT(*) AS duplicate_count 
FROM (
    SELECT 
        about_product 
    FROM 
        proyecto4datalab.amazon.amazon_product 
    GROUP BY 
        about_product 
    HAVING 
        COUNT(*) > 1
) AS duplicates

ORDER BY 
    column_name ASC;

#duplicates por product_id

-- Identificar y manejar valores duplicados
SELECT
  product_id,
  COUNT(*) AS duplicado
FROM
  `proyecto4datalab.amazon.amazon_product`
GROUP BY
  product_id
HAVING
  COUNT(*) > 1;
 