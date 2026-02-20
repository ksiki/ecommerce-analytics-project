create table raw.users (
    user_id text,
    email text,
    acquisition_channel text,
    country text,
    created_at text
);

create table raw.products (
    product_id text,
    product_name text,
    category text,
    price text
);

create table raw.orders (
    order_id text,
    user_id text,
    order_date text,
    status text
);

create table raw.order_items (
    order_id text,
    product_id text,
    quantity text
);