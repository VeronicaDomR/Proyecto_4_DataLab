WITH categorized_data AS (
    SELECT 
        product_id,
        adjusted_rating,
        category_1,
        CASE 
            WHEN adjusted_rating >= 4 THEN 'High Rating'
            ELSE 'Low Rating'
        END AS rating_category
    FROM `proyecto4datalab.amazon.datset`
),
counts AS (
    SELECT 
        category_1,
        rating_category,
        COUNT(*) AS count
    FROM categorized_data
    GROUP BY category_1, rating_category
)
SELECT 
    category_1,
    (SELECT count FROM counts WHERE category_1 = c.category_1 AND rating_category = 'High Rating') /
    (SELECT count FROM counts WHERE category_1 = c.category_1 AND rating_category = 'Low Rating') AS risk_ratio
FROM counts c
WHERE rating_category = 'High Rating';
