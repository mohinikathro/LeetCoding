# Write your MySQL query statement below
select left(trans_date, 7) month, country,
    count(id) trans_count,
    sum(state = 'approved') approved_count,
    sum(amount) trans_total_amount,
    sum((state='approved') * amount) approved_total_amount
from Transactions
group by month, country