# Write your MySQL query statement below
SELECT
user_id,
concat(upper(substring(name, 1, 1)), Lower(substring(name, 2))) as name
from 
users
order by
user_id;