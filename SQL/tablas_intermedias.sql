CREATE OR REPLACE TABLE proyecto4datalab.amazon.intermediate_user_name AS
WITH data AS (
  SELECT
    product_id,
    product_name,
    category,
    SPLIT(user_name, ",") AS user_names
  FROM
    `proyecto4datalab.amazon.cleaned_url_content`
)
SELECT
  product_id,
  product_name,
  category,
  user_names[ORDINAL(pos)] AS user_name
FROM
  data,
  UNNEST(GENERATE_ARRAY(1, ARRAY_LENGTH(user_names))) AS pos;

  CREATE OR REPLACE TABLE proyecto4datalab.amazon.intermediate_review_id AS
WITH data AS (
  SELECT
    product_id,
    product_name,
    category,
    SPLIT(review_id, ",") AS review_ids
  FROM
    `proyecto4datalab.amazon.cleaned_url_content`
)
SELECT
  product_id,
  product_name,
  category,
  review_ids[ORDINAL(pos)] AS review_id
FROM
  data,
  UNNEST(GENERATE_ARRAY(1, ARRAY_LENGTH(review_ids))) AS pos;

CREATE OR REPLACE TABLE proyecto4datalab.amazon.intermediate_review_title AS
WITH data AS (
  SELECT
    product_id,
    product_name,
    category,
    SPLIT(review_title, ",") AS review_titles
  FROM
    `proyecto4datalab.amazon.cleaned_url_content`
)
SELECT
  product_id,
  product_name,
  category,
  review_titles[ORDINAL(pos)] AS review_title
FROM
  data,
  UNNEST(GENERATE_ARRAY(1, ARRAY_LENGTH(review_titles))) AS pos;

CREATE OR REPLACE TABLE proyecto4datalab.amazon.intermediate_cleaned_review_content AS
WITH data AS (
  SELECT
    product_id,
    product_name,
    category,
    SPLIT(cleaned_review_content, ".") AS cleaned_review_contents
  FROM
    `proyecto4datalab.amazon.cleaned_url_content`
)
SELECT
  product_id,
  product_name,
  category,
  cleaned_review_contents[ORDINAL(pos)] AS cleaned_review_content
FROM
  data,
  UNNEST(GENERATE_ARRAY(1, ARRAY_LENGTH(cleaned_review_contents))) AS pos;

CREATE OR REPLACE TABLE `proyecto4datalab.amazon.intermediate_user_id` AS
WITH data AS (
  SELECT
    product_id,
    product_name,
    category,
    SPLIT(user_id, ",") AS user_ids
  FROM
    `proyecto4datalab.amazon.cleaned_url_content`
)
SELECT
  product_id,
  product_name,
  category,
  user_ids[ORDINAL(pos)] AS user_id
FROM
  data,
  UNNEST(GENERATE_ARRAY(1, ARRAY_LENGTH(user_ids))) AS pos;


