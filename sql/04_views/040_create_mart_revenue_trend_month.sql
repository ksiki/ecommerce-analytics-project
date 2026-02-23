drop view if exists mart.revenue_trend_month;
create view mart.revenue_trend_month as 
select date_trunc('month', order_date)::date as period,
	count(distinct order_id) as orders_count,
	count(distinct user_id) as buyers_count,
	sum(revenue) as revenue,
	round(sum(revenue) / nullif(count(distinct order_id), 0),
		2
	) as average_order_value
from mart.fact_orders
where status = 'completed'
group by order_date;