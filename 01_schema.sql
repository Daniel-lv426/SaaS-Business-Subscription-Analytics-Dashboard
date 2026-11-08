-- ==================================
-- Tabela: stg_subscriptions_raw
-- ==================================
CREATE TABLE stg_subscriptions_raw (
event_id INTEGER PRIMARY KEY,
customer_id INTEGER,
customer_name VARCHAR(100),
customer_email VARCHAR(100),
country VARCHAR(50),
signup_date DATE,
plan_name VARCHAR(50),
billing_cycle VARCHAR(30),
monthly_price DECIMAL(10,2),
event_type VARCHAR(30),
event_date DATE,
payment_status VARCHAR(30),
payment_method VARCHAR(30),
churn_reason VARCHAR(100));