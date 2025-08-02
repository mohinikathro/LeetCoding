# Write your MySQL query statement below
select results
from(
    (
    select u.name as results
    from Users u join movierating mr
    on u.user_id = mr.user_id
    group by u.name
    order by count(*) desc, u.name
    limit 1
)
union all
(
    select m.title as results
    from movies m join movierating mr
    on m.movie_id = mr.movie_id
    where mr.created_at between '2020-02-01' and '2020-02-29'
    group by m.title
    order by avg(mr.rating) desc, title
    limit 1
)
) as combined