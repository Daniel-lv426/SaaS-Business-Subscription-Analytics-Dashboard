--
Wstawianie wartości

INSERT INTO stg_subscriptions_raw (event_id, customer_id, customer_name, customer_email, country, signup_date, plan_name, billing_cycle, monthly_price, event_type, event_date, payment_status, payment_method, churn_reason)
VALUES
(1, 101, 'Jan Kowalski', 'jan.kowalski@example.com', 'Poland', '2025-01-10', 'Basic', 'Monthly', 29.99, 'New', '2025-01-10', 'Paid', 'Credit Card', NULL),
(2, 101, 'Jan Kowalski', 'jan.kowalski@example.com', 'Poland', '2025-01-10', 'Basic', 'Monthly', 29.99, 'Renewal', '2025-02-10', 'Paid', 'Credit Card', NULL),
(3, 101, 'Jan Kowalski', 'jan.kowalski@example.com', 'Poland', '2025-01-10', 'Pro', 'Monthly', 79.99, 'Upgrade', '2025-03-10', 'Paid', 'Credit Card', NULL),
(4, 101, 'Jan Kowalski', 'jan.kowalski@example.com', 'Poland', '2025-01-10', 'Pro', 'Monthly', 79.99, 'Renewal', '2025-04-10', 'Paid', 'Credit Card', NULL),
(5, 101, 'Jan Kowalski', 'jan.kowalski@example.com', 'Poland', '2025-01-10', 'Pro', 'Monthly', 79.99, 'Cancellation', '2025-05-02', 'Paid', 'Credit Card', 'Too Expensive'),

(6, 102, 'Anna Nowak', 'anna.nowak@example.com', 'Poland', '2025-01-15', 'Pro', 'Annual', 69.99, 'New', '2025-01-15', 'Paid', 'PayPal', NULL),
(7, 102, 'Anna Nowak', 'anna.nowak@example.com', 'Poland', '2025-01-15', 'Enterprise', 'Annual', 199.99, 'Upgrade', '2025-06-15', 'Paid', 'Bank Transfer', NULL),

(8, 103, 'Michael Smith', 'm.smith@example.com', 'USA', '2025-02-01', 'Basic', 'Monthly', 29.99, 'New', '2025-02-01', 'Paid', 'Credit Card', NULL),
(9, 103, 'Michael Smith', 'm.smith@example.com', 'USA', '2025-02-01', 'Basic', 'Monthly', 29.99, 'Renewal', '2025-03-01', 'Failed', 'Credit Card', NULL),
(10, 103, 'Michael Smith', 'm.smith@example.com', 'USA', '2025-02-01', 'Basic', 'Monthly', 29.99, 'Cancellation', '2025-03-05', 'Paid', 'Credit Card', 'Technical Issues'),

(11, 104, 'Emma Schmidt', 'emma.s@example.de', 'Germany', '2025-02-10', 'Enterprise', 'Monthly', 249.99, 'New', '2025-02-10', 'Paid', 'Bank Transfer', NULL),
(12, 104, 'Emma Schmidt', 'emma.s@example.de', 'Germany', '2025-02-10', 'Enterprise', 'Monthly', 249.99, 'Renewal', '2025-03-10', 'Paid', 'Bank Transfer', NULL),
(13, 104, 'Emma Schmidt', 'emma.s@example.de', 'Germany', '2025-02-10', 'Pro', 'Monthly', 79.99, 'Downgrade', '2025-04-10', 'Paid', 'Bank Transfer', NULL),
(14, 104, 'Emma Schmidt', 'emma.s@example.de', 'Germany', '2025-02-10', 'Pro', 'Monthly', 79.99, 'Renewal', '2025-05-10', 'Paid', 'Bank Transfer', NULL),

(15, 105, 'Piotr Wiśniewski', 'p.wisniewski@example.com', 'Poland', '2025-02-20', 'Basic', 'Monthly', 29.99, 'New', '2025-02-20', 'Paid', 'Credit Card', NULL),
(16, 105, 'Piotr Wiśniewski', 'p.wisniewski@example.com', 'Poland', '2025-02-20', 'Basic', 'Monthly', 29.99, 'Renewal', '2025-03-20', 'Paid', 'Credit Card', NULL),
(17, 105, 'Piotr Wiśniewski', 'p.wisniewski@example.com', 'Poland', '2025-02-20', 'Basic', 'Monthly', 29.99, 'Renewal', '2025-04-20', 'Paid', 'Credit Card', NULL),

(18, 106, 'John Davies', 'jdavies@example.co.uk', 'United Kingdom', '2025-03-01', 'Pro', 'Monthly', 79.99, 'New', '2025-03-01', 'Paid', 'PayPal', NULL),
(19, 106, 'John Davies', 'jdavies@example.co.uk', 'United Kingdom', '2025-03-01', 'Pro', 'Monthly', 79.99, 'Renewal', '2025-04-01', 'Paid', 'PayPal', NULL),
(20, 106, 'John Davies', 'jdavies@example.co.uk', 'United Kingdom', '2025-03-01', 'Pro', 'Monthly', 79.99, 'Cancellation', '2025-04-18', 'Paid', 'PayPal', 'Switched to Competitor'),

(21, 107, 'Katarzyna Wójcik', 'k.wojcik@example.com', 'Poland', '2025-03-05', 'Basic', 'Annual', 24.99, 'New', '2025-03-05', 'Paid', 'Credit Card', NULL),

(22, 108, 'Lucas Weber', 'l.weber@example.de', 'Germany', '2025-03-12', 'Pro', 'Monthly', 79.99, 'New', '2025-03-12', 'Paid', 'Credit Card', NULL),
(23, 108, 'Lucas Weber', 'l.weber@example.de', 'Germany', '2025-03-12', 'Pro', 'Monthly', 79.99, 'Renewal', '2025-04-12', 'Failed', 'Credit Card', NULL),
(24, 108, 'Lucas Weber', 'l.weber@example.de', 'Germany', '2025-03-12', 'Pro', 'Monthly', 79.99, 'Renewal', '2025-04-14', 'Paid', 'Credit Card', NULL),
(25, 108, 'Lucas Weber', 'l.weber@example.de', 'Germany', '2025-03-12', 'Pro', 'Monthly', 79.99, 'Renewal', '2025-05-12', 'Paid', 'Credit Card', NULL),

(26, 109, 'David Brown', 'dbrown@example.com', 'USA', '2025-04-01', 'Enterprise', 'Annual', 199.99, 'New', '2025-04-01', 'Paid', 'Bank Transfer', NULL),

(27, 110, 'Magdalena Kamieńska', 'm.kamienska@example.com', 'Poland', '2025-04-05', 'Basic', 'Monthly', 29.99, 'New', '2025-04-05', 'Paid', 'Credit Card', NULL),
(28, 110, 'Magdalena Kamieńska', 'm.kamienska@example.com', 'Poland', '2025-04-05', 'Basic', 'Monthly', 29.99, 'Cancellation', '2025-04-20', 'Refunded', 'Credit Card', 'Lack of Features'),

(29, 111, 'Oliver Wilson', 'owilson@example.co.uk', 'United Kingdom', '2025-04-10', 'Pro', 'Monthly', 79.99, 'New', '2025-04-10', 'Paid', 'PayPal', NULL),
(30, 111, 'Oliver Wilson', 'owilson@example.co.uk', 'United Kingdom', '2025-04-10', 'Pro', 'Monthly', 79.99, 'Renewal', '2025-05-10', 'Paid', 'PayPal', NULL),

(31, 112, 'Sophie Becker', 's.becker@example.de', 'Germany', '2025-04-15', 'Basic', 'Monthly', 29.99, 'New', '2025-04-15', 'Paid', 'Credit Card', NULL),
(32, 112, 'Sophie Becker', 's.becker@example.de', 'Germany', '2025-04-15', 'Pro', 'Monthly', 79.99, 'Upgrade', '2025-05-01', 'Paid', 'Credit Card', NULL),

(33, 113, 'Tomasz Zieliński', 't.zielinski@example.com', 'Poland', '2025-05-01', 'Pro', 'Monthly', 79.99, 'New', '2025-05-01', 'Paid', 'Credit Card', NULL),
(34, 114, 'Sarah Taylor', 'staylor@example.com', 'USA', '2025-05-03', 'Enterprise', 'Monthly', 249.99, 'New', '2025-05-03', 'Paid', 'Bank Transfer', NULL),
(35, 115, 'Michał Lewandowski', 'm.lewandowski@example.com', 'Poland', '2025-05-10', 'Basic', 'Monthly', 29.99, 'New', '2025-05-10', 'Paid', 'PayPal', NULL);