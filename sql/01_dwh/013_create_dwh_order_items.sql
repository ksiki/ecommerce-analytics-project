drop table if exists dwh.order_items;
create table dwh.order_items as
select order_id::bigint,
	product_id::bigint,
	quantity::int
from staging.order_items
where quantity::int > 0;