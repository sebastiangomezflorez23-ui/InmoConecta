# Java inicial

Abrir esta carpeta en IntelliJ, seleccionar JDK 21 y marcar src como Sources Root si no se detecta automáticamente. Ejecutar inmoconecta.Main.

También desde la raíz del repositorio, en PowerShell:

```powershell
javac -encoding UTF-8 -d backend/out backend/src/inmoconecta/*.java
java -cp backend/out inmoconecta.Main
```

Se usan records de Java: sus métodos de acceso son id(), nombre(), etc. Son objetos inmutables; las credenciales no se incluyen para evitar exponerlas al imprimir un usuario. El ejemplo verifica la relación en memoria. Aún faltan autenticación, API HTTP y controlador JDBC de SQL Server.
