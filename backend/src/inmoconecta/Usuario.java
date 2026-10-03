package inmoconecta;

public record Usuario(long id, String nombre, String apellido, String telefono, String correo, Rol rol) {
    public enum Rol { COMPRADOR, AGENTE, ADMIN }
    public Usuario {
        if (id <= 0 || nombre == null || nombre.isBlank() || apellido == null || apellido.isBlank()
                || telefono == null || telefono.isBlank() || correo == null || correo.isBlank() || rol == null) {
            throw new IllegalArgumentException("Usuario incompleto");
        }
    }
    // Las credenciales se modelarán por separado al implementar autenticación.
}
