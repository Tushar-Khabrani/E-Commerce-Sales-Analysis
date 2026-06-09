select *from raw_orders where trim(customer_name) = ''
or trim(city) = ''
or trim(product) = '';
select 
sum(order_id is null or trim(order_id) = '' or lower(trim(order_id)) = 'NULL') as missing_order_id,
sum(customer_name is null or trim(customer_name) = '' or lower(trim(customer_name)) = 'NULL') as missing_customer_name,
sum(city is null or trim(city) = '' or lower(trim(city)) = 'NULL') as missing_city,
sum(product is null or trim(product) = '' or lower(trim(product)) = 'NULL') as missing_product,
sum(category is null or trim(category) = '' or lower(trim(category)) = 'NULL') as missing_category,
sum(price is null or trim(price) = ''  or lower(trim(price)) = 'NULL'
or price not regexp '^[0-9]+$' or cast(price as signed) <= 0) as invalid_price,
sum(quantity is null or trim(quantity) = '' or lower(trim(quantity)) = 'NULL'
or quantity not regexp '^[0-9]+$'or cast(quantity as signed) <= 0) as invalid_quantity,
sum( order_date is null or trim(order_date) = '' or lower(trim(order_date)) = 'NULL'
or str_to_date(trim(order_date), '%Y-%m-%d') is null) as invalid_order_date,
sum( payment_method is null or trim(payment_method) = '' or lower(trim(payment_method)) = 'NULL'
or payment_method not in ('UPI','COD','Cash','Card')) as invalid_payment_method
from raw_orders;
select order_id, count(*) as count from raw_orders
group by order_id having count(*) >1 ;
select *, count(*) over (partition by order_id, customer_name, product, price) as dup_count
from raw_orders;
select customer_name, count(*)from raw_orders
group by customer_name having count(*) > 1;
select *from raw_orders where customer_name is null 
or trim(customer_name) = '' or customer_name regexp '[0-9]' 
or customer_name regexp '[^A-Za-z ]' or length(trim(customer_name)) < 5;
select * from raw_orders
where customer_name is null  or trim(customer_name) = '';
select * from raw_orders where city is null 
or trim(city) = '' or city regexp '[0-9]';
select * from raw_orders 
where product is null or trim(product) = '';
select * from raw_orders 
where category not in ('Electronics','Fashion','Food','Drinks');
select * from raw_orders
where price not regexp '^[0-9]+$'or cast(price as signed) < 0;
select * from raw_orders 
where quantity not regexp '^[0-9]+$'or cast(quantity as signed) <= 0;
select * from raw_orders
where str_to_date(order_date,'%Y-%m-%d') is null ;
select * from raw_orders
where payment_method not in ('UPI','COD','Cash','Card');

create table rectified_orders as
select distinct  order_id,
email,
coalesce(nullif(trim(customer_name), ''), 'unknown') as customer_name,
coalesce(nullif(trim(city), ''), 'unknown') as city,
coalesce(nullif(trim(product), ''), 'unknown') as product,
category,
case when trim(price) regexp '^[0-9]+$' 
then cast(price as unsigned)  else null end as price,
case when trim(quantity) regexp '^[0-9]+$'
then cast(quantity as unsigned) else null end as quantity,
case when order_date is null or 
lower(trim(order_date)) = 'NULL' or trim(order_date) = ''
then null when str_to_date(trim(order_date), '%Y-%m-%d') is not null
then str_to_date(trim(order_date), '%Y-%m-%d') else null end as order_date,
payment_method
from raw_orders;
select * from rectified_orders;
select 
count(*) as total_rows,
sum(price is null) as null_price,
sum(quantity is null) as null_quantity,
sum(order_date is null) as null_date,
sum(product is null) as null_product
from rectified_orders;
create table cleaned_orders as
select 
order_id,
email, 
customer_name,
city,
product,
category,
price,
ifnull(quantity, 1) as quantity,
order_date,
payment_method,
(ifnull(price,0) * ifnull(quantity,1)) as revenue
from rectified_orders
where order_date is not null and price > 0;
select * from cleaned_orders;