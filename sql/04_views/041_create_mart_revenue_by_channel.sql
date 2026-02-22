drop view if exists mart.revenue_by_channel;
create view mart.revenue_by_channel as 
select date_trunc('month', fo.order_date)::date as period_start,
	du.acquisition_channel,
	sum(fo.revenue) as revenue,
	count(distinct fo.order_id) as orders_count,
	count(distinct du.user_id) as buyers_count,
	round(sum(fo.revenue) / nullif(count(distinct fo.order_id), 0), 
		2
	)  as average_order_value
from mart.dim_users du 
join mart.fact_orders fo using(user_id)
where fo.status = 'completed'
group by period_start, du.acquisition_channel;