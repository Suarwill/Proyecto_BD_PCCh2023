-- Creado mediante mariaDB
CREATE TABLE ciudadano 	(Rut VARCHAR(10) PRIMARY KEY NOT NULL, Nomb VARCHAR(30), Apel VARCHAR(30), Direc VARCHAR(30), Comuna VARCHAR(20), Telefono INT, Email VARCHAR(50) );
CREATE TABLE vehiculo 	(Patente VARCHAR(8) PRIMARY KEY NOT NULL, Tipo_veh VARCHAR(15), Marca VARCHAR(20), Año INT, Modelo VARCHAR(20), Color VARCHAR(20), rut_dueño VARCHAR(10), 
    CONSTRAINT fkrutc FOREIGN KEY(rut_dueño) REFERENCES ciudadano(rut) ON DELETE CASCADE ON UPDATE CASCADE );
CREATE TABLE multa 	(Nro_multa INT PRIMARY KEY NOT NULL, Fecha_multa DATE, patente VARCHAR(8), Fecha_pago DATE, Estado VARCHAR(10), 
    CONSTRAINT fkpatm FOREIGN KEY(patente) REFERENCES vehiculo(patente) ON DELETE CASCADE ON UPDATE CASCADE );
CREATE TABLE soap 	(Cod_soap INT PRIMARY KEY NOT NULL, patente VARCHAR(8), aseguradora VARCHAR(20), fecha_ini DATE, fecha_term DATE, valor_costo INT, 
    CONSTRAINT fkpats FOREIGN KEY(patente) REFERENCES vehiculo(patente) ON DELETE CASCADE ON UPDATE CASCADE );
CREATE TABLE revision 	(Cod_revision INT PRIMARY KEY NOT NULL, patente VARCHAR(8), aprobacion VARCHAR(2), monto INT, 
    CONSTRAINT fkpatr FOREIGN KEY(patente) REFERENCES vehiculo(patente) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE funcionario (rut VARCHAR(10) PRIMARY KEY NOT NULL, nomb VARCHAR(30), apel VARCHAR(30), direc VARCHAR(30), celular INT, tipo VARCHAR(20), modalidad VARCHAR(10), municipalidad VARCHAR(10) );
CREATE TABLE honorario 	(rut VARCHAR(10) PRIMARY KEY NOT NULL, Valor_hora INT, hora_entrada TIME, hora_salida TIME, 
    CONSTRAINT fkrut  FOREIGN KEY(rut) REFERENCES funcionario(rut) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE planta 	(rut VARCHAR(10) PRIMARY KEY NOT NULL, Sueldo INT, fecha_Ing DATE, Departamento VARCHAR(20), 
    CONSTRAINT fkrut2 FOREIGN KEY(rut) REFERENCES funcionario(rut) ON DELETE CASCADE ON UPDATE CASCADE );
CREATE TABLE permiso 	(Cod_interno VARCHAR(15) PRIMARY KEY NOT NULL, patente VARCHAR(8), voucher_pago VARCHAR(15), monto INT, medio_pago VARCHAR(10), fecha_pago DATE, rut_funcionario VARCHAR(10), 
    CONSTRAINT fkrutf FOREIGN KEY(rut_funcionario) REFERENCES funcionario(rut) ON DELETE CASCADE ON UPDATE CASCADE, 
    CONSTRAINT fkpatv FOREIGN KEY(patente) REFERENCES vehiculo(patente) ON DELETE CASCADE ON UPDATE CASCADE );