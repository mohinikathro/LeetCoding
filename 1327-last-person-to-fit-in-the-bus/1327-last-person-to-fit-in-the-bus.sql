WITH OrderedQueue AS (
    SELECT *, 
           SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM Queue
),
ValidBoarding AS (
    SELECT * 
    FROM OrderedQueue 
    WHERE cumulative_weight <= 1000
)
SELECT person_name 
FROM ValidBoarding
ORDER BY turn DESC
LIMIT 1;