WITH max_count AS (
SELECT t.data, MAX(t.data_count) AS maxc FROM
(SELECT
d.sign_date data,
count(d.id) data_count
FROM documents d
GROUP BY d.sign_date
) t
GROUP BY t.data
)
SELECT * from max_count t1
JOIN max_count t2
ON 
t1.data = t2.data

;
