USE tienda;

-- Realiza una consulta SELECT que obtenga los nombres, teléfonos y direcciones de todas las empresas cliente de la tabla customers.

SELECT 
customer_name,
phone,
address_line1,
address_line2
FROM customers;

-- Realiza una consulta que obtenga los teléfonos y direcciones de aquellas empresas de la tabla customers que se encuentren en USA (es su país).
SELECT 
phone,
address_line1,
address_line2
FROM customers
WHERE country = "USA";

-- Realiza una consulta que obtenga los nombres y apellidos de las personas de contacto en cada empresa que no tenga segunda linea de dirección.

SELECT 
contact_last_name,
contact_first_name
FROM customers
WHERE address_line2 IS NULL;

-- Busca aquellos registros de la tabla customers que tengan un valor guardado para el campo state. Este atributo solo es valido para ciertos países por lo que habrá varias entradas con valor NULL.

SELECT *
FROM customers
WHERE state IS NOT NULL;

-- Busca aquellos registros de la tabla customers que correspondan a clientes de USA pero que no tengan un valor guardado para el campo state.

SELECT *
FROM customers
WHERE country = "USA" and state IS NULL;

-- Selecciona el país (country) correspondiente a los registros de clientes con un límite de crédito (credit_limit) mayor que $10000.

SELECT DISTINCT
country
FROM customers
WHERE credit_limit > 10000;
