-- riesgo relativo para evaluar el impacto de los descuentos en la percepción del cliente
WITH categorized_data AS (
    SELECT 
        product_id,
        adjusted_rating,
        CASE 
            WHEN discount_percentage > 0.30 THEN 'High Discount'
            ELSE 'Low/No Discount'
        END AS discount_category,
        CASE 
            WHEN adjusted_rating < 2.5 THEN 'Low Rating'
            ELSE 'High Rating'
        END AS rating_category
    FROM `proyecto4datalab.amazon.datset`
),
counts AS (
    SELECT 
        discount_category,
        rating_category,
        COUNT(*) AS count
    FROM categorized_data
    GROUP BY discount_category, rating_category
)
SELECT 
    COALESCE(
        (SELECT count FROM counts WHERE discount_category = 'High Discount' AND rating_category = 'Low Rating'), 
        0
    ) /
    COALESCE(
        (SELECT count FROM counts WHERE discount_category = 'Low/No Discount' AND rating_category = 'Low Rating'), 
        1
    ) AS risk_ratio
