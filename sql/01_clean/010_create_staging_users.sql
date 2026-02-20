drop table if exists staging.users;
create table staging.users as
with prep as (
  select
    user_id::bigint,
    email,
    coalesce(nullif(acquisition_channel, ''), 'Unknown') as acquisition_channel,
    country,
    created_at::timestamp as created_at,
    row_number() over (partition by user_id order by created_at desc nulls last) as rn
  from raw.users
)
select
  user_id,
  email,
  acquisition_channel,
  country,
  created_at
from prep
where rn = 1;