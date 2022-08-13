SELECT
dt.name "Тип договора",
contract_number "№ договора",
sign_date "Дата подписания",
cp1.name "Поставщик",
cp2.name "Плательщик"
FROM contracts c
INNER JOIN document_types dt ON c.document_type_id = dt.id
INNER JOIN counterparties cp1 ON c.provider_id = cp1.id
INNER JOIN counterparties cp2 ON c.payer_id = cp2.id
;
