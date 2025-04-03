USE tienda;

-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.

SELECT 
employees.employee_number, 
employees.first_name, 
employees.last_name,
customers.customer_number
FROM employees
CROSS JOIN customers;


-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.

SELECT 
employees.employee_number, 
employees.first_name, 
employees.last_name
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY 
employees.employee_number
HAVING COUNT(*) > 8;

-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.

SELECT 
employees.first_name, 
employees.last_name
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY 
employees.employee_number
HAVING COUNT(DISTINCT customers.country) > 1;

-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.

SELECT 
employees.employee_number, 
employees.first_name, 
employees.last_name,
customers.customer_number
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;


-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.

SELECT 
employees.employee_number, 
employees.first_name, 
employees.last_name
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY 
employees.employee_number
HAVING COUNT(*) > 8;

-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.

SELECT 
employees.first_name, 
employees.last_name
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY 
employees.employee_number
HAVING COUNT(DISTINCT customers.country) > 1;