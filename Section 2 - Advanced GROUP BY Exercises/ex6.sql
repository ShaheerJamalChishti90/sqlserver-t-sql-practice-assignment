--Exercise 6: Group Runners by Main Distance and Age

--Exercise:
--Display the distance and the number of runners 
--there are for the following age categories: 
--under 20, 20–29, 30–39, 40–49, and over 50. 
--Use the following column aliases: 
--under_20, age_20_29, age_30_39, age_40_49, and over_50.


select main_distance, count(id) total_participants from runner group by main_distance



select   
    main_distance,
    sum(case when age < 20 then 1 else 0 end) as [under 20], 
    sum(case when age >= 20 and age < 30 then 1 else 0 end) AS [20 - 29], 
    sum(case when age >= 30 and age < 40 then 1 else 0 end) AS [30 - 39], 
    sum(case when age >= 40 and age < 50 then 1 else 0 end) AS [40 - 49], 
    count(*) as total_Candids 
from runner
group by main_distance;



