INSERT INTO documents(document_number, sign_date, operation_type_id, document_type_id, contract_id) VALUES
	(
	'3',
	'2006-06-01',
	(SELECT operation_type_id FROM documents WHERE id = '3'),
	(SELECT document_type_id FROM documents WHERE id = '3'),
	(SELECT contract_id FROM documents WHERE id = '3')
	);

INSERT INTO items(document_id, name, quantity, unit_id, price, currency_id) VALUES
	(
	 (SELECT * FROM items WHERE document_id IN (select id from documents where sign_date > '2005-12-31' and sign_date < '2006-02-01') and price > 2 and unit_id = (select id from units where code = 'RUB'),
	);

