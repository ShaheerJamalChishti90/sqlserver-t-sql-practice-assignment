--Exercise 5: How Many Runners Participate in Each Event

--Exercise:
--Display the event name and the number of club members 
--that take part in this event 
--(call this column runner_count). 
--Note that there may be events in which 
--no club members participate. 
--For these events, the runner_count should equal 0.

select 
	e.name event_name, 
	count(r.id) runner_count
from 
	event e 
join 
	runner_event re on re.event_id = e.id
join runner r on re.runner_id = r.id 
group by e.name





