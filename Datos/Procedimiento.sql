-- Procedimiento de aumento salarial del 5% a los empleados de Planta
CREATE PROCEDURE Ajuste_salarial AS
BEGIN
    UPDATE planta SET sueldo=sueldo+(sueldo*0.05)
END;

-- Ejecutar el Procedimiento de Aumento
EXEC Ajuste_salarial;
