select 
sum(price * quantity) as total_revenue from rectified_orders
where order_date is not null and price > 0 and quantity > 0;
select 
product,
sum(quantity) as total_sold, sum(price * quantity) as revenue
from rectified_orders
where price > 0 and quantity > 0 group by product order by total_sold desc;
select 
city,
sum(price * quantity) as revenue, sum(quantity) as total_items
from rectified_orders
where price > 0 and quantity > 0 group by city order by revenue desc;
select 
date_format(order_date, '%y-%m') as month, sum(price * quantity) as revenue 
from rectified_orders
where order_date is not null and price > 0 and quantity > 0 group by month order by month;
select 
payment_method,
count(*) as total_orders
from rectified_orders where price > 0 and quantity > 0
group by payment_method
order by total_orders desc;
select 
customer_name,
city,
count(order_id) as total_orders, sum(price * quantity) as total_spent
from cleaned_orders
where price > 0 and quantity > 0 group by customer_name, city order by total_spent desc;
select 
customer_name,
count(order_id) as orders_count 
from cleaned_orders
where price > 0 and quantity > 0 group by customer_name having count(order_id) > 0;
select 
sum(price * quantity) as total_revenue,
sum(price) as total_price,
sum(quantity) as total_quantity
from cleaned_orders
where price > 0 and quantity > 0;
select 
order_date,
sum(price * quantity) as daily_revenue,
coalesce(lag(sum(price * quantity)) over (order by order_date),
sum(price * quantity)) as prev_day_revenue, sum(price * quantity) - 
coalesce(lag(sum(price * quantity)) over (order by order_date),
sum(price * quantity)) as growth
from cleaned_orders
where price > 0 and quantity > 0 group by order_date order by order_date;
select 
order_date,
sum(price * quantity) as revenue
from rectified_orders
where price > 0 and quantity > 0 group by order_date
having sum(price * quantity) > (select avg(price * quantity)
from rectified_orders
where price > 0 and quantity > 0) order by revenue desc;
select 
category,
sum(price * quantity) as revenue, count(*) as total_orders 
from rectified_orders 
where price > 0 and quantity > 0 group by category order by revenue desc;
select 
avg(price * quantity) as avg_order_value
from cleaned_orders 
where price > 0 and quantity > 0;


