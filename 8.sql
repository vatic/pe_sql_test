UPDATE contracts
SET
sign_date = '2006-06-01'
WHERE
contract_number = '123'
AND
operation_type_id = (SELECT operation_type_id FROM operation_types WHERE name = 'Входящие договоры')
AND
document_type_id = (SELECT document_type_id FROM document_types WHERE name = 'Договор поставки');
