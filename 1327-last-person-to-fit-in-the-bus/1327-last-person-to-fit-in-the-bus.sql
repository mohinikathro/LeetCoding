with OrderedQueue as (
    select *, sum(weight) over (order by turn) as sum_weight
    from Queue
),
validboarding as (
    select *
    from OrderedQueue
    where sum_weight <= 1000
)
select person_name
from validboarding
order by turn desc
limit 1