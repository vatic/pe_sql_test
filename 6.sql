WITH count_t AS (
SELECT
d.sign_date data,
count(d.id) data_count
FROM documents d
GROUP BY d.sign_date
)
SELECT 'Максимум документов: дата: ' || t1.data || ' , кол-во: ' || t1.data_count
FROM count_t t1
JOIN
(SELECT MAX(count_t.data_count) maxc FROM count_t) t2
ON 
t1.data_count = t2.maxc;

