SELECT
    p.product_name,
    COUNT(DISTINCT cp.customer_id) AS active_customers,
    ROUND(100 * COUNT(DISTINCT cp.customer_id) / (SELECT COUNT(*) FROM customers), 2) AS uptake_pct
FROM products p
LEFT JOIN customer_products cp ON p.product_id = cp.product_id
WHERE cp.status = 'active'
GROUP BY p.product_name;