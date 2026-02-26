drop table if exists mart.fact_orders;
create table mart.fact_orders as
select o.order_id,
	o.user_id,
	o.order_date,
	sum((price * quantity)) as revenue,
	o.status
from dwh.orders o
join dwh.order_items oi using(order_id)
join dwh.products p using(product_id)
group by o.order_id, o.user_id, o.order_date, o.status;