drop view if exists mart.v_cohort_retention_monthly;
create view mart.v_cohort_retention_monthly as
select *
from mart.cohort_retention_monthly;