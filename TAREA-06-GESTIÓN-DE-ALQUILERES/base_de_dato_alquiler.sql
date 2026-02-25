-- Creación de la Base de Datos
CREATE DATABASE `actividada-6`;
USE `actividada-6`;

-- 1. Tabla Propietario
CREATE TABLE Propietario (
    id_propietario VARCHAR(20) PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT,
    banco VARCHAR(50),
    metodo_pago VARCHAR(50)
);

-- 2. Tabla Vivienda
CREATE TABLE Vivienda (
    id_vivienda VARCHAR(20) PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL,
    num_vivienda VARCHAR(10),
    id_propietario VARCHAR(20),
    FOREIGN KEY (id_propietario) REFERENCES Propietario(id_propietario)
);

-- 3. Tabla Inquilino
CREATE TABLE Inquilino (
    id_inquilino VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT,
    num_inquilino VARCHAR(20),
    historial_pago TEXT
);

-- 4. Tabla Alquiler
CREATE TABLE Alquiler (
    id_alquiler VARCHAR(20) PRIMARY KEY,
    id_vivienda VARCHAR(20),
    id_inquilino VARCHAR(20),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    registro_pago DECIMAL(10,2),
    FOREIGN KEY (id_vivienda) REFERENCES Vivienda(id_vivienda),
    FOREIGN KEY (id_inquilino) REFERENCES Inquilino(id_inquilino),
);

-- 5. Tabla Contrato
CREATE TABLE Contrato (
    id_contrato VARCHAR(20) PRIMARY KEY,
    id_propietario VARCHAR(20),
    id_vivienda VARCHAR(20),
    id_alquiler VARCHAR(20),
    monto_total DECIMAL(10,2),
    FOREIGN KEY (id_propietario) REFERENCES Propietario(id_propietario),
    FOREIGN KEY (id_vivienda) REFERENCES Vivienda(id_vivienda),
    FOREIGN KEY (id_alquiler) REFERENCES Alquiler(id_alquiler)
);


-- 6. Especialización: Renovación de Contrato
CREATE TABLE renova_c (
    id_contratoR VARCHAR(20) PRIMARY KEY,
    id_contrato_anterior VARCHAR(20),
    FOREIGN KEY (id_contratoR) REFERENCES Contrato(id_contrato),
    FOREIGN KEY (id_contrato_anterior) REFERENCES Contrato(id_contrato)
);

-- 7. Especialización: Nuevo Contrato
CREATE TABLE nuevo_c (
    id_contratoN VARCHAR(20) PRIMARY KEY,
    monto_deposito DECIMAL(10,2),
    FOREIGN KEY (id_contratoN) REFERENCES Contrato(id_contrato)
);
