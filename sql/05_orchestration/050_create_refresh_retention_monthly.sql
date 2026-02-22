select cron.schedule(
    'refresh_retention_monthly',
    '0 3 1 * *',
    $$refresh materialized view mart_cohort_retention_monthly$$
);