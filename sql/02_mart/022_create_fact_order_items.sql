drop table if exists mart.fact_order_items;
create table mart.fact_order_items as
select oi.order_id, 
	oi.product_id,
	oi.quantity,
	(oi.quantity * p.price) as item_revenue
from staging.order_items oi
join staging.products p using(product_id);