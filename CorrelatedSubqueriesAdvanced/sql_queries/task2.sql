SELECT
    sub.id,
    sub.title,
    SUM(sub.count_with_discount_5) AS count_with_discount_5,
    COALESCE(SUM(sub.count_without_discount_5), 0) AS count_without_discount_5,
    COALESCE(ROUND((SUM(sub.count_with_discount_5) - SUM(sub.count_without_discount_5)) * 100.00 / (SUM(sub.count_with_discount_5) + SUM(sub.count_without_discount_5)), 2), 0.0) AS difference
FROM
    (SELECT
        p.id,
        p.comment AS title,
        CASE WHEN c.discount > 0.05 THEN od.product_amount ELSE 0 END AS count_with_discount_5,
        CASE WHEN c.discount <= 0.05 OR c.discount IS NULL THEN od.product_amount ELSE 0 END AS count_without_discount_5
    FROM
        product p
    LEFT JOIN
        order_details od ON p.id = od.product_id
    LEFT JOIN
        customer_order co ON od.customer_order_id = co.id
    LEFT JOIN
        customer c ON co.customer_id = c.person_id
    WHERE p.comment IS NOT NULL) AS sub
GROUP BY
    sub.id, sub.title
ORDER BY
    sub.id;