package examples.usuarios;

import com.intuit.karate.junit5.Karate;

public class UsuarioRunner {
    @Karate.Test
    Karate testProducto() {
        return Karate.run("usuariosHappyPath").relativeTo(getClass());
    }
}
