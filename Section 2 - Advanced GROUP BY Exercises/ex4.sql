--Exercise 4: Organize Runners Into Groups

--Exercise:
--Select the main distance and the number of runners 
--that run the given distance (runners_number). 
--Display only those rows where the 
--number of runners is greater than 3.

select count(*) total_candids, main_distance 
from 
	runner 
group by 
	main_distance  
having count(*) > 3
order by 
	main_distance desc


