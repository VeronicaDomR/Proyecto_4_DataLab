SELECT
  CORR(discounted_price, actual_price) AS correlation_discounted_vs_actual,
  CORR(discounted_price, rating_count_clean) AS correlation_discounted_vs_ratings,
  CORR(discounted_price, adjusted_rating) AS correlation_discounted_vs_adjusted_rating,
  CORR(discount_percentage, actual_price) AS correlation_discount_vs_actual_price,
  CORR(rating_count_clean, adjusted_rating) AS correlation_ratings_vs_adjusted_rating,
  CORR(discount_percentage, adjusted_rating) AS correlation_discount_vs_adjusted_rating
FROM `proyecto4datalab.amazon.datset`;

#corelaciones por categoria 

SELECT
  category_1,
  CORR(discount_percentage, adjusted_rating) AS correlation_by_category
FROM
  proyecto4datalab.amazon.datset
GROUP BY
  category_1
ORDER BY
  correlation_by_category DESC;

 
