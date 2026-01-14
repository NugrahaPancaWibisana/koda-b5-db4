SELECT
    t1.id AS transaction_id,
    c1.id AS customer_id,
    t1.amount
FROM
    transactions t1
    JOIN transaction_customers tc1 on t1.id = tc1.transaction_id
    JOIN customers c1 on c1.id = tc1.customer_id
WHERE
    t1.amount >= ANY (
        SELECT
            AVG(t2.amount)
        FROM
            transactions t2
            JOIN transaction_customers tc2 on t2.id = tc2.transaction_id
        WHERE
            tc2.customer_id = c1.id
    );
