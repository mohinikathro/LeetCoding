# Write your MySQL query statement below
select p.project_id, round(avg(experience_years), 2) average_years
from Project p
join Employee e
on p.employee_id = e.employee_id
group by p.project_id