-- Desarrolle una función que permita estimar la cantidad de personas que tiene más de un permiso.
DELIMITER //

CREATE FUNCTION PermisosPorPersona() RETURNS INT
BEGIN
    DECLARE contador INT;
    
    SELECT COUNT(DISTINCT Rut) INTO contador
    FROM (
            SELECT c.Rut, COUNT(p.patente) AS Cantidad_de_Permisos
            FROM ciudadano c
            JOIN vehiculo v ON c.rut = v.rut_dueño
            JOIN permiso p ON v.patente = p.patente
            GROUP BY c.Rut HAVING COUNT(v.patente) = 1
    ) AS permisos_por_persona;
    
    RETURN contador;
END //

-- Llamar a la funcion
SELECT PermisosPorPersona() AS Cantidad_Personas_Con_Mas_De_Un_Permiso;