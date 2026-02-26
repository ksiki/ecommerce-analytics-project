create table staging.users (
    user_id text,
    email text,
    acquisition_channel text,
    country text,
    created_at text
);

create table staging.products (
    product_id text,
    product_name text,
    category text,
    price text
);

create table staging.orders (
    order_id text,
    user_id text,
    order_date text,
    status text
);

create table staging.order_items (
    order_id text,
    product_id text,
    quantity text
);