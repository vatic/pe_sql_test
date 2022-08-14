TRUNCATE TABLE counterparties RESTART IDENTITY CASCADE;
INSERT INTO counterparties (name) VALUES
('First Vendor'),
('Second Vendor'),
('Third Vendor'),
('Fourth Vendor'),
('Fifth Vendor');

TRUNCATE TABLE operation_types RESTART IDENTITY CASCADE;
INSERT INTO operation_types (name) VALUES
('Sale'),
('Rent'),
('Расходные документы'),
('Приходные документы');

TRUNCATE TABLE document_types RESTART IDENTITY CASCADE ;
INSERT INTO document_types(operation_type_id, name) VALUES
((SELECT ot.id FROM operation_types AS ot WHERE ot.name = 'Sale'), 'Some_Sale'),
((SELECT ot.id FROM operation_types AS ot WHERE ot.name = 'Rent'), 'Some_Rent'),
((SELECT ot.id FROM operation_types AS ot WHERE ot.name = 'Расходные документы'), 'Некий расходник'),
((SELECT ot.id FROM operation_types AS ot WHERE ot.name = 'Приходные документы'), 'Некий приходник');

TRUNCATE TABLE currencies RESTART IDENTITY CASCADE ;
INSERT INTO currencies(code, name) VALUES
('RUB', 'Russian ruble'),
('USD', 'US Dollar'),
('EUR', 'Euro');

TRUNCATE TABLE units RESTART IDENTITY CASCADE ;
INSERT INTO units(code, name) VALUES
('kg', 'kilogramm'),
('m', 'meter'),
('l', 'liter');

TRUNCATE TABLE contracts RESTART IDENTITY CASCADE ;
INSERT INTO contracts(operation_type_id, document_type_id, contract_number, sign_date, provider_id, payer_id) VALUES
	(
	(SELECT dt.operation_type_id FROM document_types dt WHERE dt.name = 'Some_Sale'),
	(SELECT dt.id FROM document_types dt WHERE dt.name = 'Some_Sale'),
	'CONTRACT-111',
	'2022-07-22',
	(SELECT c.id FROM counterparties c WHERE c.name = 'First Vendor'),
	(SELECT c.id FROM counterparties c WHERE c.name = 'Third Vendor')
	),
	(
	(SELECT dt.operation_type_id FROM document_types dt WHERE dt.name = 'Some_Rent'),
	(SELECT dt.id FROM document_types dt WHERE dt.name = 'Some_Rent'),
	'CONTRACT-222',
	'2022-08-12',
	(SELECT c.id FROM counterparties c WHERE c.name = 'Second Vendor'),
	(SELECT c.id FROM counterparties c WHERE c.name = 'Fourth Vendor')
	);


TRUNCATE TABLE documents RESTART IDENTITY CASCADE ;
INSERT INTO documents(operation_type_id, document_type_id, document_number, sign_date, contract_id) VALUES
	(
	(SELECT dt.operation_type_id FROM document_types dt WHERE dt.name = 'Some_Sale'),
	(SELECT dt.id FROM document_types dt WHERE dt.name = 'Some_Sale'),
	'DOC-111',
	'2022-07-20',
	(SELECT c.id FROM contracts c WHERE c.contract_number = 'CONTRACT-111')
	),
	(
	(SELECT dt.operation_type_id FROM document_types dt WHERE dt.name = 'Some_Rent'),
	(SELECT dt.id FROM document_types dt WHERE dt.name = 'Some_Rent'),
	'DOC-222',
	'2022-08-12',
	(SELECT c.id FROM contracts c WHERE c.contract_number = 'CONTRACT-222')
	),
	(
	(SELECT dt.operation_type_id FROM document_types dt WHERE dt.name = 'Некий расходник'),
	(SELECT dt.id FROM document_types dt WHERE dt.name = 'Некий расходник'),
	'DOC-333',
	'2022-08-10',
	(SELECT c.id FROM contracts c WHERE c.contract_number = 'CONTRACT-222')
	),
	(
	(SELECT dt.operation_type_id FROM document_types dt WHERE dt.name = 'Некий расходник2'),
	(SELECT dt.id FROM document_types dt WHERE dt.name = 'Некий расходник'),
	'DOC-444',
	'2022-08-10',
	(SELECT c.id FROM contracts c WHERE c.contract_number = 'CONTRACT-111')
	);

TRUNCATE TABLE items RESTART IDENTITY CASCADE ;
INSERT INTO items(document_id, name, quantity, unit_id, price, currency_id) VALUES
	(
	(SELECT d.id FROM documents d WHERE d.document_number= 'DOC-111'),
	'Edged-board-111',
	19,
	(SELECT u.id FROM units u WHERE u.code= 'm'),
	19000,
	(SELECT cu.id FROM currencies cu WHERE cu.code= 'RUB')
	),
	(
	(SELECT d.id FROM documents d WHERE d.document_number= 'DOC-333'),
	'Цемент-111',
	500,
	(SELECT u.id FROM units u WHERE u.code= 'kg'),
	9000,
	(SELECT cu.id FROM currencies cu WHERE cu.code= 'RUB')
	),
	(
	(SELECT d.id FROM documents d WHERE d.document_number= 'DOC-333'),
	'Песок-111',
	400,
	(SELECT u.id FROM units u WHERE u.code= 'kg'),
	8000,
	(SELECT cu.id FROM currencies cu WHERE cu.code= 'RUB')
	)
	;

