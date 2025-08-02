WITH categorized AS (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM Accounts
)
SELECT category, COUNT(*) AS accounts_count
FROM categorized
GROUP BY category
-- ensure all three categories are returned even if one is missing
UNION ALL
SELECT 'Low Salary', 0 WHERE NOT EXISTS (SELECT 1 FROM categorized WHERE category = 'Low Salary')
UNION ALL
SELECT 'Average Salary', 0 WHERE NOT EXISTS (SELECT 1 FROM categorized WHERE category = 'Average Salary')
UNION ALL
SELECT 'High Salary', 0 WHERE NOT EXISTS (SELECT 1 FROM categorized WHERE category = 'High Salary');