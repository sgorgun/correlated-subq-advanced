SELECT
    name,
    surname,
    ROUND(avg_purchase, 2) AS avg_purchase,
    ROUND(sum_purchase, 2) AS sum_purchase
FROM
    (SELECT
        person.name,
        person.surname,
        AVG(price_with_discount * product_amount) AS avg_purchase,
        SUM(price_with_discount * product_amount) AS sum_purchase
    FROM order_details
    LEFT JOIN customer_order ON order_details.customer_order_id = customer_order.id
    LEFT JOIN customer ON customer_order.customer_id = customer.person_id
    LEFT JOIN person ON customer.person_id = person.id
    GROUP BY name, surname
    HAVING AVG(price_with_discount * product_amount) > 70) AS subquery
    WHERE sum_purchase IS NOT NULL
ORDER BY sum_purchase, surname;