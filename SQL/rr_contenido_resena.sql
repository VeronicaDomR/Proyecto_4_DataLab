WITH categorized_data AS (
    SELECT 
        product_id,
        adjusted_rating,
        CASE 
            WHEN REGEXP_CONTAINS(cleaned_review_content, r'(difficult|worst|jammed|infamous|black|bad|flat|less|little|small|long|rough|past|few|other)') THEN 'Negative'
            ELSE 'Neutral/Positive'
        END AS review_sentiment,
        CASE 
            WHEN adjusted_rating < 3 THEN 'Low Rating'
            ELSE 'High Rating'
        END AS rating_category
    FROM `proyecto4datalab.amazon.datset`
),
counts AS (
    SELECT 
        review_sentiment,
        rating_category,
        COUNT(*) AS count
    FROM categorized_data
    GROUP BY review_sentiment, rating_category
)
SELECT 
    (SELECT count FROM counts WHERE review_sentiment = 'Negative' AND rating_category = 'Low Rating') /
    (SELECT count FROM counts WHERE review_sentiment = 'Neutral/Positive' AND rating_category = 'Low Rating') AS risk_ratio
FROM counts
LIMIT 1;
