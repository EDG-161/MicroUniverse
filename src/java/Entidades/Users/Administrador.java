
package Entidades.Users;

public class Administrador extends Cuentas{

    public Administrador() {
    }

    public Administrador(int id, String email, String nombre, String password, int rol) {
        super(id, email, nombre, password, rol);
    }
    
}
