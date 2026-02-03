use pizza;
-- total revenue

select sum(total_price) as Total_Revenue 
from pizza_sales;

-- average order values

select sum(total_price) / count(distinct order_id)
as avg_ord_value 
from pizza_sales;

-- total pizza sold

select 
sum(quantity) as total_pizza_sold
from 
pizza_sales;

-- total order

select 
count(distinct order_id) as total_order
from pizza_sales;

-- average pizza per order

select round(
round(sum(quantity)/count(distinct order_id))) 
as average_pizza_per_order
from pizza_sales;

-- daily trend for total order

create table daily_trend
(select dayname(date) as Day, 
count(distinct order_id) as total_order
from orders
group by Day
order by total_order desc);

-- monthly trend for total order

create table MonthlyTrend
(select monthname(date) as Month, 
count(distinct order_id) as total_order
from orders
group by Month
order by total_order desc);

-- % of sales by pizza_category

create table percetage_category_vise
(select pizza_category,
round(sum(total_price)*100)/(select sum(total_price) 
from pizza_sales) as percent_of_sales
from pizza_sales
group by pizza_category);

-- -- % of sales by pizza_size
create table percetage_size_vise
(select pizza_SIZE,
round(sum(total_price)*100)/(select sum(total_price) 
from pizza_sales) as percent_of_sales
from pizza_sales
group by pizza_size);

-- top 5 best_seller by revenue

create table top_BS_revenue 
(select pizza_name, sum(total_price) as revenue
from pizza_sales
group by pizza_name
order by revenue desc
limit 5);

-- bottom 5 best_seller pizza by revenue
create table bottom_bs_revenue
(select pizza_name, sum(total_price) as revenue
from pizza_sales
group by pizza_name
order by revenue asc
limit 5);


-- top 5 best seller by quantity
create table top_bs_quantity
(select pizza_name, sum(quantity) as quantity
from pizza_sales
group by pizza_name
order by quantity desc
limit 5);


-- bottom 5 best seller by quantity
create table bottom_bs_quantity
(select pizza_name, sum(quantity) as quantity
from pizza_sales
group by pizza_name
order by quantity asc
limit 5);

-- top 5 best seller by total order
create table top_bs_total_order
(select pizza_name, count(distinct order_id) as total_order
from pizza_sales
group by pizza_name
order by total_order desc
limit 5);

-- bottom 5 best seller by total order
create table bottom_bs_total_order
(select pizza_name, count(distinct order_id) as total_order
from pizza_sales
group by pizza_name
order by total_order asc
limit 5);

-- number of customer each day and busiest hour

select dayname(order_date) as Day, 
count(distinct order_id) as Total_customer
 from pizza_sales
group by Day
order by Total_customer;


