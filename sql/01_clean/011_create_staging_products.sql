drop table if exists staging.products;
create table staging.products as
select
  product_id::bigint,
  product_name,
  category,
  nullif(price, '')::numeric(12,2) as price
from raw.products
where nullif(price, '') is not null
  and nullif(price, '')::numeric(12,2) >= 0;