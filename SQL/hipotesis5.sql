--sentiment score

SELECT 
    product_id,
    adjusted_rating,
    review_title,
    cleaned_review_content,
    (SUM(total_positive_count) - SUM(total_negative_count)) AS sentiment_score
FROM `proyecto4datalab.amazon.dummies_conteo_feelings`
GROUP BY product_id, adjusted_rating, review_title, cleaned_review_content;

--sentiment rating
SELECT 
    product_id,
    AVG(sentiment_score) AS avg_sentiment_score,
    AVG(adjusted_rating) AS avg_rating
FROM `proyecto4datalab.amazon.sentiment_score`
GROUP BY product_id;
