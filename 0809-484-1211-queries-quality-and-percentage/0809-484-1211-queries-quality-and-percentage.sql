# Write your MySQL query statement below
select query_name, 
    round((sum(rating / position)) / count(*), 2) quality,
    round(sum(case when rating < 3 then 1 else 0 end) * 100 / count(*), 2) poor_query_percentage
from Queries
group by query_name