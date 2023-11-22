-- Desarrolle un trigger que permita controlar la cantidad de permisos de circulación rechazados.
-- Creamos un procedimiento que muestre los rechazados en revision
DELIMITER //
CREATE PROCEDURE  VerRechazados()
BEGIN
	SELECT COUNT(*) AS Cantidad_de_Rechazados
	FROM permiso p
    JOIN revision r ON p.patente = r.patente
	WHERE r.aprobacion != 'SI';
END //
-- Creamos el trigger que llame el procedimiento cada vez que ingresamos un dato en permiso
DELIMITER //
CREATE TRIGGER ControlRechazados
AFTER INSERT ON permiso FOR EACH ROW
BEGIN
    CALL VerRechazados();
END //

-- Desarrolle un trigger que permita controlar la cantidad de permisos emitidos por el personal de planta.
DELIMITER //

CREATE TRIGGER PermisosEmitidosPlanta
AFTER INSERT ON permiso FOR EACH ROW
BEGIN
    DECLARE cantidadPermisosPlanta INT;
    
    SELECT COUNT(*) INTO cantidadPermisosPlanta
    FROM permiso p
    JOIN funcionario f ON p.rut_funcionario = f.rut WHERE f.tipo = 'planta';
    
    IF cantidadPermisosPlanta > 1 THEN
        INSERT INTO LogAuditoria (mensaje) VALUES (CONCAT('La cantidad de permisos ingresados por personal de PLANTA es = ', cantidadPermisosPlanta));
    END IF;
END //

-- Desarrolle un trigger que permita respaldar en un histórico con los clientes que están vigentes y los rechazados por problemas técnicos durante el proceso de validación del permiso.

