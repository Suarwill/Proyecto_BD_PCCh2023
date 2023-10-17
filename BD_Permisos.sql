-- Creado mediante mariaDB
CREATE TABLE ciudadano 	(Rut VARCHAR(10) PRIMARY KEY NOT NULL, Nomb VARCHAR(30), Apel VARCHAR(30), Direc VARCHAR(30), Comuna VARCHAR(20), Telefono INT, Email VARCHAR(50) );
CREATE TABLE vehiculo 	(Patente VARCHAR(8) PRIMARY KEY NOT NULL, Tipo_veh VARCHAR(15), Marca VARCHAR(20), Año INT, Modelo VARCHAR(20), Color VARCHAR(20), rut_dueño VARCHAR(10), CONSTRAINT fkrutc FOREIGN KEY(rut_dueño) REFERENCES ciudadano(rut) ON DELETE CASCADE ON UPDATE CASCADE );
CREATE TABLE multa 	(Nro_multa INT PRIMARY KEY NOT NULL, Fecha_multa DATE, patente VARCHAR(8), Fecha_pago DATE, Estado VARCHAR(10), CONSTRAINT fkpatm FOREIGN KEY(patente) REFERENCES vehiculo(patente) ON DELETE CASCADE ON UPDATE CASCADE );
CREATE TABLE soap 	(Cod_soap INT PRIMARY KEY NOT NULL, patente VARCHAR(8), aseguradora VARCHAR(20), fecha_ini DATE, fecha_term DATE, valor_costo INT, CONSTRAINT fkpats FOREIGN KEY(patente) REFERENCES vehiculo(patente) ON DELETE CASCADE ON UPDATE CASCADE );
CREATE TABLE revision 	(Cod_revision INT PRIMARY KEY NOT NULL, patente VARCHAR(8), aprobacion VARCHAR(2), monto INT, CONSTRAINT fkpatr FOREIGN KEY(patente) REFERENCES vehiculo(patente) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE funcionario (rut VARCHAR(10) PRIMARY KEY NOT NULL, nomb VARCHAR(30), apel VARCHAR(30), direc VARCHAR(30), celular INT, tipo VARCHAR(20), modalidad VARCHAR(10), municipalidad VARCHAR(10) );
CREATE TABLE honorario 	(rut VARCHAR(10) PRIMARY KEY NOT NULL, Valor_hora INT, hora_entrada TIME, hora_salida TIME, CONSTRAINT fkrut FOREIGN KEY(rut) REFERENCES funcionario(rut) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE planta 	(rut VARCHAR(10) PRIMARY KEY NOT NULL, Sueldo INT, fecha_Ing DATE, Departamento VARCHAR(20), CONSTRAINT fkrut2 FOREIGN KEY(rut) REFERENCES funcionario(rut) ON DELETE CASCADE ON UPDATE CASCADE );
CREATE TABLE permiso 	(Cod_interno VARCHAR(15) PRIMARY KEY NOT NULL, patente VARCHAR(8), voucher_pago VARCHAR(15), monto INT, medio_pago VARCHAR(10), fecha_pago DATE, rut_funcionario VARCHAR(10), CONSTRAINT fkrutf FOREIGN KEY(rut_funcionario) REFERENCES funcionario(rut) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT fkpatv FOREIGN KEY(patente) REFERENCES vehiculo(patente) ON DELETE CASCADE ON UPDATE CASCADE );

-- Verificacion de las tablas creadas
DESC ciudadano;
DESC permiso;
DESC vehiculo;
DESC multa;
DESC soap;
DESC revision;
DESC funcionario;
DESC honorario;
DESC planta;

-- Insercion de datos "no reales"
INSERT INTO ciudadano VALUES 	('12345678-9', 'Maria', 'Gonzalez Rivera', 'Av Providencia 1234', 'Valparaiso', 985856363, 'mariagonzalez@gmail.com');
INSERT INTO ciudadano VALUES 	('23456789-0', 'Emily', 'Wilson Ferreira', 'Calle Los Pajaros 567', 'Quilpue', 978452369 , 'emily.wilson@yahoo.com');
INSERT INTO ciudadano VALUES 	('14567890-1', 'Lia', 'Bianca Jara', 'Pasaje San Martín 890', 'Cabildo', 988996535 , 'liatecari54@yahoo.com');
INSERT INTO ciudadano VALUES 	('18678901-2', 'Juan', 'Vargas Pomaire', 'Plaza de Armas 456', 'Quillota', 977452366, 'juan_termo99@gmail.com');
INSERT INTO ciudadano VALUES 	('9789012-3', 'Ariel', 'Ramirez Buin', 'Cno a la Montaña 789', 'Limache', 955236623, 'estrella4545@gmail.com');
INSERT INTO vehiculo VALUES 	('LR-7890', 'Camioneta', 'Chevrolet', 2019, 'Silverado', 'Negro', '12345678-9');
INSERT INTO vehiculo VALUES 	('ZK-4321', 'Sedán', 'Ford', 2020, 'Focus', 'Gris', '23456789-0');
INSERT INTO vehiculo VALUES 	('HW-5678', 'Motocicleta', 'Yamaha', 2022, 'MT-07', 'Azul', '14567890-1');
INSERT INTO vehiculo VALUES 	('DG-1234', 'SUV', 'Hyundai', 2018, 'Santa Fe', 'Verde', '18678901-2');
INSERT INTO vehiculo VALUES 	('YX-2468', 'Furgoneta', 'Volkswagen', 2017, 'Tracker', 'Rojo', '9789012-3');
INSERT INTO multa VALUES 	(00000000 , '0000-00-00', 'HW-5678', '0000-00-00', 'Cancelado');
INSERT INTO multa VALUES 	(00152635 , '2022-11-21', 'ZK-4321', '2022-11-29', 'Cancelado');
INSERT INTO multa VALUES 	(15226358 , '2022-10-16', 'LR-7890', '2022-12-13', 'Cancelado');
INSERT INTO multa VALUES 	(15148598 , '2022-06-28', 'YX-2468', '2022-12-19', 'Cancelado');
INSERT INTO multa VALUES 	(07898558 , '2022-11-30', 'DG-1234', '2022-12-03', 'Cancelado');
INSERT INTO soap VALUES 	(2023152698, 'LR-7890', 'BCI Seguros', '2023-04-01', '2024-03-31', 4990);
INSERT INTO soap VALUES 	(2023845694, 'HW-5678', 'RSA Seguros', '2023-04-01', '2024-03-31', 35800);
INSERT INTO soap VALUES 	(2023256325, 'ZK-4321', 'BCI Seguros', '2023-04-01', '2024-03-31', 5200);
INSERT INTO soap VALUES 	(2023121245, 'DG-1234', 'HDI Seguros', '2023-04-01', '2024-03-31', 6500);
INSERT INTO soap VALUES 	(2023032556, 'YX-2468', 'HDI Seguros', '2023-04-01', '2024-03-31', 7890);
INSERT INTO revision VALUES 	(230711526, 'LR-7890', 'SI', 13500);
INSERT INTO revision VALUES 	(230508526, 'ZK-4321', 'SI', 13500);
INSERT INTO revision VALUES 	(230313568, 'HW-5678', 'SI', 10500);
INSERT INTO revision VALUES 	(230415159, 'DG-1234', 'SI', 13500);
INSERT INTO revision VALUES 	(230525859, 'YX-2468', 'SI', 14700);

-- Insercion de mas datos, para su division en "Planta" y "Honorarios"
INSERT INTO funcionario VALUES 	('11725412-8', 'Juan', 'Perez Diaz', 'Av Brasil 789', 966457887, 'administrativo', 'honorario', 'Valparaiso');
INSERT INTO funcionario VALUES 	('18542263-3', 'Diego', 'Martinez Esquivel', 'Av Boromir 1256', 971714523, 'apoyo', 'honorario', 'Vina');
INSERT INTO funcionario VALUES 	('17584695-2', 'Marcelo', 'Rivas Reno', 'Cno Internacional 10562', 962568988, 'apoyo', 'honorario', 'Valparaiso');
INSERT INTO funcionario VALUES 	('12563986-1', 'Pascual', 'Perez Rocha', 'Pasaje Calbuco 26', 966635455, 'administrativo', 'honorario', 'Quillota');
INSERT INTO funcionario VALUES 	('8754125-3', 'Filomena', 'Diaz Tremonte', '13 Norte 121', 952236565, 'apoyo', 'honorario', 'Quillota');
INSERT INTO funcionario VALUES 	('16485487-8', 'Diego', 'Cabales Teno', 'Cantares 1345', 963625563, 'administrativo', 'planta', 'Limache');
INSERT INTO funcionario VALUES 	('17523623-4', 'Lucas', 'Rinn Tais', 'Alimares 2263', 969884588, 'administrativo', 'planta', 'Vina');
INSERT INTO funcionario VALUES 	('11725412-3', 'Teodoro', 'Marin Suazo', 'Av Brasil 1526', 934566652, 'coordinador', 'planta', 'Valparaiso');
INSERT INTO funcionario VALUES 	('10524623-2', 'Romina', 'Salas Rivas', 'Cno Costero 10524', 948495633, 'coordinador', 'planta', 'Quillota');
INSERT INTO funcionario VALUES 	('9485263-1', 'Antonio', 'Flores Paez', 'Volcanes 505', 978845454, 'coordinador', 'planta', 'Vina');
INSERT INTO honorario VALUES 	('11725412-8', 8500, '08:15:00', '14:15:00');
INSERT INTO honorario VALUES 	('18542263-3', 5900, '08:15:00', '13:15:00');
INSERT INTO honorario VALUES 	('17584695-2', 5900, '08:15:00', '13:15:00');
INSERT INTO honorario VALUES 	('8754125-3', 6300, '08:15:00', '13:15:00');
INSERT INTO honorario VALUES 	('12563986-1', 8500, '08:15:00', '14:15:00');

INSERT INTO planta VALUES 	('16485487-8', 742300, '2022-11-16', '');
INSERT INTO planta VALUES 	('17523623-4', 753520, '2022-07-25', '');
INSERT INTO planta VALUES 	('11725412-3', 1105600, '2021-05-03', 'Contabilidad');
INSERT INTO planta VALUES 	('10524623-2', 920560, '2021-06-15', 'Operaciones');
INSERT INTO planta VALUES 	('9485263-1', 950260, '2021-04-10', 'Logistica');
INSERT INTO permiso VALUES 	(2315262365245, 'LR-7890', 2632651245, 65800, 'efectivo', '2023-03-29', '11725412-8');
INSERT INTO permiso VALUES 	(2325221654568, 'ZK-4321', 1598569141, 31500, 'debito', '2023-03-15', '11725412-8');
INSERT INTO permiso VALUES 	(2354698216822, 'HW-5678', 1012568121, 37200, 'webpay', '2023-03-19', '17523623-4');
INSERT INTO permiso VALUES 	(2325663356225, 'DG-1234', 1956589823, 28600, 'webpay', '2023-03-21', '12563986-1');
INSERT INTO permiso VALUES 	(2312511125424, 'YX-2468', 2342565714, 72500, 'debito', '2023-03-21', '16485487-8');

-- Verificacion de los datos ingresados en las tablas
SELECT * FROM ciudadano;
SELECT * FROM permiso;
SELECT * FROM vehiculo;
SELECT * FROM multa;
SELECT * FROM soap;
SELECT * FROM revision;
SELECT * FROM funcionario;
SELECT * FROM honorario;
SELECT * FROM planta;

-- Tarea "actualizar un correo"
UPDATE ciudadano SET Email = 'liandomuebles@gmail.com' WHERE Rut = '14567890-1';
select * from ciudadano;

-- Tarea "Eliminar un registro"
DELETE FROM permiso WHERE Cod_interno = 2325663356225;
select * from permiso;

-- Busqueda de datos
SELECT 
 CONCAT(FORMAT(c.Rut, 0), '-', RIGHT(c.Rut, 1)) AS Rut,
 CONCAT(c.Nomb, ' ', c.Apel) AS Nombre,
 c.Telefono AS Telefono,
 v.Tipo_veh AS Tipo_de_Vehiculo,
 v.Marca AS Marca,
 v.Año AS Año,
 p.patente AS Patente,
 soap.aseguradora AS Nombre_de_Aseguradora,
 DATE_FORMAT(soap.fecha_term, '%d de %M de %Y') AS Fecha_de_Termino_SOAP,
 p.medio_pago AS Tipo_de_Pago,
 CONCAT('$', FORMAT(p.monto, 0)) AS Valor_de_Pago,
 p.medio_pago AS Forma_de_Pago
FROM permiso AS p 
JOIN vehiculo AS v ON p.patente = v.Patente
JOIN ciudadano AS c ON v.rut_dueño = c.Rut
LEFT JOIN soap ON p.patente = soap.patente
ORDER BY c.Rut ASC;

-- Busqueda: "Cantidad de vehiculos por tipo y su recaudacion"
SELECT 
 v.Tipo_veh AS Tipo_de_Vehiculo,
 COUNT(*) AS Cantidad_de_Vehiculos,
 CONCAT('$', FORMAT(SUM(p.monto), 0)) AS Total_Recaudado
FROM permiso AS p JOIN vehiculo AS v ON p.patente = v.Patente WHERE MONTH(p.fecha_pago) = 3
GROUP BY v.Tipo_veh ORDER BY v.Tipo_veh ASC;

-- Busqueda: "Estado de multas de Patente ingresada"
SELECT Fecha_multa AS Fecha_de_Cursado, Fecha_pago AS Fecha_de_Pago, Estado FROM multa WHERE patente = 'LR-7890';
