
---

## 🏦 Example Schema (MySQL DDL)

Here’s a quick sketch—place in `/schema/banklytics_schema.sql`:

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender CHAR(1),
    income DECIMAL(12,2),
    region VARCHAR(30),
    join_date DATE
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),  -- 'savings', 'current', 'loan', etc.
    balance DECIMAL(14,2),
    open_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),  -- 'credit card', 'personal loan', 'fixed deposit'
    category VARCHAR(20)
);

CREATE TABLE customer_products (
    customer_id INT,
    product_id INT,
    start_date DATE,
    status VARCHAR(20),
    PRIMARY KEY (customer_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATETIME,
    amount DECIMAL(14,2),
    transaction_type VARCHAR(20),  -- 'credit', 'debit', 'payment', 'withdrawal'
    merchant_category VARCHAR(30),
    channel VARCHAR(20),           -- 'branch', 'ATM', 'online', 'mobile'
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
