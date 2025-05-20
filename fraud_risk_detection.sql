WITH suspicious_transactions AS (
    SELECT
        t.transaction_id,
        t.account_id,
        t.amount,
        t.transaction_date,
        t.channel,
        ROW_NUMBER() OVER (PARTITION BY t.account_id ORDER BY t.transaction_date DESC) as rn
    FROM transactions t
    WHERE t.amount > 10000
      AND t.channel IN ('online', 'mobile')
)
SELECT
    s.transaction_id,
    s.account_id,
    s.amount,
    s.transaction_date,
    c.customer_id,
    c.region
FROM suspicious_transactions s
JOIN accounts a ON s.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
WHERE s.rn <= 3;
