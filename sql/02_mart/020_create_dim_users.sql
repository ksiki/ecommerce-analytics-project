drop table if exists mart.dim_users;
create table mart.dim_users as
select
  user_id,
  acquisition_channel,
  country,
  created_at
from dwh.users;