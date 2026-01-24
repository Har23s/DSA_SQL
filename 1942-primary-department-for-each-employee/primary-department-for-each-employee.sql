# Write your MySQL query statement below
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION ALL

SELECT e.employee_id, MAX(e.department_id) AS department_id
FROM Employee e
GROUP BY e.employee_id
HAVING SUM(CASE WHEN e.primary_flag = 'Y' THEN 1 ELSE 0 END) = 0;