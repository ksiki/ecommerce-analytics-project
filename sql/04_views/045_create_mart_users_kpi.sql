drop view if exists mart.users_kpi;
create view mart.users_kpi as 
select date_trunc('month', created_at)::date as period,
	count(distinct user_id) as user_count
from mart.dim_users
group by period;