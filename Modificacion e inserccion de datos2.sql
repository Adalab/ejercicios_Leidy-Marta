USE tienda;
CREATE TABLE IF NOT EXISTS customers_mod
SELECT * 
FROM customers;
INSERT INTO customers (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city,state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (customer_number-343, "Adalab", "Rodriguez", "Julia", "672986373", "Calle Falsa 123", "Puerta 42", "Madrid", "España", "28000", "España", NULL, "20000000");