WITH
    product_sales AS (
        SELECT
            product,
            SUM(quantity) AS qty
        FROM
            sales
        GROUP BY
            product
    )
SELECT
    customer_id,
    product
FROM
    sales
WHERE
    product = ANY (
        SELECT
            product
        FROM
            product_sales
        WHERE
            qty = 1
    );