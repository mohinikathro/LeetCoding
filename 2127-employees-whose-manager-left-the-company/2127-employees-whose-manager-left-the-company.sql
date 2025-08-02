# Write your MySQL query statement below
Select employee_id
from Employees
where salary < 30000
    and manager_id is not null
    and manager_id not in (
        select employee_id from employees
    )
order by employee_id