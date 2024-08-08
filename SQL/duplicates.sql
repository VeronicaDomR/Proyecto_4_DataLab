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

#consulta2 de amazon_review
#SEGUNDA CONSULTA: Cuenta cuántas veces están duplicados los registros, excluyendo la primera aparición.
WITH UserIDDuplicates AS (
    SELECT
        'user_id' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        user_id
    HAVING
        COUNT(*) > 1
),
UserNameDuplicates AS (
    SELECT
        'user_name' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        user_name
    HAVING
        COUNT(*) > 1
),
ReviweIdDuplicates AS (
    SELECT
        'review_id' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        review_id
    HAVING
        COUNT(*) > 1
),
ReviewTitleeDuplicates AS (
    SELECT
        'review_titlee' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        review_title
    HAVING
        COUNT(*) > 1
),
ReviewContentDuplicates AS (
    SELECT
        'review_content' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        review_content
    HAVING
        COUNT(*) > 1
),
ImgLinkDuplicates AS (
    SELECT
        'img_link' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        img_link
    HAVING
        COUNT(*) > 1
),
ProductLinkDuplicates AS (
    SELECT
        'product_link' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        product_link
    HAVING
        COUNT(*) > 1
),
ProductIdDuplicates AS (
    SELECT
        'product_id' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        product_id
    HAVING
        COUNT(*) > 1
),
ratingDuplicates AS (
    SELECT
        'rating' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        rating
    HAVING
        COUNT(*) > 1
),
ratingCountDuplicates AS (
    SELECT
        'rating_count' AS column_name,
        COUNT(*) - 1 AS duplicate_count
    FROM
        proyecto4datalab.amazon.amazon_review
    GROUP BY
        rating_count
    HAVING
        COUNT(*) > 1
)
SELECT
    COALESCE((SELECT SUM(duplicate_count) FROM UserIDDuplicates), 0) AS user_id_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM UserNameDuplicates), 0) AS user_name_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM ReviweIdDuplicates), 0) AS review_id_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM ReviewTitleeDuplicates), 0) AS review_titlee_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM ReviewContentDuplicates), 0) AS review_content_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM ImgLinkDuplicates), 0) AS img_link_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM ProductLinkDuplicates), 0) AS product_link_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM ProductIdDuplicates), 0) AS product_id_duplicates,
 COALESCE((SELECT SUM(duplicate_count) FROM ratingDuplicates), 0) AS rating_duplicates,
	COALESCE((SELECT SUM(duplicate_count) FROM ratingCountDuplicates), 0) AS rating_count_duplicates;

#consulta 3 amazon_review
#TERCERA CONSULTA
-- Subconsulta para calcular el total de duplicados (desglosado) por cada variable
WITH ReviewIDDuplicates AS (
  SELECT
    'review_id' AS column_name,
    review_id,
    COUNT(*) - 1 AS duplicate_count
  FROM
    proyecto4datalab.amazon.amazon_review
  GROUP BY
    review_id
  HAVING
    COUNT(*) > 1
),
ReviewTitleDuplicates AS (
  SELECT
    'review_title' AS column_name,
    review_title,
    COUNT(*) - 1 AS duplicate_count
  FROM
    proyecto4datalab.amazon.amazon_review
  GROUP BY
    review_title
  HAVING
    COUNT(*) > 1
),
ReviewContentDuplicates AS (
  SELECT
    'review_content' AS column_name,
    review_content,
    COUNT(*) - 1 AS duplicate_count
  FROM
    proyecto4datalab.amazon.amazon_review
  GROUP BY
    review_content
  HAVING
    COUNT(*) > 1
),
ImgLinkDuplicates AS (
  SELECT
    'img_link' AS column_name,
    img_link,
    COUNT(*) - 1 AS duplicate_count
  FROM
    proyecto4datalab.amazon.amazon_review
  GROUP BY
    img_link
  HAVING
    COUNT(*) > 1
),
ProductIDDuplicates AS (
  SELECT
    'product_id' AS column_name,
    product_id,
    COUNT(*) - 1 AS duplicate_count
  FROM
    proyecto4datalab.amazon.amazon_review
  GROUP BY
    product_id
  HAVING
    COUNT(*) > 1
)

-- Consulta principal que une todos los resultados de duplicados
SELECT
  column_name,
  review_id AS identifier,
  duplicate_count,
  SUM(duplicate_count) OVER (PARTITION BY column_name) AS total_duplicados_excluyendo_original
FROM ReviewIDDuplicates

UNION ALL

SELECT
  column_name,
  review_title AS identifier,
  duplicate_count,
  SUM(duplicate_count) OVER (PARTITION BY column_name) AS total_duplicados_excluyendo_original
FROM ReviewTitleDuplicates

UNION ALL

SELECT
  column_name,
  review_content AS identifier,
  duplicate_count,
  SUM(duplicate_count) OVER (PARTITION BY column_name) AS total_duplicados_excluyendo_original
FROM ReviewContentDuplicates

UNION ALL

SELECT
  column_name,
  img_link AS identifier,
  duplicate_count,
  SUM(duplicate_count) OVER (PARTITION BY column_name) AS total_duplicados_excluyendo_original
FROM ImgLinkDuplicates

UNION ALL

SELECT
  column_name,
  product_id AS identifier,
  duplicate_count,
  SUM(duplicate_count) OVER (PARTITION BY column_name) AS total_duplicados_excluyendo_original
FROM ProductIDDuplicates;

#duplicates_product 
--Consulta 1
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
 
 -- Consulta 2
 -- Contar solo los duplicados (excluyendo el dato original) por columna en `proyecto4datalab.amazon.amazon_product`

WITH ProductIDDuplicates AS (
    SELECT
        `product_id`,
        COUNT(*) - 1 AS duplicate_count
    FROM
        `proyecto4datalab.amazon.amazon_product`
    GROUP BY
        `product_id`
    HAVING
        COUNT(*) > 1
),
ProductNameDuplicates AS (
    SELECT
        `product_name`,
        COUNT(*) - 1 AS duplicate_count
    FROM
        `proyecto4datalab.amazon.amazon_product`
    GROUP BY
        `product_name`
    HAVING
        COUNT(*) > 1
),
CategoryDuplicates AS (
    SELECT
        `category`,
        COUNT(*) - 1 AS duplicate_count
    FROM
        `proyecto4datalab.amazon.amazon_product`
    GROUP BY
        `category`
    HAVING
        COUNT(*) > 1
),
DiscountedPriceDuplicates AS (
    SELECT
        `discounted_price`,
        COUNT(*) - 1 AS duplicate_count
    FROM
        `proyecto4datalab.amazon.amazon_product`
    GROUP BY
        `discounted_price`
    HAVING
        COUNT(*) > 1
),
ActualPriceDuplicates AS (
    SELECT
        `actual_price`,
        COUNT(*) - 1 AS duplicate_count
    FROM
        `proyecto4datalab.amazon.amazon_product`
    GROUP BY
        `actual_price`
    HAVING
        COUNT(*) > 1
),
DiscountPercentageDuplicates AS (
    SELECT
        `discount_percentage`,
        COUNT(*) - 1 AS duplicate_count
    FROM
        `proyecto4datalab.amazon.amazon_product`
    GROUP BY
        `discount_percentage`
    HAVING
        COUNT(*) > 1
),
AboutProductDuplicates AS (
    SELECT
        `about_product`,
        COUNT(*) - 1 AS duplicate_count
    FROM
        `proyecto4datalab.amazon.amazon_product`
    GROUP BY
        `about_product`
    HAVING
        COUNT(*) > 1
)

SELECT
    COALESCE((SELECT SUM(duplicate_count) FROM ProductIDDuplicates), 0) AS product_id_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM ProductNameDuplicates), 0) AS product_name_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM CategoryDuplicates), 0) AS category_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM DiscountedPriceDuplicates), 0) AS discounted_price_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM ActualPriceDuplicates), 0) AS actual_price_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM DiscountPercentageDuplicates), 0) AS discount_percentage_duplicates,
    COALESCE((SELECT SUM(duplicate_count) FROM AboutProductDuplicates), 0) AS about_product_duplicates;
 
 --Consulta 3
 -- Subconsulta para calcular el total de duplicados por variable
 
WITH DuplicatesCount AS (
  SELECT
    product_id,
    COUNT(*) AS duplicado
  FROM
    `proyecto4datalab.amazon.amazon_product`
  GROUP BY
    product_id
  HAVING
    COUNT(*) > 1
)
-- Consulta principal que muestra los duplicados (excluyendo el original) y el total de duplicados
SELECT
  product_id,
  (duplicado - 1) AS duplicados_excluyendo_original,
  SUM(duplicado - 1) OVER () AS total_duplicados_excluyendo_original
FROM
  DuplicatesCount;