TRANCATE TABLE counterparties;
INSERT INTO counterparties (name) VALUES
("First vendor"),
("Second vendor"),
("Third vendor"),
("Fourth vendor"),
("Fifth vendor");

TRANCATE TABLE operation_types;
INSERT INTO operation_types (name) VALUES
("Sale"),
("Rent");

TRANCATE TABLE document_types;
INSERT INTO document_types(operation_type_id, name) VALUES
(SELECT ot.id FROM operation_types AS ot WHERE ot.name = "Sale", "Some_Sale");
