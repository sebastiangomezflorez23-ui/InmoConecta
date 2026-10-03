# InmoConecta

Proyecto académico para publicar y buscar vivienda. Este primer avance incluye una interfaz navegable y adaptable, validación local de registro y publicación, dos clases Java y scripts SQL Server con datos ficticios.

## Ejecutar la interfaz

Abrir esta carpeta en VS Code. Desde la terminal:

```powershell
node scripts/serve.mjs
```

Visitar http://127.0.0.1:5500. Detener con Ctrl+C. También se puede abrir frontend/index.html directamente. No requiere instalar paquetes npm.

## Java y SQL

Las instrucciones de Java están en backend/README.md. Para SQL Server, ejecutar database/01_schema.sql, 02_datos_demo.sql y 03_verificaciones.sql en ese orden. Crean una base separada llamada InmoConecta_Avance1 y no modifican InmoConecta. Revisar antes si la base de avance ya existe y contiene trabajo de otra persona.

Con autenticación de Windows en el equipo de desarrollo:

```powershell
sqlcmd -S localhost -E -C -b -f 65001 -i database/01_schema.sql
sqlcmd -S localhost -E -C -b -f 65001 -i database/02_datos_demo.sql
sqlcmd -S localhost -E -C -b -f 65001 -i database/03_verificaciones.sql
```

La opción -C acepta el certificado del servidor local para esa conexión. Se usa aquí por el certificado de desarrollo; en despliegue debe configurarse un certificado confiable. Los datos demo no permiten iniciar sesión: passwordHash contiene un marcador explícito.

## Organización

- frontend: HTML, CSS y JavaScript.
- backend: clases Java 21.
- database: creación, datos ficticios y comprobaciones SQL.
- docs: modelo y evidencia de comprobaciones.
- PLAN_JIRA.md: tareas e historias del semestre.

## Alcance real

Los formularios no envían ni guardan información. No hay login, autorización, mapas, fotografías, API ni conexión Java-SQL todavía. Las historias HU-01 y HU-07 siguen abiertas. Mínimo de contraseña provisional: 8 caracteres. No publicar contraseñas ni tokens en Git.

Código preparado con asistencia de Codex. Cada integrante debe ejecutar, comprender y revisar su parte y registrar sus propios cambios; no atribuir al compañero los commits de este equipo.
