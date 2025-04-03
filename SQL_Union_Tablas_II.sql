USE tienda;

-- Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).

SELECT
employees.employee_number AS "ID empleado",
employees.last_name AS "Apellido empleado",
employees.first_name AS "Nombre empleado",
customers.customer_number AS "ID cliente"
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).

SELECT
customers.customer_number AS "ID cliente",
employees.last_name AS "Apellido empleado",
employees.first_name AS "Nombre empleado"
FROM employees
RIGHT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.

SELECT
employees.employee_number AS ID_empleado,
employees.last_name AS Apellido_empleado,
employees.first_name AS Nombre_empleado,
COUNT(customers.customer_number) AS Total_clientes
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY 
employees.employee_number,
employees.last_name,
employees.first_name
HAVING Total_clientes > 8 ;

-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.

SELECT
employees.employee_number AS ID_empleado,
employees.last_name AS Apellido_empleado,
employees.first_name AS Nombre_empleado,
COUNT(customers.customer_number) AS Total_clientes
FROM customers 
RIGHT JOIN employees  
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY 
employees.employee_number,
employees.last_name,
employees.first_name
HAVING Total_clientes > 8 ;

-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.

SELECT
employees.first_name AS Nombre_empleado,
employees.last_name AS Apellido_empleado,
COUNT(customers.country) AS Total_paises
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY 
employees.last_name,
employees.first_name
HAVING Total_paises > 1 ;

-- EJERCICIOS EXTRAS

USE Northwind;

-- Empleadas que sean de la misma ciudad:

SELECT
empleadas.City AS Ciudad_empleada,
empleadas.FirstName AS Nombre_empleada,
empleadas.LastName AS Apellido_empleada,
jefas.City AS Ciudad_jefa,
jefas.FirstName AS Nombre_jefa,
jefas.LastName AS Apellido_jefa
FROM Employees AS empleadas, Employees AS jefas
WHERE empleadas.EmployeeID <> jefas.EmployeeID
AND jefas.EmployeeID = empleadas.ReportsTo;

-- Respuestas El jefe es Andrew Fuller

-- El equipo de marketing necesita una lista con todas las categorías de productos, incluso si no tienen productos asociados. 

SELECT
Categories.CategoryName,
Products.ProductName
FROM Products
LEFT JOIN Categories
ON Products.CategoryID = Categories.CategoryID; 


SELECT
Categories.CategoryName,
Products.ProductName
FROM Categories
RIGHT JOIN Products
ON Products.CategoryID = Categories.CategoryID; 

-- Respuesta: se puede usar tanto Right com left porque no hay valores nulos en ninguna de las dos columnas


-- lista de todos los pedidos junto con los datos de las empresas clientes
SELECT
Orders.OrderID,
Customers.*
FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

-- Queremos obtener una lista con todas las empleadas y, si han gestionado pedidos, mostrar los detalles del pedido.

SELECT
Employees.EmployeeID,
Employees.LastName,
Employees.FirstName,
Orders.*
FROM Employees
LEFT JOIN Orders
ON Orders.EmployeeID = Employees.EmployeeID;

-- Lista de todos los transportistas (shippers) y los pedidos que han enviado. Queremos asegurarnos de incluir todos los transportistas, incluso si no han enviado pedidos.

SELECT
Shippers.ShipperID,
Orders.OrderID
FROM Shippers
LEFT JOIN Orders
ON Shippers.ShipperID = Orders.ShipVia;

