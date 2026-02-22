drop view if exists mart.top_products;
create view mart.top_products as
with product_stats as (
	select foi.product_id,
	date_trunc('month', fo.order_date)::date as period_start,
	count(distinct foi.order_id) as orders_count,
	sum(foi.quantity) as units,
	sum(foi.item_revenue) as revenue
	from mart.fact_order_items foi
	join mart.fact_orders fo using(order_id)
	where fo.status = 'completed'
	group by foi.product_id, period_start
),
ranked as (
    select product_id,
        period_start,
        orders_count,
        units,
        revenue,
        dense_rank() over (partition by period_start order by revenue desc) as revenue_rank
    from product_stats
)
select p.product_id, 
	p.product_name,
	p.category,
	r.period_start,
	r.orders_count,
	r.units,
	r.revenue,
	r.revenue_rank
from mart.dim_products p
join ranked r using(product_id)
where revenue_rank <= 10;