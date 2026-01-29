# Write your MySQL query statement below
WITH DailySales AS (
    -- Step 1: Aggregate daily total amounts
    SELECT
        visited_on,
        SUM(amount) AS total_amount
    FROM
        Customer
    GROUP BY
        visited_on
),
MinSalesDate AS (
    -- Step 2: Find the minimum visited_on date to determine the start of the 7-day window
    SELECT MIN(visited_on) as min_visited_on
    FROM DailySales
)
SELECT
    ds_current.visited_on,

    SUM(ds_window.total_amount) AS amount,
    
    ROUND(SUM(ds_window.total_amount) / 7.0, 2) AS average_amount
FROM
    DailySales ds_current
JOIN
    DailySales ds_window
ON
    
    ds_window.visited_on BETWEEN DATE_SUB(ds_current.visited_on, INTERVAL 6 DAY) AND ds_current.visited_on
WHERE
   
    ds_current.visited_on >= (SELECT min_visited_on + INTERVAL 6 DAY FROM MinSalesDate)
GROUP BY
    ds_current.visited_on
ORDER BY
    ds_current.visited_on;