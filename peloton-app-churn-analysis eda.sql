-- question 1: how many total customers are there, and how many have churned?

select count(*) as total_customers, sum(case when churned = 'yes' then 1 else 0 end) as churned_customers
from subscription;


-- question 2: what is the overall customer churn rate?

select round(sum(case when churned = 'yes' then 1 else 0 end) * 100.0 / count(*), 2) as churn_rate
from subscription;


-- question 3: how does churn rate differ between monthly and annual plans?

select plan_type, count(*) as total_customers, sum(case when churned = 'yes' then 1 else 0 end) as churned_customers, round(sum(case when churned = 'yes' then 1 else 0 end) * 100.0 / count(*), 2) as churn_rate
from subscription
group by plan_type
order by churn_rate desc;


-- question 4: how does churn rate differ across subscription tiers?

select plan_tier, count(*) as total_customers, sum(case when churned = 'yes' then 1 else 0 end) as churned_customers, round(sum(case when churned = 'yes' then 1 else 0 end) * 100.0 / count(*), 2) as churn_rate
from subscription
group by plan_tier
order by churn_rate desc;


-- question 5: which acquisition channels have the highest churn rate?

select acquisition_channel, count(*) as total_customers, sum(case when churned = 'yes' then 1 else 0 end) as churned_customers, round(sum(case when churned = 'yes' then 1 else 0 end) * 100.0 / count(*), 2) as churn_rate
from subscription
group by acquisition_channel
order by churn_rate desc;


-- question 6: how does churn rate differ across primary devices?

select primary_device, count(*) as total_customers, sum(case when churned = 'yes' then 1 else 0 end) as churned_customers, round(sum(case when churned = 'yes' then 1 else 0 end) * 100.0 / count(*), 2) as churn_rate
from subscription
group by primary_device
order by churn_rate desc;


-- question 7: how does churn rate differ across age groups?

select age_group, count(*) as total_customers, sum(case when churned = 'yes' then 1 else 0 end) as churned_customers, round(sum(case when churned = 'yes' then 1 else 0 end) * 100.0 / count(*), 2) as churn_rate
from subscription
group by age_group
order by churn_rate desc;


-- question 8: how does churn rate differ by monthly price?

select
monthly_price,
count(*) as total_customers,
sum(case when churned = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churned = 'yes' then 1 else 0 end) * 100.0 / count(*), 2) as churn_rate
from subscription
group by monthly_price
order by churn_rate desc;


-- question 9: how does average monthly engagement differ between churned and active customers?

select s.churned, count(distinct s.customer_id) as customers, round(avg(u.workouts_completed), 2) as avg_workouts, round(avg(u.minutes_active), 2) as avg_minutes_active, round(avg(u.classes_booked), 2) as avg_classes_booked
from subscription s
join `usage` u
on s.customer_id = u.customer_id
group by s.churned;


-- question 10: how does workout frequency relate to customer churn?

select
case
when u.workouts_completed = 0 then '0 workouts'
when u.workouts_completed between 1 and 4 then '1-4 workouts'
when u.workouts_completed between 5 and 9 then '5-9 workouts'
else '10+ workouts'
end as workout_group, count(distinct u.customer_id) as customers, count(distinct case when s.churned = 'yes' then s.customer_id end) as churned_customers, round(count(distinct case when s.churned = 'yes' then s.customer_id end) * 100.0 / count(distinct u.customer_id), 2) as churn_rate
from `usage` u
join subscription s
on u.customer_id = s.customer_id
group by workout_group
order by churn_rate desc;


-- question 11: how does support ticket activity relate to customer churn?

select
case
when u.support_tickets = 0 then '0 tickets'
when u.support_tickets = 1 then '1 ticket'
else '2+ tickets'
end as support_group, count(distinct u.customer_id) as customers, count(distinct case when s.churned = 'yes' then s.customer_id end) as churned_customers, round(count(distinct case when s.churned = 'yes' then s.customer_id end) * 100.0 / count(distinct u.customer_id), 2) as churn_rate
from `usage` u
join subscription s
on u.customer_id = s.customer_id
group by support_group
order by churn_rate desc;


-- question 12: how does first-month workout activity differ between churned and active customers?

with first_month as (
select customer_id, min(str_to_date(concat(month, '-01'), '%m-%Y-%d')) as first_month
from `usage`
group by customer_id
)
select s.churned, count(*) as customers, round(avg(u.workouts_completed), 2) as avg_first_month_workouts, round(avg(u.minutes_active), 2) as avg_first_month_minutes, round(avg(u.classes_booked), 2) as avg_first_month_classes
from subscription s
join first_month f
on s.customer_id = f.customer_id
join `usage` u
on f.customer_id = u.customer_id
and f.first_month = str_to_date(concat(u.month, '-01'), '%m-%Y-%d')
group by s.churned;


-- question 13: how does churn rate differ by plan type within similar tenure groups?

select plan_type, tenure_group, count(*) as customers, sum(case when churned = 'yes' then 1 else 0 end) as churned_customers, round(sum(case when churned = 'yes' then 1 else 0 end) * 100.0 / count(*), 2) as churn_rate
from (
select plan_type, churned,
case
when datediff(coalesce(churn_date, '2025-12-31'), signup_date) <= 90 then '0-90 days'
when datediff(coalesce(churn_date, '2025-12-31'), signup_date) <= 180 then '91-180 days'
when datediff(coalesce(churn_date, '2025-12-31'), signup_date) <= 365 then '181-365 days'
else '365+ days'
end as tenure_group
from subscription
) t
group by plan_type, tenure_group
order by tenure_group, churn_rate desc;


-- question 14: what are the most common cancellation reasons among churned customers?

select cancel_reason, count(*) as cancelled_customers, round(count(*) * 100.0 / (select count(*) from subscription where churned = 'yes'), 2) as percentage_of_churn
from subscription
where churned = 'yes'
and cancel_reason is not null
and cancel_reason != ''
group by cancel_reason
order by cancelled_customers desc;


-- question 15: which cancellation reasons are most common for each subscription tier?

select plan_tier, cancel_reason, count(*) as cancelled_customers
from subscription
where churned = 'yes'
and cancel_reason is not null
and cancel_reason != ''
group by plan_tier, cancel_reason
order by plan_tier, cancelled_customers desc;

-- question 16: how does each customer's monthly workout activity compare with the previous month?

select customer_id, month, workouts_completed,
lag(workouts_completed) over(partition by customer_id order by str_to_date(concat(month, '01'), '%m-%Y-%d')) as previous_month_workouts
from `usage`;


-- question 17: what is the workout trend for each customer across their subscription period?

select customer_id, month, workouts_completed,
sum(workouts_completed) over(partition by customer_id order by str_to_date(concat(month, '-01'), '%m-%Y-%d')) as cumulative_workouts
from `usage`;


-- question 18: which customers have the highest total workout activity?

select customer_id, total_workouts,
rank() over(order by total_workouts desc) as workout_rank
from (
select customer_id, sum(workouts_completed) as total_workouts
from `usage`
group by customer_id
) t;
