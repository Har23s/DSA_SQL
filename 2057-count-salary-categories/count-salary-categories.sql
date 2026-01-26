# Write your MySQL query statement below
WITH AllCategories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary' AS category
    UNION ALL
    SELECT 'High Salary' AS category
),
CategorizedAccountCounts AS (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END AS category,
        COUNT(account_id) AS accounts_count
    FROM Accounts
    GROUP BY
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END
)
SELECT
    ac.category,
    COALESCE(cac.accounts_count, 0) AS accounts_count
FROM AllCategories ac
LEFT JOIN CategorizedAccountCounts cac ON ac.category = cac.category;