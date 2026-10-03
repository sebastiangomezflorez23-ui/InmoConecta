package inmoconecta;
import java.math.BigDecimal;

public class Main {
    public static void main(String[] args) {
        var agente = new Usuario(1, "Ana", "Ejemplo", "0000000000", "ana@example.com", Usuario.Rol.AGENTE);
        var propiedad = new Propiedad(1, agente.id(), "Apartamento de demostración", "Datos ficticios",
                new BigDecimal("1500000.00"), Propiedad.Operacion.ARRIENDO, Propiedad.TipoInmueble.APARTAMENTO,
                2, 1, "Dirección ficticia 123", Propiedad.Estado.PENDIENTE);
        System.out.println("Agente: " + agente.nombre());
        System.out.println("Propiedad: " + propiedad.titulo() + " | " + propiedad.estado());
        System.out.println("Relación válida: " + (propiedad.propietarioId() == agente.id()));
        System.out.println("Demostración en memoria: sin conexión Java-SQL ni API HTTP.");
    }
}
