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
SELECT v.Tipo_veh AS Tipo_de_Vehiculo,
 COUNT(*) AS Cantidad_de_Vehiculos,
 CONCAT('$', FORMAT(SUM(p.monto), 0)) AS Total_Recaudado
 FROM permiso AS p JOIN vehiculo AS v ON p.patente = v.Patente WHERE MONTH(p.fecha_pago) = 3
 GROUP BY v.Tipo_veh ORDER BY v.Tipo_veh ASC;

-- Busqueda: "Estado de multas de Patente ingresada"
SELECT Fecha_multa AS Fecha_de_Cursado, Fecha_pago AS Fecha_de_Pago, Estado 
 FROM multa WHERE patente = 'LR-7890';
