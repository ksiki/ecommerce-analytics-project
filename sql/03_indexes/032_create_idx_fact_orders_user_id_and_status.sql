create index if not exists idx_fact_orders_user_id_and_status
on mart.fact_orders (user_id, status);