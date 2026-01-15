# Write your MySQL query statement below
WITH FirstLogins AS (
    -- Step 1: Find the first login date for every player
    SELECT 
        player_id, 
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
)
SELECT 
    ROUND(
        COUNT(a.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 
    2) AS fraction
FROM FirstLogins fl
-- Step 2: Left join to see if a record exists for (first_login + 1 day)
LEFT JOIN Activity a 
    ON fl.player_id = a.player_id 
    AND a.event_date = DATE_ADD(fl.first_login, INTERVAL 1 DAY);