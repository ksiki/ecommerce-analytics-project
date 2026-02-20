CREATE INDEX IF NOT EXISTS idx_fact_orders_user_id_and_status
ON mart.fact_orders (user_id, status);