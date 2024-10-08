WITH word_counts AS (
  SELECT
    review_title,
    cleaned_review_content,
    adjusted_rating,
    product_id,

    -- Conteo de palabras positivas en review_title
    ARRAY_LENGTH(REGEXP_EXTRACT_ALL(review_title, r'\b(new|best|quick|great|high|light|easy|right|Good|full|many|able|fine|amazing|bright|hot|decent|handy|nice|satisfied|useful|smooth|comfortable|fast|super|extraordinary|wonderful)\b')) AS positive_count_title,

    -- Conteo de palabras negativas en review_title
    ARRAY_LENGTH(REGEXP_EXTRACT_ALL(review_title, r'\b(difficult|worst|jammed|infamous|black|bad|flat|less|little|small|long|rough|past|few|other)\b')) AS negative_count_title,

    -- Conteo de palabras positivas en cleaned_review_content
    ARRAY_LENGTH(REGEXP_EXTRACT_ALL(cleaned_review_content, r'\b(new|best|quick|great|high|light|easy|right|Good|full|many|able|fine|amazing|bright|hot|decent|handy|nice|satisfied|useful|smooth|comfortable|fast|super|extraordinary|wonderful)\b')) AS positive_count_content,

    -- Conteo de palabras negativas en cleaned_review_content
    ARRAY_LENGTH(REGEXP_EXTRACT_ALL(cleaned_review_content, r'\b(difficult|worst|jammed|infamous|black|bad|flat|less|little|small|long|rough|past|few|other)\b')) AS negative_count_content

  FROM
    `proyecto4datalab.amazon.datset`
)

SELECT
  review_title,
  cleaned_review_content,
  adjusted_rating,
  product_id,

  -- Variable dummy para palabras positivas en review_title
  CASE 
    WHEN REGEXP_CONTAINS(review_title, r'\b(new|best|quick|great|high|light|easy|right|Good|full|many|able|fine|amazing|bright|hot|decent|handy|nice|satisfied|useful|smooth|comfortable|fast|super|extraordinary|wonderful)\b') 
    THEN 1 
    ELSE 0 
  END AS dummie_positive_title,

  -- Variable dummy para palabras negativas en review_title
  CASE 
    WHEN REGEXP_CONTAINS(review_title, r'\b(difficult|worst|jammed|infamous|black|bad|flat|less|little|small|long|rough|past|few|other)\b') 
    THEN 1 
    ELSE 0 
  END AS dummie_negative_title,

  -- Variable dummy para palabras positivas en cleaned_review_content
  CASE 
    WHEN REGEXP_CONTAINS(cleaned_review_content, r'\b(new|best|quick|great|high|light|easy|right|Good|full|many|able|fine|amazing|bright|hot|decent|handy|nice|satisfied|useful|smooth|comfortable|fast|super|extraordinary|wonderful)\b') 
    THEN 1 
    ELSE 0 
  END AS dummie_positive_content,

  -- Variable dummy para palabras negativas en cleaned_review_content
  CASE 
    WHEN REGEXP_CONTAINS(cleaned_review_content, r'\b(difficult|worst|jammed|infamous|black|bad|flat|less|little|small|long|rough|past|few|other)\b') 
    THEN 1 
    ELSE 0 
  END AS dummie_negative_content,

  positive_count_title,
  negative_count_title,
  positive_count_content,
  negative_count_content,
  
  -- Suma de conteos de palabras negativas
  (negative_count_title + negative_count_content) AS total_negative_count,
  (positive_count_title + positive_count_content) AS total_positive_count,

  -- Promedio del adjusted_rating
  AVG(adjusted_rating) OVER () AS avg_adjusted_rating

FROM
  word_counts;
