USE tienda;
SELECT 
MIN(customer_number)
FROM customers_mod;

SELECT 
AVG(credit_limit)
FROM customers_mod
WHERE country= 'Spain';

SELECT 
COUNT(customer_number)
FROM customers_mod
WHERE country= 'France';

SELECT 
MAX(credit_limit)
FROM customers_mod
WHERE sales_rep_employee_number=1323;

SELECT 
MAX(sales_rep_employee_number)
FROM customers_mod;

SELECT
sales_rep_employee_number,
COUNT(DISTINCT customer_number)
FROM customers_mod
GROUP BY sales_rep_employee_number;

SELECT
sales_rep_employee_number,
COUNT(DISTINCT customer_number) 
FROM customers_mod
GROUP BY sales_rep_employee_number
HAVING COUNT(DISTINCT customer_number) >7;

SELECT
sales_rep_employee_number,
COUNT(DISTINCT customer_number),
CASE
    WHEN COUNT(DISTINCT customer_number)>7 THEN 'AltoRendimiento'
    ELSE 'BajoRendimiento'
    END AS 'Rendimiento'
FROM customers_mod
GROUP BY sales_rep_employee_number;

SELECT
country,
COUNT(DISTINCT customer_number) 
FROM customers_mod
GROUP BY country;

SELECT
country,
COUNT(DISTINCT city) 
FROM customers_mod
GROUP BY country
HAVING COUNT(DISTINCT city)>3;







