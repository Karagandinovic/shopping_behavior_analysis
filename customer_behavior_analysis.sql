-- Which customer segments generate the most revenue?
-- gender
select
	gender,
	avg(purchase_amount_usd) as ave_purchase_amount,
	count(*) as number_of_customers,
	sum(purchase_amount_usd) as purchase_amount,
	avg(previous_purchases) as previous_purchases
from shopping_behavior
group by gender;

-- age
select
	floor(age / 10) * 10 || '-' || floor(age / 10) * 10 + 10 as age_group,
	avg(purchase_amount_usd) as ave_purchase_amount,
	count(*) as number_of_customers,
	sum(purchase_amount_usd) as purchase_amount,
	avg(previous_purchases) as previous_purchases
from shopping_behavior
group by age_group
order by age_group;

with cte as(
select
	floor(age / 10) * 10 || '-' || floor(age / 10) * 10 + 10 as age_group,
	count(*) as number_of_customers,
	sum(purchase_amount_usd) as purchase_amount
from shopping_behavior
group by age_group
)
select corr(number_of_customers, purchase_amount)
from cte;

-- location
select
	location,
	avg(purchase_amount_usd) as ave_purchase_amount,
	count(*) as number_of_customers,
	sum(purchase_amount_usd) as purchase_amount,
	avg(previous_purchases) as previous_purchases
from shopping_behavior
group by location
order by purchase_amount;

with cte as(
select
	location,
	avg(purchase_amount_usd) as ave_purchase_amount,
	count(*) as number_of_customers,
	sum(purchase_amount_usd) as purchase_amount,
	avg(previous_purchases) as previous_purchases
from shopping_behavior
group by location
)
select
	corr(number_of_customers, purchase_amount) as customers_count_and_revenue,
	corr(ave_purchase_amount, purchase_amount) as ave_check_and_revenue,
	corr(previous_purchases, purchase_amount) as prev_purchases_and_revenue,
	avg(ave_purchase_amount) as ave_ave_check,
	avg(previous_purchases) as ave_prev_purchases
from cte;


-- Does subscription increase customer value or not?
select
	subscription_status,
	avg(purchase_amount_usd) as ave_purchase_amount,
	count(*) as customers_count,
	avg(previous_purchases) as previous_purchases,
	sum(case when discount_applied = 'Yes' then 1 else 0 end) * 100 / count(*) as percentage_of_customers_with_discount
from shopping_behavior
group by subscription_status;

select
	subscription_status,
	frequency_of_purchases,
	avg(purchase_amount_usd) as ave_check,
	count(*)
from shopping_behavior
group by frequency_of_purchases, subscription_status
order by subscription_status;


-- How does discount affect customer behavior?
select
	discount_applied,
	avg(purchase_amount_usd) as ave_purchase_amount,
	count(*) as customers_count
from shopping_behavior
group by discount_applied;

select
	discount_applied,
	frequency_of_purchases,
	count(*) as customers_count
from shopping_behavior
group by discount_applied, frequency_of_purchases
order by frequency_of_purchases, discount_applied;

select
	discount_applied,
	category,
	count(*) as customers_count,
	avg(purchase_amount_usd) as ave_check
from shopping_behavior
group by discount_applied, category
order by category, discount_applied;

select
	location,
	sum(case when discount_applied = 'Yes' then 1 else 0 end) * 100 / count(*) as percentage_of_orders_with_discount
from shopping_behavior
group by location;


-- Which categories generate the most revenue?
select
	category,
	sum(purchase_amount_usd) as revenue,
	count(*) as orders_count,
	avg(purchase_amount_usd) as ave_check,
	avg(review_rating) as ave_review_rating
from shopping_behavior
group by category;

with cte as(
select
	category,
	sum(purchase_amount_usd) as revenue,
	count(*) as orders_count
from shopping_behavior
group by category
)
select
	corr(revenue, orders_count)
from cte;


-- items and review ratings
select
	item_purchased,
	avg(review_rating) as ave_rating
from shopping_behavior
group by item_purchased
order by ave_rating;

-- Is there a relationship between review rating and purchase amount?
select
	floor(review_rating * 5) / 5 as review_rating_rounded,
	avg(purchase_amount_usd) as ave_check,
	count(*) as number_of_orders
from shopping_behavior
group by review_rating_rounded
order by review_rating_rounded;

select
	corr(review_rating, purchase_amount_usd)
from shopping_behavior;


-- Which products have highest/lowest percentage of purchases with discounts applied?
select
	category,
	item_purchased,
	sum(case when discount_applied = 'Yes' then 1 else 0 end) * 100 / count(*) as percentage_of_purchases_with_discount,
	avg(purchase_amount_usd) as ave_check
from shopping_behavior s
group by item_purchased, category
order by 3;

-- Difference across the groups
select
	category,
	sum(case when discount_applied = 'Yes' then 1 else 0 end) * 100 / count(*) as percentage_of_purchases_with_discount
from shopping_behavior s
group by category
order by 2;


-- new, returning and loyal customers
select
	case 
		when previous_purchases = 1 then 'New'
		when previous_purchases between 2 and 10 then 'Returning'
		else 'Loyal'
	end as customer_category,
	count(*) as number,
	avg(purchase_amount_usd) as ave_check,
	sum(case when discount_applied = 'Yes' then 1 else 0 end) * 100 / count(*) as percentage_of_customers_with_discount,
	sum(case when subscription_status = 'Yes' then 1 else 0 end) * 100 / count(*) as subscription_rate
from shopping_behavior s
group by customer_category;

-- How previous purchases affect revenue?
select
	previous_purchases,
	avg(purchase_amount_usd) as ave_check,
	count(*) as number_of_orders
from shopping_behavior
group by previous_purchases
order by previous_purchases;

select
	corr(previous_purchases, purchase_amount_usd)
from shopping_behavior;


-- what are the top 3 most purchased products within each category? -- !
with cte as (
select
	category,
	item_purchased,
	row_number() over (partition by category order by count(*) desc) as rank,
	count(*)
from shopping_behavior
group by item_purchased, category
)

select * from cte
where rank <= 3;