-- Desarrolle un procedimiento almacenado que cargue tipos de vehículos y los presente en una vista de usuario.
DELIMITER //
CREATE PROCEDURE TiposVehiculos()
BEGIN
    SELECT DISTINCT Tipo_veh FROM vehiculo;     -- Mostrar datos unicos y distintos entre si
END //

-- Ejecutar el Procedimiento de tipo de vehiculos
CALL TiposVehiculos();

-- Desarrolle un procedimiento almacenado que presente al personal de planta y a contrata.
DELIMITER //
CREATE PROCEDURE MostrarPersonal()
BEGIN
    SELECT nomb AS Nombre, apel AS Apellido, modalidad AS Modalidad FROM funcionario WHERE modalidad='planta';     -- Mostrar el personal de PLANTA
    SELECT nomb AS Nombre, apel AS Apellido, modalidad AS Modalidad FROM funcionario WHERE modalidad='honorario';  -- Mostrar el personal de HONORARIO
END //

-- Ejecutar el Procedimiento de personal
CALL MostrarPersonal();

-- Desarrolle un procedimiento almacenado que estime el precio del permiso de circulación para el próximo año, sabiendo que el ipc = 8%.
DELIMITER //
CREATE PROCEDURE AjustePrecioIPC (IN aumento INT)
BEGIN
    UPDATE permiso SET monto = monto * (1+aumento/100); -- Aumentar 8%
    SELECT * FROM permiso;                              -- Mostrar los precios ya aumentados
END //

-- Ejecutar el Procedimiento de IPC
CALL AjustePrecioIPC;