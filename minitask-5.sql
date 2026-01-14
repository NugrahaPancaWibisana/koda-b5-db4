WITH
    group_qty AS (
        SELECT
            product_id,
            SUM(quantity) AS qty
        FROM
            sales
        GROUP BY
            product_id
    )
SELECT
    p.name,
    (p.price * s.qty) AS total
FROM
    group_qty s
    JOIN products p ON s.product_id = p.id
WHERE
    s.qty >= 7;