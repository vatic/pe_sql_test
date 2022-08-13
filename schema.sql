-- PostgreSQL 14.3 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 12.1.0, 64-bit


-- Контрагенты
DROP TABLE IF EXISTS counterparties CASCADE;
CREATE TABLE counterparties (
	id serial PRIMARY KEY,
	name varchar(100)
);

-- Единицы измерения
DROP TABLE IF EXISTS units CASCADE;
CREATE TABLE units(
	id serial PRIMARY KEY,
	code varchar(20),
	name varchar(50)
);

-- Валюта
DROP TABLE IF EXISTS currencies CASCADE;
CREATE TABLE currencies(
	id serial PRIMARY KEY,
	code varchar(20),
	name varchar(50)
);

--  Тип операции
DROP TABLE IF EXISTS operation_types CASCADE;
CREATE TABLE operation_types (
	id serial PRIMARY KEY,
	name varchar(50)
);

-- Тип документа
DROP TABLE IF EXISTS document_types CASCADE;
CREATE TABLE document_types (
	id serial PRIMARY KEY,
	operation_type_id integer REFERENCES operation_types (id),
	name varchar(50)
);

-- Договор
DROP TABLE IF EXISTS contracts CASCADE;
CREATE TABLE contracts (
	id serial PRIMARY KEY,
	operation_type_id integer, 
	document_type_id integer REFERENCES document_types (id),
	contract_number varchar(50),
	sign_date date,
	provider_id integer REFERENCES counterparties (id),
	payer_id integer REFERENCES counterparties (id)

);

-- Документ
DROP TABLE IF EXISTS documents CASCADE;
CREATE TABLE documents (
	id serial PRIMARY KEY,
	operation_type_id integer, 
	document_type_id integer REFERENCES document_types (id),
	document_number varchar(50),
	sign_date date,
	contract_id integer REFERENCES contracts (id)

);

-- Позиции документа
DROP TABLE IF EXISTS items CASCADE;
CREATE TABLE items (
	id serial PRIMARY KEY,
	document_id integer REFERENCES documents (id),
	name varchar(200),
	quantity integer,
	unit_id integer REFERENCES units(id),
	price decimal,
	currency_id integer REFERENCES currencies (id)

);

