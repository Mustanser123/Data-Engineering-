insert into dimdate(date_key,date,year,quarter,month,day,week,is_weekend)
select 
	distinct(TO_CHAR(payment_date::date, 'YYYMMDD')::integer) as date_key,
	date(payment_date) as date,
	extract(year from payment_date) as year,
	extract(quarter from payment_date) as quarter,
	extract(month from payment_date) as month,
	extract(day from payment_date) as day,
	extract(week from payment_date) as week,
	case when extract(ISODOW from payment_date) in (6, 7) then true else false end as is_weekend
from payment;

select * from dimdate





insert into dimcustomer(qustomer_key, customer_id,first_name,last_name, email,
					   address, address2,district, city, country, postal_code,
					   phone,create_date, start_date,end_date)
select c.customer_id as customer_key,
	   c.customer_id,
	   c.first_name,
	   c.last_name,
	   c.email,
	   a.address,
	   a.address2,
	   a.district,
	   ci.city,
	   co.country,
	   postal_code,
	   a.phone,
	   c.create_date,
	   now() as start_date,
	   now() as end_date
from customer c
join address a on (c.address_id=a.address_id)
join city ci on (a.city_id=ci.city_id)
join country co on (ci.country_id=co.country_id);





insert into factsales(date_key, customer_key, sales_amount)
select 
	  to_char(payment_date::date, 'yyyymmdd')::integer as date_key,
	  p.customer_id as customer_key,
	  p.amount as sales_amount
	 
	 
from payment p
join rental r on (p.rental_id=r.rental_id)
join inventory i on (r.inventory_id=i.inventory_id);