-- Tarea "actualizar un correo"
UPDATE ciudadano SET Email = 'liandomuebles@gmail.com' WHERE Rut = '14567890-1';
select * from ciudadano;

-- Tarea "Eliminar un registro"
DELETE FROM permiso WHERE Cod_interno = 2325663356225;
select * from permiso;