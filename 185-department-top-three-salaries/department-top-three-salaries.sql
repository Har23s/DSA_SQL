WITH RankedSalaries AS (
    SELECT
        e.departmentId,
        e.name AS employeeName,
        e.salary,
        d.name AS departmentName,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salaryRank
    FROM
        Employee e
    JOIN
        Department d ON e.departmentId = d.id
)
SELECT
    departmentName AS Department,
    employeeName AS Employee,
    salary AS Salary
FROM
    RankedSalaries
WHERE
    salaryRank <= 3;