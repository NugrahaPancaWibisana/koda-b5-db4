WITH
    next_event AS (
        SELECT
            e1.event_id as id,
            STRING_AGG (e2.event_name, ', ') AS next_event
        FROM
            events e1
            LEFT JOIN events e2 on e1.start_date < e2.start_date
        GROUP BY
            e1.event_id
    )
SELECT
    e.event_id,
    e.event_name,
    e.start_date,
    ne.next_event
FROM
    events e
    JOIN next_event ne ON e.event_id = ne.id;