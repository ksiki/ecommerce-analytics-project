drop materialized view if exists mart.cohort_retention_monthly;
create materialized view mart.cohort_retention_monthly as
with first_orders as (
    select user_id,
        date_trunc('month', min(order_date))::date as cohort_month
    from mart.fact_orders
    where status = 'completed'
    group by user_id
),
orders_with_cohort as (
    select fo.user_id,
        date_trunc('month', fo.order_date)::date as order_month,
        f.cohort_month,
        (extract(year from age(date_trunc('month', fo.order_date), f.cohort_month)) * 12
          + extract(month from age(date_trunc('month', fo.order_date), f.cohort_month))
        )::int as month_number
    from mart.fact_orders fo
    join first_orders f using (user_id)
    where fo.status = 'completed'
),
cohort_sizes as (
    select cohort_month,
        count(*) as cohort_size
    from first_orders
    group by cohort_month
)
select o.cohort_month,
    o.month_number,
    cs.cohort_size,
    count(distinct o.user_id) as retained_users,
    round(count(distinct o.user_id)::numeric/ nullif(cs.cohort_size, 0),
        4
    ) as retention_rate
from orders_with_cohort o
join cohort_sizes cs using (cohort_month)
group by o.cohort_month, o.month_number, cs.cohort_size
order by o.cohort_month, o.month_number;