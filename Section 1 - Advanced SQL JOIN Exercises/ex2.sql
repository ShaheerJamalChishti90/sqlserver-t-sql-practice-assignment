--Exercise 2: Get All Non-Buying Customers

--Exercise:

--Select the last name and first name of customers 
--and the name of their favorite color for customers 
--with no purchases.

select 
	concat(first_name, ' ', last_name) customer, 
	clr.name 
from 
	customer cust 
join 
	color clr 
	on cust.favorite_color_id = clr.id 
where 
	cust.id not in (select distinct id from clothing_order)
order by 
	clr.name



