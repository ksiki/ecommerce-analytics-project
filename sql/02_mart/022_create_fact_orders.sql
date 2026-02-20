drop table if exists mart.fact_orders;
create table mart.fact_orders as
select o.order_id,
	o.user_id,
	o.order_date,
	sum((price * quantity)) as revenue,
	o.status
from staging.orders o
join staging.order_items oi using(order_id)
join staging.products p using(product_id)
group by o.order_id, o.user_id, o.order_date, o.status;