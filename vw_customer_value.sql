CREATE OR REPLACE VIEW vw_customer_value AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(t.amount) AS total_value,
    COUNT(DISTINCT a.account_id) AS num_accounts,
    COUNT(DISTINCT cp.product_id) AS num_products,
    MAX(t.transaction_date) AS last_active
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
LEFT JOIN customer_products cp ON c.customer_id = cp.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
 