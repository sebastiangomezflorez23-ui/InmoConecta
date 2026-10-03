USE InmoConecta_Avance1;
GO
SET NOCOUNT ON;
SELECT p.titulo, u.nombre AS agente, p.estado FROM dbo.Propiedad p JOIN dbo.Usuario u ON u.id=p.propietarioId;
SELECT titulo FROM dbo.Propiedad WHERE estado='APROBADA';
IF (SELECT COUNT(*) FROM dbo.Usuario WHERE correo IN ('ana@example.com','luis@example.com')) <> 2 THROW 51000, 'Faltan usuarios demo', 1;
IF (SELECT COUNT(*) FROM dbo.Propiedad WHERE titulo IN (N'DEMO Apartamento',N'DEMO Casa',N'DEMO Local')) <> 3 THROW 51000, 'Faltan propiedades demo', 1;
IF NOT EXISTS(SELECT 1 FROM dbo.Propiedad WHERE titulo=N'DEMO Casa' AND estado='PENDIENTE') THROW 51000, 'Estado predeterminado incorrecto', 1;
BEGIN TRY
 INSERT dbo.Usuario(nombre,apellido,telefono,correo,passwordHash,rol) VALUES(N'Prueba',N'Duplicado','0','ana@example.com','DEMO','AGENTE');
 THROW 51000, 'No se rechazó correo duplicado', 1;
END TRY
BEGIN CATCH
 IF ERROR_NUMBER() NOT IN (2601,2627) THROW;
 PRINT 'OK: correo duplicado rechazado';
END CATCH;
BEGIN TRY
 INSERT dbo.Propiedad(propietarioId,titulo,descripcion,precio,operacion,tipoInmueble,habitaciones,banos,direccion)
 VALUES(-1,N'Prueba',N'Prueba',100,'VENTA','CASA',1,1,N'Prueba');
 THROW 51000, 'No se rechazó propietario inexistente', 1;
END TRY
BEGIN CATCH
 IF ERROR_NUMBER() <> 547 THROW;
 PRINT 'OK: propietario inexistente rechazado';
END CATCH;
BEGIN TRY
 DECLARE @id INT=(SELECT id FROM dbo.Usuario WHERE correo='ana@example.com');
 INSERT dbo.Propiedad(propietarioId,titulo,descripcion,precio,operacion,tipoInmueble,habitaciones,banos,direccion)
 VALUES(@id,N'Prueba',N'Prueba',-1,'VENTA','CASA',1,1,N'Prueba');
 THROW 51000, 'No se rechazó precio negativo', 1;
END TRY
BEGIN CATCH
 IF ERROR_NUMBER() <> 547 THROW;
 PRINT 'OK: precio negativo rechazado';
END CATCH;
PRINT 'OK: verificaciones terminadas';
GO
