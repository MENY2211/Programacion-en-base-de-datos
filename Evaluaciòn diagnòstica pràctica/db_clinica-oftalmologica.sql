CREATE DATABASE clinica_oftalmologica;
USE clinica_oftalmologica;

-- 1. Clínica (Tabla independiente)
CREATE TABLE Clinica (
    id_clinica INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);
INSERT INTO Clinica (id_clinica, nombre, direccion, telefono) VALUES 
(1, 'Clínica Ocular Central', 'Cunduacán, Tabasco', '914-123-4567'),
(2, 'Clínica Ocular Central', 'Villahermosa, Tabasco', '993-987-6543');


-- 2. Paciente (Agregamos la relación con Clínica)
CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nss VARCHAR(20) UNIQUE,
    id_clinica INT, -- Relación con Clínica
    FOREIGN KEY (id_clinica) REFERENCES Clinica(id_clinica)
);

-- 3. Médico (Tabla independiente)
CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) NOT NULL
);
INSERT INTO Paciente (id_paciente, nombre, apellido, nss, id_clinica) VALUES 
(1, 'Juan', 'Pérez', 'NSS001', 1), (2, 'María', 'García', 'NSS002', 2),
(3, 'Carlos', 'López', 'NSS003', 1), (4, 'Ana', 'Martínez', 'NSS004', 2),
(5, 'Luis', 'Rodríguez', 'NSS005', 1), (6, 'Elena', 'Sánchez', 'NSS006', 2),
(7, 'Roberto', 'Gómez', 'NSS007', 1), (8, 'Lucía', 'Díaz', 'NSS008', 2),
(9, 'Diego', 'Torres', 'NSS009', 1), (10, 'Sofía', 'Ruiz', 'NSS010', 2),
(11, 'Mateo', 'Hernández', 'NSS011', 1), (12, 'Ximena', 'Jiménez', 'NSS012', 2),
(13, 'Santiago', 'Moreno', 'NSS013', 1), (14, 'Valentina', 'Muñoz', 'NSS014', 2),
(15, 'Sebastián', 'Álvarez', 'NSS015', 1), (16, 'Natalia', 'Castillo', 'NSS016', 2),
(17, 'Leonardo', 'Vázquez', 'NSS017', 1), (18, 'Valeria', 'Castro', 'NSS018', 2),
(19, 'Daniel', 'Mendoza', 'NSS019', 1), (20, 'Camila', 'Reyes', 'NSS020', 2),
(21, 'Nicolás', 'Morales', 'NSS021', 1), (22, 'Fernanda', 'Palacios', 'NSS022', 2),
(23, 'Samuel', 'Ortiz', 'NSS023', 1), (24, 'Victoria', 'Gutiérrez', 'NSS024', 2),
(25, 'Julián', 'Bravo', 'NSS025', 1), (26, 'Isabella', 'Soto', 'NSS026', 2),
(27, 'Gabriel', 'Cortés', 'NSS027', 1), (28, 'Daniela', 'Delgado', 'NSS028', 2),
(29, 'Adrián', 'Vega', 'NSS029', 1), (30, 'Gabriela', 'Marín', 'NSS030', 2),
(31, 'Bruno', 'Blanco', 'NSS031', 1), (32, 'Mariana', 'Cabrera', 'NSS032', 2),
(33, 'Hugo', 'Calvo', 'NSS033', 1), (34, 'Paulina', 'Peña', 'NSS034', 2),
(35, 'Álvaro', 'León', 'NSS035', 1), (36, 'Alejandra', 'Molina', 'NSS036', 2),
(37, 'Ignacio', 'Salazar', 'NSS037', 1), (38, 'Renata', 'Campos', 'NSS038', 2),
(39, 'Emiliano', 'Guerrero', 'NSS039', 1), (40, 'Regina', 'Fuentes', 'NSS040', 2),
(41, 'Isaac', 'Carrillo', 'NSS041', 1), (42, 'Jimena', 'Mora', 'NSS042', 2),
(43, 'Matías', 'Pascual', 'NSS043', 1), (44, 'Pau', 'Serrano', 'NSS044', 2),
(45, 'Lucas', 'Ramos', 'NSS045', 1), (46, 'Sara', 'Vargas', 'NSS046', 2),
(47, 'Gael', 'Ibarra', 'NSS047', 1), (48, 'Aitana', 'Santana', 'NSS048', 2),
(49, 'Felipe', 'Suárez', 'NSS049', 1), (50, 'Micaela', 'Ferrer', 'NSS050', 2);

INSERT INTO Medico (id_medico, nombre, apellido, especialidad, cedula) VALUES 
(1, 'Dr. José', 'López', 'Cirujano Refractivo', 'CED001'),
(2, 'Dra. Beatriz', 'Luna', 'Especialista Lentes', 'CED002');

-- 4. Tratamiento (Tabla independiente)
CREATE TABLE Tratamiento (
    id_tratamiento INT PRIMARY KEY,
    tipo_tratamiento VARCHAR(50) NOT NULL,
    inicio_tratamiento DATE,  
    fin_tratamiento DATE 
);
INSERT INTO Tratamiento (id_tratamiento, tipo_tratamiento, inicio_tratamiento, fin_tratamiento) VALUES 
(1, 'Láser Excimer', '2026-03-01', '2026-03-15'), (2, 'Lente Monofocal', '2026-03-02', '2026-03-20'),
(3, 'Láser Femtosegundo', '2026-03-03', '2026-03-10'), (4, 'Lente Multifocal', '2026-03-04', '2026-03-25'),
(5, 'Láser Lasik', '2026-03-05', '2026-03-12'), (6, 'Lente Tórico', '2026-03-06', '2026-03-30'),
(7, 'Láser PRK', '2026-03-07', '2026-03-14'), (8, 'Lente Fáquico', '2026-03-08', '2026-03-22'),
(9, 'Láser SMILE', '2026-03-09', '2026-03-16'), (10, 'Lente Trifocal', '2026-03-10', '2026-03-28'),
(11,'Láser','2026-04-01','2026-04-05'), (12,'Lente','2026-04-01','2026-04-10'),
(13,'Láser','2026-04-02','2026-04-06'), (14,'Lente','2026-04-02','2026-04-11'),
(15,'Láser','2026-04-03','2026-04-07'), (16,'Lente','2026-04-03','2026-04-12'),
(17,'Láser','2026-04-04','2026-04-08'), (18,'Lente','2026-04-04','2026-04-13'),
(19,'Láser','2026-04-05','2026-04-09'), (20,'Lente','2026-04-05','2026-04-14'),
(21,'Láser','2026-04-06','2026-04-10'), (22,'Lente','2026-04-06','2026-04-15'),
(23,'Láser','2026-04-07','2026-04-11'), (24,'Lente','2026-04-07','2026-04-16'),
(25,'Láser','2026-04-08','2026-04-12'), (26,'Lente','2026-04-08','2026-04-17'),
(27,'Láser','2026-04-09','2026-04-13'), (28,'Lente','2026-04-09','2026-04-18'),
(29,'Láser','2026-04-10','2026-04-14'), (30,'Lente','2026-04-10','2026-04-19'),
(31,'Láser','2026-04-11','2026-04-15'), (32,'Lente','2026-04-11','2026-04-20'),
(33,'Láser','2026-04-12','2026-04-16'), (34,'Lente','2026-04-12','2026-04-21'),
(35,'Láser','2026-04-13','2026-04-17'), (36,'Lente','2026-04-13','2026-04-22'),
(37,'Láser','2026-04-14','2026-04-18'), (38,'Lente','2026-04-14','2026-04-23'),
(39,'Láser','2026-04-15','2026-04-19'), (40,'Lente','2026-04-15','2026-04-24'),
(41,'Láser','2026-04-16','2026-04-20'), (42,'Lente','2026-04-16','2026-04-25'),
(43,'Láser','2026-04-17','2026-04-21'), (44,'Lente','2026-04-17','2026-04-26'),
(45,'Láser','2026-04-18','2026-04-22'), (46,'Lente','2026-04-18','2026-04-27'),
(47,'Láser','2026-04-19','2026-04-23'), (48,'Lente','2026-04-19','2026-04-28'),
(49,'Láser','2026-04-20','2026-04-24'), (50,'Lente','2026-04-20','2026-04-29');

-- 5. Cirugia (Corregido el nombre de la referencia a Tratamiento)
CREATE TABLE Cirugia (
    id_cirugia INT PRIMARY KEY,
    fecha_cirugia DATE NOT NULL,
    id_medico INT,
    id_paciente INT,
    id_tratamiento INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento) -- Corregido: Singular
);
INSERT INTO Cirugia (id_cirugia, fecha_cirugia, id_medico, id_paciente, id_tratamiento) VALUES 
(1,'2026-03-10',1,1,1), (2,'2026-03-11',2,2,2), (3,'2026-03-12',1,3,3), (4,'2026-03-13',2,4,4),
(5,'2026-03-14',1,5,5), (6,'2026-03-15',2,6,6), (7,'2026-03-16',1,7,7), (8,'2026-03-17',2,8,8),
(9,'2026-03-18',1,9,9), (10,'2026-03-19',2,10,10), (11,'2026-04-10',1,11,11), (12,'2026-04-10',2,12,12),
(13,'2026-04-11',1,13,13), (14,'2026-04-11',2,14,14), (15,'2026-04-12',1,15,15), (16,'2026-04-12',2,16,16),
(17,'2026-04-13',1,17,17), (18,'2026-04-13',2,18,18), (19,'2026-04-14',1,19,19), (20,'2026-04-14',2,20,20),
(21,'2026-04-15',1,21,21), (22,'2026-04-15',2,22,22), (23,'2026-04-16',1,23,23), (24,'2026-04-16',2,24,24),
(25,'2026-04-17',1,25,25), (26,'2026-04-17',2,26,26), (27,'2026-04-18',1,27,27), (28,'2026-04-18',2,28,28),
(29,'2026-04-19',1,29,29), (30,'2026-04-19',2,30,30), (31,'2026-04-20',1,31,31), (32,'2026-04-20',2,32,32),
(33,'2026-04-21',1,33,33), (34,'2026-04-21',2,34,34), (35,'2026-04-22',1,35,35), (36,'2026-04-22',2,36,36),
(37,'2026-04-23',1,37,37), (38,'2026-04-23',2,38,38), (39,'2026-04-24',1,39,39), (40,'2026-04-24',2,40,40),
(41,'2026-04-25',1,41,41), (42,'2026-04-25',2,42,42), (43,'2026-04-26',1,43,43), (44,'2026-04-26',2,44,44),
(45,'2026-04-27',1,45,45), (46,'2026-04-27',2,46,46), (47,'2026-04-28',1,47,47), (48,'2026-04-28',2,48,48),
(49,'2026-04-29',1,49,49), (50,'2026-04-29',2,50,50);
-- 6. Tablas ISA (Especialización)
CREATE TABLE Cirugia_laser (
    id_cirugia INT PRIMARY KEY,
    tipo_laser VARCHAR(50),
    FOREIGN KEY (id_cirugia) REFERENCES Cirugia(id_cirugia)
);
INSERT INTO Cirugia_laser (id_cirugia, tipo_laser) VALUES 
(1,'Excimer'), (3,'Femtosegundo'), (5,'Lasik'), (7,'PRK'), (9,'SMILE'),
(11,'Excimer'), (13,'Lasik'), (15,'PRK'), (17,'SMILE'), (19,'Femtosegundo'),
(21,'Excimer'), (23,'Lasik'), (25,'PRK'), (27,'SMILE'), (29,'Femtosegundo'),
(31,'Excimer'), (33,'Lasik'), (35,'PRK'), (37,'SMILE'), (39,'Femtosegundo'),
(41,'Excimer'), (43,'Lasik'), (45,'PRK'), (47,'SMILE'), (49,'Femtosegundo');
CREATE TABLE Cirugia_intraocular (
    id_cirugia INT PRIMARY KEY,
    tipo_lente VARCHAR(50),
    FOREIGN KEY (id_cirugia) REFERENCES Cirugia(id_cirugia)
);
INSERT INTO Cirugia_intraocular (id_cirugia, tipo_lente) VALUES 
(2,'Monofocal'), (4,'Multifocal'), (6,'Tórico'), (8,'Fáquico'), (10,'Trifocal'),
(12,'Monofocal'), (14,'Multifocal'), (16,'Tórico'), (18,'Fáquico'), (20,'Trifocal'),
(22,'Monofocal'), (24,'Multifocal'), (26,'Tórico'), (28,'Fáquico'), (30,'Trifocal'),
(32,'Monofocal'), (34,'Multifocal'), (36,'Tórico'), (38,'Fáquico'), (40,'Trifocal'),
(42,'Monofocal'), (44,'Multifocal'), (46,'Tórico'), (48,'Fáquico'), (50,'Trifocal');
