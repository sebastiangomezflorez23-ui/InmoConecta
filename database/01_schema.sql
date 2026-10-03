-- Base aislada: nunca modifica la base InmoConecta existente.
USE master;
GO
IF DB_ID(N'InmoConecta_Avance1') IS NULL
    EXEC(N'CREATE DATABASE InmoConecta_Avance1');
GO
USE InmoConecta_Avance1;
GO
IF OBJECT_ID(N'dbo.Usuario', N'U') IS NULL
BEGIN
CREATE TABLE dbo.Usuario (
 id INT IDENTITY PRIMARY KEY,
 nombre NVARCHAR(80) NOT NULL,
 apellido NVARCHAR(80) NOT NULL,
 telefono NVARCHAR(25) NOT NULL,
 correo NVARCHAR(254) NOT NULL UNIQUE,
 passwordHash NVARCHAR(255) NOT NULL,
 rol VARCHAR(10) NOT NULL CHECK (rol IN ('COMPRADOR','AGENTE','ADMIN')),
 intentosFallidos INT NOT NULL DEFAULT 0 CHECK (intentosFallidos >= 0),
 bloqueoHasta DATETIME2 NULL
);
END;
IF OBJECT_ID(N'dbo.Propiedad', N'U') IS NULL
BEGIN
CREATE TABLE dbo.Propiedad (
 id INT IDENTITY PRIMARY KEY,
 propietarioId INT NOT NULL REFERENCES dbo.Usuario(id),
 titulo NVARCHAR(150) NOT NULL,
 descripcion NVARCHAR(2000) NOT NULL,
 precio DECIMAL(18,2) NOT NULL CHECK (precio > 0),
 operacion VARCHAR(10) NOT NULL CHECK (operacion IN ('ARRIENDO','VENTA')),
 tipoInmueble VARCHAR(15) NOT NULL CHECK (tipoInmueble IN ('CASA','APARTAMENTO','OTRO')),
 habitaciones SMALLINT NOT NULL CHECK (habitaciones >= 0),
 banos SMALLINT NOT NULL CHECK (banos >= 0),
 direccion NVARCHAR(250) NOT NULL,
 latitud DECIMAL(9,6) NULL CHECK (latitud BETWEEN -90 AND 90),
 longitud DECIMAL(9,6) NULL CHECK (longitud BETWEEN -180 AND 180),
 estado VARCHAR(10) NOT NULL DEFAULT 'PENDIENTE' CHECK (estado IN ('PENDIENTE','APROBADA','RECHAZADA')),
 motivoRechazo NVARCHAR(500) NULL,
 CHECK ((latitud IS NULL AND longitud IS NULL) OR (latitud IS NOT NULL AND longitud IS NOT NULL)),
 CHECK (estado <> 'RECHAZADA' OR (motivoRechazo IS NOT NULL AND LEN(LTRIM(RTRIM(motivoRechazo))) > 0))
);
END;
GO
