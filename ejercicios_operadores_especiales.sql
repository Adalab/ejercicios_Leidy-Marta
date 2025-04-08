USE tienda;

-- Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.

SELECT
last_name AS Apellidos
FROM
employees

UNION

SELECT
contact_last_name
FROM customers;

-- Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.

SELECT
first_name AS Nombre,
last_name AS Apellidos
FROM
employees

UNION

SELECT
contact_first_name,
contact_last_name
FROM customers;

-- Queremos ver ahora el employee_number como 'Número empleado', first_n_ame como 'nombre Empleado' y last_name como 'Apellido Empleado' para los empleados con employee_number: 1002,1076,1088 y 1612.

SELECT
employee_number AS "Número empleado",
first_name AS "nombre Empleado",
last_name AS "Apellido Empleado"
FROM employees
WHERE employee_number IN (1002,1076,1088, 1612);

-- Queremos ver ahora la 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, que no estén en: Ireland, France, Germany.

SELECT
city AS "ciudad",
customer_name AS "nombre de la empresa"
FROM customers
WHERE country NOT IN ("Ireland", "France", "Germany");

-- Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.

SELECT
city AS "ciudad",
customer_name AS "nombre de la empresa"
FROM customers
WHERE city LIKE "%on";

-- Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.

SELECT
city AS "ciudad",
customer_name AS "nombre de la empresa"
FROM customers
WHERE city LIKE "__on";

-- Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal (o lo que es lo mismo, su primera dirección).

SELECT
customer_name AS "nombre de la empresa",
address_line1 AS "primera dirección",
city AS "ciudad"
FROM customers
WHERE address_line1 LIKE "%3%";

-- Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal y la ciudad no empiece por T.

SELECT
customer_name AS "nombre de la empresa",
address_line1 AS "primera dirección",
city AS "ciudad"
FROM customers
WHERE address_line1 LIKE "%3%" AND city NOT LIKE "T%";

-- Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad. Unicamente en el caso que la dirección postal, posea algún número en dicho campo.

SELECT
customer_name AS "nombre de la empresa",
address_line1 AS "primera dirección",
city AS "ciudad"
FROM customers
WHERE address_line1 REGEXP "[0-9]" ;


-- EXTRAS

USE northwind;

-- Ciudades que empiezan con "A" o "B"

SELECT
City,
CompanyName,
ContactName
FROM Customers
WHERE city LIKE "A%" OR city LIKE "B%";

-- Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT
Customers.City,
Customers.CompanyName,
Customers.ContactName,
COUNT(DISTINCT Orders.OrderID) AS Numero_pedidos
FROM Customers
LEFT JOIN Orders
ON Orders.CustomerID = Customers.CustomerID
WHERE city LIKE "L%"
GROUP BY
Customers.City,
Customers.CompanyName,
Customers.ContactName
HAVING Numero_pedidos;

-- Todos los clientes cuyo "country" no incluya "Sales".

SELECT
ContactName,
ContactTitle,
CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE "%Sales%";

-- 



