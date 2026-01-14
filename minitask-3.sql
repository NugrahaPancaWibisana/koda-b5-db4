WITH
    total_sales AS (
        SELECT
            (quantity * price_per_unit) AS total,
            *
        FROM
            sales
    )
SELECT
    customer_id,
    product,
    total
FROM
    total_sales
WHERE
    total > 30
    AND product = 'Keyboard'