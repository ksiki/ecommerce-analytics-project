drop table if exists staging.orders;
create table staging.orders as 
select order_id::bigint,
	user_id::bigint,
	order_date::date,
	coalesce(nullif(status, ''), 'unknown') AS status
from raw.orders
where order_date::date < current_date;