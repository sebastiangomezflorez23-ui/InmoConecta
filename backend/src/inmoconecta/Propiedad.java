package inmoconecta;

import java.math.BigDecimal;

public record Propiedad(long id, long propietarioId, String titulo, String descripcion,
        BigDecimal precio, Operacion operacion, TipoInmueble tipoInmueble,
        int habitaciones, int banos, String direccion, Estado estado) {
    public enum Operacion { ARRIENDO, VENTA }
    public enum TipoInmueble { CASA, APARTAMENTO, OTRO }
    public enum Estado { PENDIENTE, APROBADA, RECHAZADA }
    public Propiedad {
        if (id <= 0 || propietarioId <= 0 || titulo == null || titulo.isBlank()
                || descripcion == null || descripcion.isBlank() || direccion == null || direccion.isBlank()
                || precio == null || precio.signum() <= 0 || precio.scale() > 2 || precio.precision() > 18
                || habitaciones < 0 || habitaciones > 32767 || banos < 0 || banos > 32767
                || operacion == null || tipoInmueble == null || estado == null) {
            throw new IllegalArgumentException("Propiedad inválida");
        }
    }
}
