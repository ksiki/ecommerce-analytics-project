drop view if exists mart.category_contribution;
create view mart.category_contribution as 
with category_revenue as (
	select p.category,
		date_trunc('month', fo.order_date)::date as period,
		sum(foi.item_revenue) as category_revenue
	from mart.fact_order_items foi
    join mart.fact_orders fo using (order_id)
    join mart.dim_products p using (product_id)
	where fo.status = 'completed'
	group by p.category, period 
), 
total_revenue as (
	select period,
    	sum(category_revenue) as revenue
	from category_revenue
	group by period
)
select cr.period,
	cr.category,
	cr.category_revenue,
	tr.revenue as total_revenue,
	round(cr.category_revenue / nullif(tr.revenue, 0), 
		4
	) as contribution_pct
from category_revenue cr
join total_revenue tr using(period);