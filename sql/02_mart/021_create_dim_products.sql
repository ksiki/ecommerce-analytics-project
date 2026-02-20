drop table if exists mart.dim_products;
create table mart.dim_products as
select
  product_id,
  category,
  price
from staging.products;