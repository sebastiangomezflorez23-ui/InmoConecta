# Plan de trabajo de InmoConecta

Este plan convierte las 17 historias del documento Jira_historias_de_usuario.docx en trabajo técnico y define un primer avance de 10 tareas, cinco por integrante. Se contrastó con InmoConecta.docx y presentacion_InmoConecta.pdf. Las tareas están propuestas, no implementadas ni verificadas todavía. Los códigos T01 y HU-01 son referencias de este plan; Jira asignará sus propias claves.

## Qué entregar en el primer avance

Una interfaz navegable de registro y publicación con validaciones locales, el diseño inicial de la base de datos, scripts SQL verificables y clases de dominio Java que compilen. Todavía no habrá registro real, autenticación, publicación persistida ni mapa. No marcar HU-01 o HU-07 completas por terminar únicamente sus formularios o tablas.

Asignación provisional: integrante A = tú; integrante B = tu compañero. Reemplazar estos nombres en Jira. El PDF menciona a Sebastián Gómez y Jeronimo Bilbao, pero no identifica quién está usando esta conversación.

Presupuesto orientativo: 4–6 horas por integrante incluyendo revisión; puede aumentar si están aprendiendo Git o la instancia SQL Server necesita configuración. Si el profesor exige funcionalidades integradas, este alcance preparatorio deberá ampliarse.

## Las 10 tareas para mañana

Copiar el título, descripción y aceptación de cada ficha a Jira. Crear como subtarea de la historia indicada, o como tarea técnica cuando se señala. Todas comienzan en Por hacer.

### T01 — Crear la estructura del repositorio y las instrucciones de ejecución

- Responsable: A. Tipo: tarea técnica. Prioridad: alta. Estimación: 30 minutos. Dependencias: ninguna.
- Trabajo: crear frontend, backend, database y docs; README con propósito, herramientas y pasos de ejecución; .gitignore para .idea, archivos de compilación, configuraciones privadas y credenciales. Git no guarda directorios vacíos: añadir un README en los que aún no tienen archivos.
- Aceptación: el compañero puede clonar el repositorio y localizar cada parte; no se incluyen contraseñas ni archivos del IDE; el README distingue funcionalidades realizadas y pendientes.
- Evidencia: enlace al commit y captura del árbol de archivos.

### T02 — Maquetar el formulario de registro

- Responsable: A. Historia: HU-01. Prioridad: alta. Estimación: 45 minutos. Dependencia: T01.
- Trabajo: crear frontend/registro.html con nombre, apellido, teléfono, correo, contraseña y rol comprador/arrendatario o agente/propietario; añadir etiquetas y navegación.
- Aceptación: aparecen todos los campos; correo y contraseña usan los tipos HTML adecuados; no existe opción de autorregistro administrador; se puede recorrer el formulario con teclado.
- Evidencia: captura del formulario y enlace al commit. El formulario aún no crea cuentas.

### T03 — Aplicar estilos adaptables a registro

- Responsable: A. Historia: HU-01. Prioridad: media. Estimación: 45 minutos. Dependencia: T02.
- Trabajo: crear frontend/css/styles.css con estilos reutilizables para formularios, botones, navegación y mensajes.
- Aceptación: registro es legible a 360 y 1366 píxeles de ancho, sin desplazamiento horizontal; etiquetas y mensajes no se superponen; foco visible al usar teclado.
- Evidencia: capturas en ambos tamaños y enlace al commit.

### T04 — Validar el registro en JavaScript

- Responsable: A. Historia: HU-01. Prioridad: alta. Estimación: 45 minutos. Dependencia: T02.
- Trabajo: crear frontend/js/registro.js; validar obligatorios, espacios vacíos y formato de correo; mostrar errores junto a los campos. Acordar y documentar una longitud mínima de contraseña como decisión del equipo, no como requisito ya definido en las fuentes.
- Aceptación: datos vacíos o correo inválido impiden continuar; datos válidos muestran «Datos válidos; registro pendiente de conexión al servidor»; no se guardan contraseñas en localStorage ni se imprimen en consola.
- Evidencia: registrar tres casos en docs/pruebas-avance-1.md: vacío, correo inválido y válido.
- Límite: comprobar correo duplicado, aplicar hash y validar de nuevo en servidor quedan para la integración.

### T05 — Crear el formulario básico de publicación

- Responsable: A. Historia: HU-07. Prioridad: alta. Estimación: 60 minutos. Dependencias: T01 y estilos de T03.
- Trabajo: crear frontend/publicar.html y frontend/js/publicar.js con título, descripción, precio, operación (arriendo/venta), tipo de inmueble (casa/apartamento/otro), habitaciones, baños y dirección. Reutilizar estilos.
- Aceptación: no acepta precio menor o igual a cero ni cantidades negativas o fraccionarias de habitaciones/baños; exige los campos acordados; la navegación permite abrir registro y publicación; muestra claramente que es una demostración sin guardado. Revisar también a 360 píxeles.
- Evidencia: captura y casos de datos válidos/inválidos. Fotos, mapa y guardado real quedan pendientes.

### T06 — Diseñar el modelo de Usuario y Propiedad

- Responsable: B. Tipo: tarea técnica vinculada a HU-01 y HU-07. Prioridad: alta. Estimación: 45 minutos. Dependencia: ninguna; acordar nombres de campos con A.
- Trabajo: crear docs/modelo-datos.md con diagrama y diccionario. Usuario: id, nombre, apellido, teléfono, correo, hash de contraseña, rol, intentos fallidos y bloqueo hasta. Propiedad: id, propietarioId, título, descripción, precio, operación, tipoInmueble, habitaciones, baños, dirección, latitud, longitud, estado y motivoRechazo.
- Aceptación: se identifica la relación Usuario 1:N Propiedad, claves, tipos y nulabilidad; dinero usa DECIMAL; teléfono se modela como texto; se distinguen operación y tipo de inmueble. Coordenadas pueden quedar nulas en esta etapa y serán obligatorias al publicar con mapa.
- Evidencia: diagrama y diccionario en el repositorio. Fotos, Favorito y Mensaje se incorporarán en sus historias.

### T07 — Crear la base de datos y la tabla Usuario

- Responsable: B. Historia: HU-01. Prioridad: alta. Estimación: 45 minutos. Dependencia: T06.
- Trabajo: crear database/01_schema.sql con creación de InmoConecta y Usuario; clave primaria, correo único, campos obligatorios y restricciones de roles. El hash incluye los datos necesarios de sal y algoritmo según la biblioteca elegida; nunca guardar la contraseña original.
- Aceptación: script ejecutado sobre una base de desarrollo nueva en SQL Server sin errores; un correo duplicado se rechaza; columnas y restricciones coinciden con T06.
- Evidencia: versión de SQL Server utilizada, resultado de ejecución y prueba de duplicado en docs/pruebas-avance-1.md. No ejecutar sobre una base con información existente.

### T08 — Crear Propiedad y sus restricciones

- Responsable: B. Historia: HU-07. Prioridad: alta. Estimación: 45 minutos. Dependencia: T07.
- Trabajo: ampliar database/01_schema.sql con Propiedad y FK hacia Usuario; precio positivo, habitaciones/baños no negativos, estados pendiente/aprobada/rechazada, operación arriendo/venta y estado predeterminado pendiente.
- Aceptación: se acepta una propiedad válida; se rechazan precio negativo y propietario inexistente; una inserción sin estado queda pendiente. Documentar que la FK no comprueba que el usuario sea agente: esa autorización corresponde al backend.
- Evidencia: consultas de comprobación y resultados en docs/pruebas-avance-1.md.

### T09 — Preparar datos ficticios y consultas de comprobación

- Responsable: B. Tipo: tarea técnica vinculada a HU-01 y HU-07. Prioridad: media. Estimación: 30 minutos. Dependencias: T07 y T08.
- Trabajo: crear database/02_datos_demo.sql y database/03_verificaciones.sql con dos agentes ficticios y tres propiedades de distintos estados; usar correos de ejemplo. Documentar que cualquier hash de marcador no permite autenticación y solo sirve para probar relaciones; reemplazarlo por hashes válidos antes del login real.
- Aceptación: en una base nueva se ejecutan los scripts en orden; JOIN muestra cada propiedad con su propietario; consulta de propiedades públicas devuelve solo aprobadas; se documentan conteos esperados. Pruebas inválidas se aíslan con manejo de errores o transacciones para no impedir las demás comprobaciones.
- Evidencia: resultados SQL y pasos reproducibles. No incluir datos personales reales.

### T10 — Crear las clases de dominio Java

- Responsable: B. Tipo: tarea técnica vinculada a HU-01 y HU-07. Prioridad: alta. Estimación: 60 minutos. Dependencia: T06.
- Trabajo: crear un proyecto Java en backend con clases Usuario y Propiedad, enumeraciones de rol/estado/operación, constructores y métodos de acceso. Usar BigDecimal para precio y tipos coherentes con SQL. Añadir un Main de demostración que cree un agente y una propiedad pendiente.
- Aceptación: compila y ejecuta en IntelliJ; README indica JDK utilizado y cómo ejecutar; se puede verificar la relación por propietarioId; no se imprime el hash ni la contraseña. No afirmar conexión SQL porque todavía no existe.
- Evidencia: salida de ejecución y enlace al commit.

## Orden de ejecución y coordinación

1. A y B acuerdan el diccionario de datos y estructura durante 15 minutos.
2. A realiza T01 y sube la base del repositorio. B puede diseñar T06 mientras tanto; luego clona el repositorio compartido.
3. A avanza T02 → T03 → T04 → T05. B avanza T06 → T07 → T08 → T09; T10 depende de T06 y puede adelantarse.
4. A trabaja principalmente en frontend; B en backend y database. A mantiene README y B modelo-datos. Coordinar la edición del archivo de pruebas para evitar conflictos.
5. Cada uno revisa y ejecuta la parte del otro; integran las ramas, vuelven a comprobar el resultado y adjuntan evidencia a Jira.

## Desglose del resto de historias

Conservar los criterios de aceptación del documento de historias. Las siguientes son tareas propuestas para implementarlos. Las tareas del avance anterior solo cubren parte de HU-01 y HU-07.

| Historia y prioridad original | Tareas pendientes para completar la historia | Dependencias principales |
| --- | --- | --- |
| HU-01 Registro — Must | Conectar Java a SQL Server; implementar registro con validación del servidor y correo único; generar hash con sal mediante biblioteca; conectar formulario por HTTP; probar registro válido, duplicado y rol no permitido | T02–T04, T07, T10 |
| HU-02 Login con bloqueo — Must | Crear pantalla; verificar hash; gestionar sesión y roles; bloquear tras 3 fallos consecutivos; mostrar espera y restablecer contador tras éxito; probar bloqueo y expiración. Acordar duración del bloqueo | HU-01 |
| HU-03 Cerrar sesión — Should | Botón de salida; invalidar sesión en servidor; limpiar estado de interfaz; probar que rutas privadas ya no permiten acceso | HU-02 |
| HU-04 Mapa — Must | Incorporar mapa; guardar ubicación geográfica; consultar propiedades aprobadas dentro del área visible; actualizar al mover/zoom; medir respuesta con volumen y entorno documentados | HU-07, HU-16 |
| HU-05 Filtros — Must | Crear controles de zona, precio, tipo y habitaciones; consulta parametrizada combinada; sincronizar lista y mapa; mensaje vacío y limpiar; probar combinaciones | HU-04 |
| HU-06 Detalle — Must | Endpoint público de propiedad aprobada; página con datos, galería y mapa; contacto del agente; casos de ID inexistente/no público; revisar móvil | HU-07, HU-08 |
| HU-07 Publicar — Must | Endpoint restringido a agentes; obtener propietario desde sesión; validar campos en servidor; seleccionar ubicación; persistir como pendiente; conectar formulario y probar permisos | HU-02, T05, T08, T10 |
| HU-08 Fotos — Must | Acordar límites de tamaño/cantidad y formatos; validar archivos en servidor; almacenamiento y tabla Foto; subir, borrar y ordenar; portada; comprobar autorización sobre propiedad | HU-07 |
| HU-09 Mis publicaciones — Should | Consultar por usuario autenticado; panel con estados y motivo; probar que no se ven propiedades de otros agentes | HU-02, HU-07, HU-16 |
| HU-10 Editar/eliminar propias — Should | Formularios y endpoints; verificar propietario en servidor; confirmación de borrado; actualizar fotos; acordar si cambios requieren nueva aprobación; probar acceso ajeno | HU-08, HU-09 |
| HU-11 Guardar favoritos — Should | Tabla Favorito con pareja usuario/propiedad única; endpoints agregar/quitar; botones en mapa y detalle; requerir sesión; probar duplicados y acceso ajeno | HU-02, HU-04, HU-06 |
| HU-12 Listar favoritos — Should | Consulta privada y tarjetas; estado vacío; indicar propiedad retirada mediante baja lógica o estrategia equivalente; probar aislamiento entre usuarios | HU-11 y acuerdo de borrado en HU-10/HU-17 |
| HU-13 Mensaje al agente — Must | Tabla Mensaje; formulario de contacto; validación servidor; relacionar propiedad y destinatario; persistir y confirmar; probar entrada inválida y propiedad no disponible | HU-06 |
| HU-14 WhatsApp — Should | Normalizar teléfono con país; construir enlace y texto codificado con título; botón; probar número ausente y caracteres especiales | HU-06 |
| HU-15 Bandeja de mensajes — Must | Consulta restringida al agente receptor; panel con propiedad, remitente y fecha; marcar leído; comprobar que otro agente no accede | HU-02, HU-13 |
| HU-16 Moderación — Must | Crear administrador de forma controlada; proteger rutas; listar pendientes; aprobar/rechazar con motivo obligatorio; probar aparición en búsqueda y permisos | HU-02, HU-07 |
| HU-17 Gestión administrativa — Should | Editar/eliminar cualquier publicación solo como administrador; confirmación; coherencia con favoritos/fotos/mensajes; pruebas de permisos | HU-16 |

## Etapas siguientes

1. Avance inicial: las 10 tareas de este plan.
2. Flujo integrado: conexión Java–SQL Server, HU-01, HU-02, HU-03, publicación persistida de HU-07 y moderación mínima HU-16.
3. Búsqueda: ubicación, fotos, detalle, mapa y filtros (HU-04 a HU-08), y gestión del agente (HU-09, HU-10).
4. Contacto y favoritos: HU-11 a HU-15; completar HU-17.
5. Entrega final: diagramas pendientes, pruebas, despliegue en nube y medición de requisitos no funcionales.

El 99 % de disponibilidad requiere definir período y monitorización; no se demuestra con una ejecución local. Para el objetivo de búsquedas menores de 2 segundos se deben documentar datos, entorno y mediciones. Hash con sal es almacenamiento seguro por hash, no cifrado reversible.

## Cómo llevarlo a Jira

Mantener las seis épicas originales: Cuentas y acceso; Búsqueda de propiedades; Publicación y gestión; Favoritos; Contacto; Administración. Debajo, conservar HU-01 a HU-17 con sus criterios originales.

Crear T02/T03/T04/T07 bajo HU-01 y T05/T08 bajo HU-07 como subtareas si el proyecto lo permite. T01/T06/T09/T10 son tareas técnicas con vínculos a las historias indicadas. Si el tablero no usa subtareas, crear las diez como tareas y poner la historia relacionada en la descripción. Evitar duplicarlas usando ambos métodos.

Usar columnas Por hacer → En progreso → En revisión → Hecho y una etiqueta avance-1. Añadir responsable real, estimación y dependencia. Vincular commits o solicitudes de cambio; una tarea solo pasa a Hecho al satisfacer sus propios criterios y ser revisada. Las historias completas quedan abiertas hasta satisfacer todos sus criterios, incluidos backend y persistencia.

## Arquitectura acordada para orientar el desarrollo

Navegador (HTML/CSS/JavaScript, editado en VS Code) → API HTTP en Java (IntelliJ) → SQL Server.

JavaScript enviará solicitudes al servidor Java; el servidor validará datos, permisos y acceso SQL mediante consultas parametrizadas. El navegador no debe conectarse directamente a SQL Server ni contener credenciales. Para mañana, frontend, clases Java y SQL pueden demostrarse por separado, indicando esa limitación.

Antes de integrar, elegir con el docente la forma de servir HTTP en Java y registrar las versiones del JDK y dependencias. Si el curso ya usa un framework, seguir ese marco. La elección y configuración del framework no está resuelta por los documentos.

## Git y GitHub paso a paso

La carpeta revisada ya tiene Git en la rama main, sin commits y sin remoto configurado. No volver a ejecutar git init aquí. El repositorio de GitHub y la invitación al compañero todavía deben crearse.

1. Un integrante crea un repositorio vacío en GitHub e invita al otro como colaborador. Si se parte de esta carpeta, no inicializar el remoto con otro README para evitar historiales separados.
2. Cada integrante configura su propia identidad en su equipo; usar el correo asociado a su GitHub o su correo privado noreply. Nunca hacer commits usando la identidad del compañero.

```powershell
git config user.name "TU NOMBRE"
git config user.email "TU CORREO"
```

3. A termina T01 y hace el commit inicial. Ejecutar solo cuando existan esos archivos. Revisar qué se va a guardar antes del commit.

```powershell
git status
git add README.md .gitignore frontend backend database docs
git diff --cached
git commit -m "T01: crear estructura y guia del proyecto"
git remote add origin https://github.com/USUARIO/REPOSITORIO.git
git push -u origin main
git switch -c codex/avance-1-interfaz
```

Reemplazar USUARIO/REPOSITORIO con la dirección real. La autenticación de GitHub se realiza con el mecanismo configurado en el equipo; no guardar tokens en archivos del proyecto.

4. B clona desde su propio equipo y crea su rama.

```powershell
git clone https://github.com/USUARIO/REPOSITORIO.git
cd REPOSITORIO
git switch -c codex/avance-1-datos-java
```

5. Cada integrante guarda cambios coherentes a medida que termina tareas. Ejemplo de A tras completar la maqueta y sus estilos:

```powershell
git add frontend/registro.html frontend/css/styles.css
git diff --cached
git commit -m "T02 T03: agregar registro responsive"
git push -u origin codex/avance-1-interfaz
```

Ejemplo de B tras terminar modelo y tablas:

```powershell
git add docs/modelo-datos.md database/01_schema.sql
git diff --cached
git commit -m "T06 T07 T08: agregar modelo y tablas iniciales"
git push -u origin codex/avance-1-datos-java
```

6. A hace otro commit para T04/T05 y B otro para T09/T10. Incluir también sus evidencias. Preferiblemente hacer un commit por tarea cuando cada cambio tenga sentido de forma independiente. Usar las claves reales de Jira en los mensajes una vez creadas.
7. Cada integrante abre una pull request hacia main y el otro revisa. Conservar los commits individuales al integrar si la evaluación cuenta su autoría e historial; una combinación que los reduzca a uno puede ocultar ese detalle. Resolver conflictos revisando contenido, sin sobrescribir a ciegas el trabajo ajeno.
8. Tras integrar ambas ramas, cada uno actualiza main y comprueba el conjunto:

```powershell
git switch main
git pull origin main
git log --oneline --all --graph
git log --format="%h | %an | %s"
git status
```

Un commit es un conjunto de cambios guardados en Git; no es equivalente a una tarea de Jira. Este plan propone al menos dos commits de trabajo por integrante mientras se confirma si el profesor pide dos totales o dos por persona. No crear commits vacíos ni atribuir trabajo a alguien que no lo realizó.

## Evidencia para entregar

- Enlace al repositorio y hash de la versión entregada.
- Tablero con las diez tareas y cinco asignadas a cada integrante; estado según avance real.
- Enlaces a commits y pull requests con autoría de ambos.
- Capturas de registro y publicación, incluidas las validaciones y vista móvil.
- Scripts SQL y resultados de restricciones y consultas.
- Clases Java y evidencia de compilación/ejecución.
- README reproducible y lista explícita de pendientes de integración.

No se ha creado ninguna tarea en Jira ni publicado código en GitHub con este documento. Tampoco se han implementado estas diez tareas: este es el plan para ejecutarlas y demostrar su cumplimiento.
