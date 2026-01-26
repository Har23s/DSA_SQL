# Write your MySQL query statement below
WITH CumulativeWeight AS (
    SELECT
        person_id,
        person_name,
        weight,
        turn,
      
        SUM(weight) OVER (ORDER BY turn ASC) AS total_weight_so_far
    FROM
        Queue
)
SELECT
    person_name
FROM
    CumulativeWeight
WHERE
   
    total_weight_so_far <= 1000
ORDER BY
   
    turn DESC
LIMIT 1; 