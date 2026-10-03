USE InmoConecta_Avance1;
GO
SET XACT_ABORT ON;
BEGIN TRANSACTION;
-- Marcador NO apto para autenticación. No representa una contraseña real.
IF NOT EXISTS (SELECT 1 FROM dbo.Usuario WHERE correo=N'ana@example.com')
 INSERT dbo.Usuario(nombre,apellido,telefono,correo,passwordHash,rol)
 VALUES(N'Ana',N'Ejemplo',N'0000000000',N'ana@example.com',N'DEMO_NO_AUTENTICABLE','AGENTE');
IF NOT EXISTS (SELECT 1 FROM dbo.Usuario WHERE correo=N'luis@example.com')
 INSERT dbo.Usuario(nombre,apellido,telefono,correo,passwordHash,rol)
 VALUES(N'Luis',N'Ejemplo',N'0000000001',N'luis@example.com',N'DEMO_NO_AUTENTICABLE','AGENTE');
DECLARE @ana INT=(SELECT id FROM dbo.Usuario WHERE correo=N'ana@example.com');
DECLARE @luis INT=(SELECT id FROM dbo.Usuario WHERE correo=N'luis@example.com');
IF NOT EXISTS(SELECT 1 FROM dbo.Propiedad WHERE titulo=N'DEMO Apartamento')
 INSERT dbo.Propiedad(propietarioId,titulo,descripcion,precio,operacion,tipoInmueble,habitaciones,banos,direccion,estado)
 VALUES(@ana,N'DEMO Apartamento',N'Datos ficticios',1500000,'ARRIENDO','APARTAMENTO',2,1,N'Dirección ficticia 123','APROBADA');
IF NOT EXISTS(SELECT 1 FROM dbo.Propiedad WHERE titulo=N'DEMO Casa')
 INSERT dbo.Propiedad(propietarioId,titulo,descripcion,precio,operacion,tipoInmueble,habitaciones,banos,direccion)
 VALUES(@luis,N'DEMO Casa',N'Datos ficticios',250000000,'VENTA','CASA',3,2,N'Dirección ficticia 456');
IF NOT EXISTS(SELECT 1 FROM dbo.Propiedad WHERE titulo=N'DEMO Local')
 INSERT dbo.Propiedad(propietarioId,titulo,descripcion,precio,operacion,tipoInmueble,habitaciones,banos,direccion,estado,motivoRechazo)
 VALUES(@ana,N'DEMO Local',N'Datos ficticios',900000,'ARRIENDO','OTRO',0,1,N'Dirección ficticia 789','RECHAZADA',N'Falta completar información');
COMMIT;
GO
