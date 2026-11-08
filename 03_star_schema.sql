-- ==============================================================
-- Tabela: dim_customers (wymiar)
-- ==============================================================
-- Cel: utworzenie tabeli wymiaru z tabeli stg_subscriptions_raw

CREATE TABLE dim_customers AS
SELECT DISTINCT
customer_id,
customer_name,
customer_email, 
country,
signup_date
FROM stg_subscriptions_raw;

-- ==============================================================
-- Tabela: dim_plans (wymiar)
-- ==============================================================
-- Cel: utworzenia tabeli wymiaru z tabeli stg_subscriptions_raw

CREATE TABLE dim_plans AS
WITH clear_plans AS
(SELECT DISTINCT
CONCAT_WS(' - ', plan_name, billing_cycle) AS plan_name,
monthly_price
FROM stg_subscriptions_raw)
SELECT
ROW_NUMBER() OVER(ORDER BY plan_name) AS id_plan,
plan_name,
monthly_price
FROM clear_plans;

-- ==============================================================
-- Tabela: dim_payments_methods (wymiar)
-- ==============================================================
-- Cel: utworzenie tabeli wymiaru z tabeli stg_subscriptions_raw

CREATE TABLE dim_payment_methods AS
WITH clear_payment AS
(SELECT DISTINCT
payment_method
FROM stg_subscriptions_raw)
SELECT
ROW_NUMBER() OVER(ORDER BY payment_method) AS payment_method_id,
payment_method
FROM clear_payment;

-- ==============================================================
-- Tabela: fact_subscriptions (fakty)
-- ==============================================================
-- Cel: utworzenie tabeli faktów z tabeli stg_subscriptions_raw

CREATE TABLE fact_subscriptions AS
SELECT 
stg.event_id,
dc.customer_id,
dp.id_plan,
stg.event_type,
stg.event_date,
stg.payment_status,
dpm.payment_method_id,
stg. churn_reason
FROM stg_subscriptions_raw stg
LEFT JOIN dim_customers dc 
ON stg.customer_id = dc.customer_id
LEFT JOIN dim_plans dp
ON CONCAT_WS(' - ', stg.plan_name, stg.billing_cycle) = dp.plan_name
LEFT JOIN dim_payment_methods dpm
ON stg.payment_method = dpm.payment_method;