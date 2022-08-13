SELECT
dt.name "Тип документа",
contract_number "№ документа",
sign_date "Дата",
0 AS "Сумма по документу",
contract_id,
cp1.name "Поставщик",
cp2.name "Плательщик"
FROM contracts c
-- INNER JOIN document_types dt ON c.document_type_id = dt.id
INNER JOIN counterparties cp1 ON c.provider_id = cp1.id
INNER JOIN counterparties cp2 ON c.payer_id = cp2.id
;
