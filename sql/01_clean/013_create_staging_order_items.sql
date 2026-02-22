drop table if exists staging.order_items;
create table staging.order_items as
select order_id::bigint,
	product_id::bigint,
	quantity::int
from raw.order_items
where quantity::int > 0;