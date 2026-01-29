# Write your MySQL query statement below
SELECT
    ROUND(SUM(I1.tiv_2016), 2) AS tiv_2016
FROM
    Insurance I1
WHERE
    -- Condition 1: tiv_2015 value is shared by one or more other policyholders
    I1.tiv_2015 IN (
        SELECT
            tiv_2015
        FROM
            Insurance
        GROUP BY
            tiv_2015
        HAVING
            COUNT(pid) > 1
    )
    AND
    -- Condition 2: (lat, lon) pair is unique (not shared with any other policyholder)
    (I1.lat, I1.lon) IN (
        SELECT
            lat, lon
        FROM
            Insurance
        GROUP BY
            lat, lon
        HAVING
            COUNT(pid) = 1
    );