--Exercise 1: List All Clothing Items

--Exercise:
--Display the name of clothing items (name the column clothes), 
--their color (name the column color), 
--and the last name and first name of the customer(s) 
--who bought this apparel in their favorite color. 
--Sort rows according to color, in ascending order.

SELECT * FROM customer
SELECT * FROM clothing
SELECT * FROM color



select 
	--cu.id Customer_ID, 
	concat(cu.first_name, ' ', cu.last_name) Customer, 
	cl.name Cloth, 
	co.name Color
from clothing cl
join customer cu on  cu.favorite_color_id = cl.color_id
join color co on cl.color_id = co.id
order by Color asc;

