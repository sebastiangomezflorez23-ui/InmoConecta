# Comprobaciones del primer avance

Ejecutadas en el equipo local durante la preparación del avance. Código asistido por Codex; pendiente revisión de ambos integrantes.

| Comprobación | Resultado observado |
| --- | --- |
| GitHub por SSH con la URL suministrada | Acceso correcto; remoto inicialmente sin referencias |
| Java y compilador | Temurin JDK 21.0.12 disponibles |
| Compilar y ejecutar inmoconecta.Main | Correcto; propiedad PENDIENTE y relación válida |
| JavaScript | node --check correcto en ambos formularios y servidor local |
| SQL Server | Servicio MSSQLSERVER activo; conexión Windows correcta aceptando certificado local por conexión |
| Base existente | InmoConecta detectada y conservada |
| Base de pruebas | InmoConecta_Avance1 creada con Usuario y Propiedad |
| Datos SQL | Dos agentes ficticios y tres propiedades; una aprobada, una pendiente y una rechazada |
| Restricciones SQL | Rechazados correo duplicado, propietario inexistente y precio negativo |
| Consulta pública SQL | Solo devuelve DEMO Apartamento, aprobada |
| Registro vacío en navegador | Errores por campo y foco en el primer dato faltante |
| Registro con correo inválido | Mensaje de correo inválido |
| Registro válido | Mensaje de validación correcta y conexión al servidor pendiente |
| Publicación con precio -1 y habitaciones 1.5 | Ambos datos rechazados con mensajes específicos |
| Publicación válida | Mensaje explícito de demostración sin guardado |
| Formularios a 360 píxeles | Medición DOM sin desbordamiento horizontal |
| Consola del navegador | Sin errores JavaScript registrados durante estas pruebas |

No se ha verificado la integración Java-SQL, porque no está implementada. No se ha accedido a Jira: falta el enlace del tablero. VS Code e IntelliJ están instalados; su flujo de apertura manual no se automatizó.

Para repetir: seguir README.md, ejecutar database/03_verificaciones.sql y probar los formularios con datos ficticios. No confundir la finalización de estas tareas preparatorias con la aceptación completa de HU-01 o HU-07.
