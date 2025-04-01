-- Crear la base de datos
CREATE DATABASE bbdd_empleadas_join;

-- Usar la base de datos
USE bbdd_empleadas_join;

-- Crear la tabla 'empleadas'
CREATE TABLE empleadas (
    id_empleada INT PRIMARY KEY,
    salario DECIMAL(10, 2),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    pais VARCHAR(50)
);

-- Insertar datos en la tabla 'empleadas'
INSERT INTO empleadas (id_empleada, salario, nombre, apellido, pais) VALUES
(1, 2500, 'Ana', 'González', 'España'),
(2, 4000, 'Maria', 'López', 'España'),
(3, 3000, 'Lucía', 'Ramos', 'España'),
(5, 1500, 'Rocío', 'García', 'Francia');

-- Crear la tabla 'empleadas_en_proyectos' como independiente
CREATE TABLE empleadas_en_proyectos (
    id_empleada INT,  
    id_proyecto INT,
    PRIMARY KEY (id_empleada, id_proyecto)  
);

-- Insertar datos en la tabla 'empleadas_en_proyectos'
INSERT INTO empleadas_en_proyectos (id_empleada, id_proyecto) VALUES
(2, 1), 
(3, 2), 
(5, 3), 
(4, 4); 