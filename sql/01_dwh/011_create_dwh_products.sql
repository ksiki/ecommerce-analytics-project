drop table if exists dwh.products;
create table dwh.products as
select
  product_id::bigint,
  product_name,
  category,
  nullif(price, '')::numeric(12,2) as price
from staging.products
where nullif(price, '') is not null
  and nullif(price, '')::numeric(12,2) >= 0;