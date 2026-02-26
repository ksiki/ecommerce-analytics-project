drop table if exists dwh.orders;
create table dwh.orders as 
select order_id::bigint,
	user_id::bigint,
	order_date::date,
	coalesce(nullif(status, ''), 'unknown') AS status
from staging.orders
where order_date::date < current_date;