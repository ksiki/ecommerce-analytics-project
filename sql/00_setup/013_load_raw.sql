copy raw.users
from 'D:\projects\ecommerce-analytics-project\data\users_raw.csv'
delimiter ','
csv header;

copy raw.products
from 'D:\projects\ecommerce-analytics-project\data\products_raw.csv'
delimiter ','
csv header;

copy raw.orders
from 'D:\projects\ecommerce-analytics-project\data\orders_raw.csv'
delimiter ','
csv header;

copy raw.order_items
from 'D:\projects\ecommerce-analytics-project\data\order_items_raw.csv'
delimiter ','
csv header;