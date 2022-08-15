INSERT INTO items(document_id, name, quantity, unit_id, price, currency_id) VALUES
	(
	(SELECT d.id FROM documents d WHERE d.document_number= '1' AND d.sign_date='2006-01-01'),
	'Болт',
	10,
	(SELECT u.id FROM units u WHERE u.code= 'шт'),
	3,
	(SELECT cu.id FROM currencies cu WHERE cu.code= 'RUB')
	);

