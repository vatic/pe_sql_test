SELECT
dt.name "Тип документа",
d.document_number "№ документа",
d.sign_date "Дата",
SUM(i.price) AS "Сумма по документу",
(SELECT cp1.name FROM contracts c INNER JOIN counterparties cp1 ON c.provider_id = cp1.id WHERE d.contract_id = c.id) AS "Поставщик",
(SELECT cp2.name FROM contracts c INNER JOIN counterparties cp2 ON c.payer_id = cp2.id WHERE d.contract_id = c.id) AS "Плательщик"
FROM documents d
INNER JOIN document_types dt ON d.document_type_id = dt.id
LEFT OUTER JOIN items i ON d.id = i.document_id
GROUP BY d.id, dt.name, d.document_number, d.sign_date
;
