SELECT
    product_id,
    product_name,
    price
FROM
    products
WHERE
    price >= ANY (
        SELECT
            AVG(price)
        FROM
            products
    );