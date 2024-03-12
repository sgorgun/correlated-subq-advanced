SELECT pt.id AS product_id, pt.title, m.manufacturer_id, m.manufacturer
FROM product_title pt
LEFT JOIN (
    SELECT p.product_title_id, m.id AS manufacturer_id, m.name AS manufacturer,
           ROW_NUMBER() OVER(PARTITION BY p.product_title_id ORDER BY SUM(od.product_amount) DESC) as rn
    FROM product p
    LEFT JOIN manufacturer m ON p.manufacturer_id = m.id
    LEFT JOIN order_details od ON p.id = od.product_id
    GROUP BY p.product_title_id, m.id, m.name
) m ON pt.id = m.product_title_id AND m.rn = 1
ORDER BY pt.id;