SELECT
d.sign_date "Дата",
count(d.id) AS "Количество документов"
FROM documents d
GROUP BY d.sign_date
;
