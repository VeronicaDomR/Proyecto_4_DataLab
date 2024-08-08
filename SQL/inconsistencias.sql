SELECT
    product_id,
    product_name,
    category,
    discounted_price,
    actual_price,
    discount_percentage,
    about_product,
    CASE
        -- Verificar si discounted_price es consistente con el discount_percentage aplicado al actual_price
        WHEN ABS(discounted_price - (actual_price * (1 - discount_percentage))) <= 100 THEN 'Consistente'
        ELSE 'Inconsistente'
    END AS price_discount_consistency,
    CASE
        -- Verificar si discount_percentage es coherente (ejemplo: no debería ser 1 (100%) si el precio es mayor que 0)
        WHEN discount_percentage = 1 AND discounted_price > 0 THEN 'Descuento no coherente'
        WHEN discount_percentage > 1 OR discount_percentage < 0 THEN 'Descuento fuera de rango'
        ELSE 'Descuento coherente'
    END AS discount_percentage_coherence,
    CASE
        -- Corroborar que los precios estén bien formados (por ejemplo, no sean negativos o fuera de un rango razonable)
        WHEN actual_price < 0 OR discounted_price < 0 THEN 'Precio negativo'
        WHEN actual_price > 1000000 THEN 'Precio fuera de rango razonable'
        ELSE 'Precio correcto'
    END AS price_validity
FROM
    proyecto4datalab.amazon.amazon_product;