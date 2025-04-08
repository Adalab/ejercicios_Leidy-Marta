USE tienda;


-- Calcula el numero de clientes por cada ciudad.

SELECT
city,
COUNT(DISTINCT customer_number) AS num_clientes
FROM customers
GROUP BY city;

-- Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.

SELECT
city,
COUNT(DISTINCT customer_number) AS num_clientes
FROM customers
GROUP BY
city
ORDER BY num_clientes DESC
LIMIT 1;


-- Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.

SELECT
customer_number,
contact_first_name,
contact_last_name
FROM customers
WHERE city IN (
	SELECT
	city
	FROM (
    SELECT
    city,
    COUNT(DISTINCT customer_number) AS num_clientes
    FROM customers
	GROUP BY
	city
	ORDER BY num_clientes DESC
	LIMIT 1
) AS sub
    );


-- Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'

SELECT
employee_number,
first_name AS nombre_empleado,
last_name AS apellido_empleado
FROM employees
WHERE employee_number IN (
	SELECT sales_rep_employee_number
	FROM customers);
    
    
-- Ciudades con clientes pero sin oficinas

SELECT DISTINCT
city AS ciudad,
customer_name AS Nombre_empresa
FROM customers
WHERE city NOT IN (
	SELECT city
	FROM offices);    
    
    
USE northwind;

-- Extraed los pedidos con el máximo "order_date" para cada empleado.

SELECT
OrderID,
CustomerID,
EmployeeID,
OrderDate,
RequiredDate
FROM Orders AS e1 -- creamos un alias para poder hacer referencia a esta tabla en concreto dentro de la subconsulta
WHERE OrderDate IN (
	SELECT
    MAX(OrderDate)
	FROM Orders 
    WHERE EmployeeID = e1.EmployeeID ); -- Esto es como decir: quiero que me busques la fecha máxima cuando EmployeeID = el empleado con ID 5. Pero para que nos lo haga de cada uno de los empleados pondremos e1.EmployeeID, haciendo referencia a la consulta madre
    
    
-- Extraed información de los productos "Beverages"

   SELECT 
   ProductID,
   ProductName,
   CategoryID
   FROM Products
   WHERE CategoryID IN (
   SELECT CategoryID
   FROM Categories
   WHERE CategoryName = "Beverages");
   
   
-- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país

SELECT DISTINCT
Country
FROM Customers
WHERE Country NOT IN (
SELECT Country
FROM Suppliers);

-- Extraer los clientes que compraron mas de 20 artículos "Grandma's Boysenberry Spread"

SELECT
OrderID,
CustomerID
FROM Orders
WHERE OrderID IN (
	SELECT OrderID
	FROM Orderdetails
	WHERE Quantity > 20 AND ProductID IN (
		SELECT ProductID
		FROM Products
		WHERE ProductName = "Grandma's Boysenberry Spread"));
        
        
-- Qué producto es más popular: Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró.

SELECT DISTINCT
ProductID,
SUM(Quantity) AS total
FROM orderdetails
GROUP BY ProductID
ORDER BY total DESC
LIMIT 1;


    -- HAcer repaso - Bases de datos 2


