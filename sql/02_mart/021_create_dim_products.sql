drop table if exists mart.dim_products;
create table mart.dim_products as
select
  product_id,
  product_name,
  category,
  price
from dwh.products;