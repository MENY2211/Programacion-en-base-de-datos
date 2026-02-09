-- 1. Listar a los pacientes, las cirugías y los que fueron atendidos en Villahermosa y Cunduacán
SELECT p.id_paciente,p.nombre,p.apellido,c.direccion AS clinica_ubicacion,
    ci.id_cirugia,ci.fecha_cirugia
FROM Paciente p JOIN Clinica c ON p.id_clinica = c.id_clinica
JOIN Cirugia ci ON p.id_paciente = ci.id_paciente
ORDER BY p.id_paciente ASC;

-- 2.- Consulta para agrupar y contar cuántas cirugías hay en cada tabla ISA
SELECT 'Cirugía Láser' AS Tipo, COUNT(*) AS Total FROM Cirugia_laser
UNION
SELECT 'Cirugía Intraocular', COUNT(*) FROM Cirugia_intraocular;

-- 3.- Búsqueda de pacientes atendidos específicamente por el Dr. Jose López
SELECT p.nombre AS Paciente,  p.apellido, m.nombre AS Medico, ci.fecha_cirugia
FROM Paciente p JOIN Cirugia ci ON p.id_paciente = ci.id_paciente
JOIN Medico m ON ci.id_medico = m.id_medico
WHERE m.nombre LIKE 'Dr. José%';

-- 4.- Listar pacientes que recibieron tipos específicos de lentes intraoculares
SELECT p.nombre, p.apellido, cio.tipo_lente
FROM Paciente p JOIN Cirugia ci ON p.id_paciente = ci.id_paciente
JOIN Cirugia_intraocular cio ON ci.id_cirugia = cio.id_cirugia
WHERE cio.tipo_lente IN ('Monofocal', 'Trifocal');


-- 5. Reporte de cirugías realizadas en marzo de 2026 mostrando el nombre del paciente
SELECT ci.id_cirugia, ci.fecha_cirugia, p.nombre, p.apellido
FROM Cirugia ci JOIN Paciente p ON ci.id_paciente = p.id_paciente
WHERE ci.fecha_cirugia BETWEEN '2026-03-01' AND '2026-03-31'
ORDER BY ci.fecha_cirugia DESC;