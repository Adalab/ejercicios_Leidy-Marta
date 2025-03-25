CREATE SCHEMA IF NOT EXISTS mi_ejercicio;
USE mi_ejercicio;

CREATE TABLE IF NOT EXISTS empleadas (
    id_empleada INT,
    salario FLOAT,
    nombre VARCHAR (50),
    apellido VARCHAR (50)
    PRIMARY KEY (id_empleada)
);

CREATE TABLE IF NOT EXISTS personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT,
    ciudad varchar(255) DEFAULT 'Madrid',
    CONSTRAINT mayor_edad CHECK (edad>16)
);


CREATE TABLE IF NOT EXISTS empleadas_en_proyectos (
    id_empleada INT NOT NULL,
    id_proyecto INT NOT NULL,
    PRIMARY KEY (id_proyecto),
    CONSTRAINT fk_empleadas_en_proyecto FOREIGN KEY (id_empleada)
    REFERENCES empleadas (id_empleada) ON DELETE CASCADE 
    
);



    